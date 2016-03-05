/* global angular */

(function() {
  angular.module("app").controller("fteCtrl", ["$scope", function($scope) {
    $scope.totalActualFte = function(first, second) {
      first + second;
    };
  }]);
})();
