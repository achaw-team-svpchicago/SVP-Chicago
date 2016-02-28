/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("adminPanelController", ["$scope", "$http", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/admin_panel").success(function(response) {
        $scope.response = response;
        $scope.users = response.users;
        $scope.sortUsers($scope.users);
        $scope.invitee = {super_admin: false};
        $scope.showPartnerEditForm = [];
        $scope.showAdminEditForm = [];
      });
    };

    $scope.sortUsers = function(users) {
      $scope.partners = [];
      $scope.admins = [];
      for (var i = users.length - 1; i >= 0; i--) {
        switch (users[i].superAdmin) {
        case true:
          $scope.admins.push(users[i]);
          break;
        case false:
          $scope.partners.push(users[i]);
          break;
        }
      }
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

    $scope.toggleEditForm = function(user, index) {
      if ($scope.showAdminEditForm[index] || $scope.showPartnerEditForm[index]) {
        $scope.showAdminEditForm[index] = false;
        $scope.showPartnerEditForm[index] = false;
      } else {
        $scope.closeEditForms();
        $scope.updatedUser = Object.create(user);
        switch (user.superAdmin) {
        case true:
          $scope.showAdminEditForm[index] = true;
          break;
        case false:
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

    $scope.updateUser = function(user, updatedUser, index) {
      var userAttributes = {
        id: user.id,
        first_name: updatedUser.firstName,
        last_name: updatedUser.lastName,
        email: updatedUser.email
      };
      $http.patch("/admin_panel", userAttributes).then(function(response) {
        console.log(response);
        switch (user.superAdmin) {
        case true:
          $scope.admins[index] = {
            email: response.data.email,
            firstName: response.data.first_name,
            lastName: response.data.last_name
          };
          break;
        case false:
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

    $scope.deleteUser = function(user, index) {
      var url = "/admin_panel/" + user.id;
      $http.delete(url).then(function() {
        switch (user.superAdmin) {
        case true:
          $scope.admins.splice(index, 1);
          break;
        case false:
          $scope.partners.splice(index, 1);
          break;
        }
      });
    };

    $scope.toggleAdminRights = function(user, index) {
      var url = "/admin_panel/" + user.id;
      $http.patch(url).then(function() {
        switch (user.superAdmin) {
        case true:
          $scope.admins.splice(index, 1);
          $scope.partners.push(user);
          break;
        case false:
          $scope.partners.splice(index, 1);
          $scope.admins.push(user);
          break;
        }
      });
    };

    window.$scope = $scope;
  }]);
})();