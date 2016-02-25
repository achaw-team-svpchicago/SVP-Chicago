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
        switch (table) {
        case "admin":
          $scope.updatedFirstName = user.firstName;
          $scope.updatedLastName = user.lastName;
          $scope.updatedEmail = user.email;
          $scope.showAdminEditForm[index] = !$scope.showAdminEditForm[index];
          break;
        case "partner":
          $scope.updatedName = user.firstName + " " + user.lastName;
          $scope.updatedEmail = user.email;
          $scope.showPartnerEditForm[index] = !$scope.showPartnerEditForm[index];
          break;
        }
      }
    };

    $scope.closeEditForms = function() {
      $scope.showPartnerEditForm = [];
      $scope.showAdminEditForm = [];
    };

    window.$scope = $scope;
  }]);
})();