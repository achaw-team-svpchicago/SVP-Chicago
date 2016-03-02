/* global angular */

(function() {
  angular.module("app").controller("fteCtrl", function($scope) {
    $scope.totalActualFte = function(first, second) {
      first + second;
    };
  });
})();