/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("adminPanelController", ["$scope", "$http", function($scope, $http) {


    $scope.invitee = {super_admin: false};

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