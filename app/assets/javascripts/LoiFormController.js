/* global angular */

(function() {
  "use strict";
  angular.module('app').controller('LoiFormController', ["$scope", "$http", "$uibModal", function($scope, $http, $uibModal) {

    $scope.setup = function() {
      var loiFormId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/v1/loi_forms/" + loiFormId;
      $http.get(url).then(function(response) {
        $scope.loiForm = response.data;
      });
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