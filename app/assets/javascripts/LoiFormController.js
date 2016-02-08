/* global angular */

(function() {
  "use strict";
  angular.module('app').controller('LoiFormController', ["$scope", "$uibModal", function($scope, $uibModal) {

    $scope.setup = function() {
      $scope.sampleLoi = {
        name: "The something foundation"
      };
      $scope.items = ['item1', 'item2', 'item3'];
    };

    $scope.openRatingModal = function() {
      var modalInstance = $uibModal.open({
        animation: true,
        templateUrl: 'loiModalContent.html',
        controller: 'LoiModalCtrl',
        size: "lg",
        resolve: {
          loiForm: function() {
            return $scope.sampleLoi;
          }
        }
      });

      modalInstance.result.then(function(submittedRatings) {
        console.log(submittedRatings);
      });
    };

    window.$scope = $scope;
  }]);

  angular.module('app').controller('LoiModalCtrl', function($scope, $uibModalInstance, loiForm) {

    $scope.loiForm = loiForm;
    // $scope.items = items;
    // $scope.selected = {
    //   item: $scope.items[0]
    // };

    $scope.submitRating = function() {
      $uibModalInstance.close(/* $scope.selected.item */);
    };

    $scope.cancelRating = function() {
      $uibModalInstance.dismiss('cancel');
    };

  });
})();