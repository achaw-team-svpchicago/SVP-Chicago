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
        size: "md",
        resolve: {
          loiForm: function() {
            return $scope.loiForm;
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
    $scope.ratings = [0, 0, 0, 0, 0];

    $scope.submitRating = function() {
      $uibModalInstance.close($scope.ratings);
    };

    $scope.cancelRating = function() {
      $uibModalInstance.dismiss('cancel');
    };

    window.$scope = $scope;
  });
})();