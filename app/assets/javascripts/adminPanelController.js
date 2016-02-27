/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("adminPanelController", ["$scope", "$http", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/admin_panel").success(function(response) {
        $scope.partners = response.partners;
        $scope.admins = response.admins;
        $scope.invitee = {super_admin: false};
        $scope.showPartnerEditForm = [];
        $scope.showAdminEditForm = [];
      });
    };

    $scope.invitePartner = function(invitee) {
      $http.post("/admin_panel", invitee).success(function(response) {
        console.log(response);
        if (invitee.super_admin) {
          $scope.admins.push({
            firstName: response.first_name,
            lastName: response.last_name,
            email: response.email,
            confirmed: response.confirmed
          });
        } else {
          $scope.partners.push({
            firstName: response.first_name,
            lastName: response.last_name,
            email: response.email,
            confirmed: response.confirmed
          });
        }
        $scope.invitee = {super_admin: false};
      }).error(function(response) {
        console.log(response);
      });
    };

    $scope.toggleEditForm = function(user, index, table) {
      if ($scope.showAdminEditForm[index] || $scope.showPartnerEditForm[index]) {
        $scope.showAdminEditForm[index] = false;
        $scope.showPartnerEditForm[index] = false;
      } else {
        $scope.closeEditForms();
        $scope.updatedUser = Object.create(user);
        switch (table) {
        case "admin":
          $scope.showAdminEditForm[index] = true;
          break;
        case "partner":
          $scope.showPartnerEditForm[index] = true;
          break;
        }
      }
    };

    $scope.closeEditForms = function() {
      $scope.showPartnerEditForm = [];
      $scope.showAdminEditForm = [];
      $scope.updatedUser = {};
    };

    $scope.updateUser = function(user, updatedUser, index, table) {
      var userAttributes = {
        id: user.id,
        first_name: updatedUser.firstName,
        last_name: updatedUser.lastName,
        email: updatedUser.email
      };
      $http.patch("/admin_panel", userAttributes).then(function(response) {
        console.log(response);
        switch (table) {
        case "admin":
          $scope.admins[index] = {
            email: response.data.email,
            firstName: response.data.first_name,
            lastName: response.data.last_name
          };
          break;
        case "partner":
          $scope.partners[index] = {
            email: response.data.email,
            firstName: response.data.first_name,
            lastName: response.data.last_name
          };
          break;
        }
        $scope.closeEditForms();
      });
    };

    window.$scope = $scope;
  }]);
})();