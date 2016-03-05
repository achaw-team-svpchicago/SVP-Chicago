/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("adminPanelController", ["$scope", "$http", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/admin_panel").success(function(response) {
        $scope.users = response.users;
        $scope.sortUsers($scope.users);
        $scope.invitee = {super_admin: false};
        $scope.showPartnerEditForm = []; //These arrays control the visibility of edit forms on the DOM.
        $scope.showAdminEditForm = [];
      });
    };

    $scope.sortUsers = function(users) {
      /* This function sorts users into admin and parter tables. It is called to reset the
      state of the user tables in a functional manner */
      console.log("foo");
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

    $scope.toggleEditForm = function(user, index) {
      if ($scope.showAdminEditForm[index] || $scope.showPartnerEditForm[index]) {
        $scope.showAdminEditForm[index] = false;
        $scope.showPartnerEditForm[index] = false;
      } else {
        $scope.closeEditForms();
        $scope.updatedUser = Object.create(user); //updatedUser = user caused pointing issues
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

    $scope.invitePartner = function(invitee) {
      $http.post("/api/v1/admin_panel", invitee).success(function(response) {
        $scope.users.push(response.user);
        $scope.invitee = {super_admin: false};
        $scope.sortUsers($scope.users);
      });
    };

    $scope.updateUser = function(user, updatedUser) {
      var userAttributes = {
        id: user.id,
        first_name: updatedUser.firstName,
        last_name: updatedUser.lastName,
        email: updatedUser.email
      };
      $http.patch("/api/v1/admin_panel/", userAttributes).then(function(response) {
        $scope.response = response;
        for (var i = $scope.users.length - 1; i >= 0; i--) {
          if ($scope.users[i].id === response.data.user.id) {
            $scope.users[i] = response.data.user;
          }
        }
        $scope.sortUsers($scope.users); //reset user tables with updated list of users
        $scope.closeEditForms();
      });
    };

    $scope.deleteUser = function(user) {
      var url = "/api/v1/admin_panel/" + user.id;
      $http.delete(url).then(function(response) {
        for (var i = $scope.users.length - 1; i >= 0; i--) {
          if ($scope.users[i].id === response.data.user.id) {
            $scope.users.splice(i, 1);
          }
        }
        $scope.sortUsers($scope.users);
      });
    };

    $scope.toggleAdminRights = function(user) {
      var url = "/api/v1/admin_panel/" + user.id;
      $http.patch(url).then(function(response) {
        for (var i = $scope.users.length - 1; i >= 0; i--) {
          if ($scope.users[i].id === response.data.user.id) {
            $scope.users[i] = response.data.user;
          }
        }
        $scope.sortUsers($scope.users);
      });
    };

    $scope.resendActivation = function(user) {
      var url = "/api/v1/admin_panel/" + user.id;
      $http.post(url).then(function(response) {
        console.log(response);
      });
    };

    window.$scope = $scope;
  }]);
})();