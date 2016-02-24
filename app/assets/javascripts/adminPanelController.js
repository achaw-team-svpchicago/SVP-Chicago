/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("adminPanelController", ["$scope", "$http", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/admin_panel").success(function(response) {
        $scope.partners = response.partners;
        $scope.admins = response.admins;
        $scope.invitee = {super_admin: false};
      });
    };

    $scope.invitePartner = function(invitee) {
      $http.post("/admin_panel", invitee).success(function() {
        $scope.invitee = {super_admin: false};
      }).error(function(response) {
        console.log(response);
      });
    };

    window.$scope = $scope;
  }]);
})();