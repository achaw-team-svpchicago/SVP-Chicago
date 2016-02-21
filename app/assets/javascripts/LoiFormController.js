/* global angular */

(function() {
  "use strict";
  angular.module('app').controller('LoiFormController', ["$scope", "$http", "$uibModal", function($scope, $http, $uibModal) {

    $scope.setup = function(loiFormId, userId) {
      var url = "/api/v1/loi_forms/" + loiFormId;
      $http.get(url).then(function(response) {
        $scope.loiForm = response.data.loi_form;
        $scope.ratedByUser = response.data.user.rated;
        $scope.userAverageRating = response.data.user.average_rating;
        $scope.userInvitedNonProfit = response.data.user.invited;
        $scope.modalData = {
          loiFormId: loiFormId,
          loiName: $scope.loiForm.name,
          userId: userId
        };
      });
    };

    $scope.openRatingModal = function() {
      var modalInstance = $uibModal.open({
        animation: true,
        templateUrl: 'loiModalContent.html',
        controller: 'LoiModalCtrl',
        size: "md",
        resolve: {
          modalData: function() {
            return $scope.modalData;
          }
        }
      });

      modalInstance.result.then(function(modalResponse) {
        $scope.ratedByUser = true;
        $scope.userAverageRating = modalResponse.average_rating;
        $scope.userInvitedNonProfit = modalResponse.invited;
      });
    };

    window.$scope = $scope;
  }]);

  angular.module('app').controller('LoiModalCtrl', ["$scope", "$http", "$uibModalInstance", "modalData", function($scope, $http, $uibModalInstance, modalData) {

    $scope.loiName = modalData.loiName;
    $scope.ratings = {
      userId: modalData.userId,
      loiFormId: modalData.loiFormId,
      "q1": 0,
      "q2": 0,
      "q3": 0,
      "q4": 0,
      "q5": 0
    };

    $scope.submitRating = function(submittedRatings) {
      var ratings = {ratings: submittedRatings};
      var url = "/api/v1/loi_forms/" + $scope.loiFormId;
      $http.post(url, ratings).success(function(response) {
        $uibModalInstance.close(response);
      }).error(function(response) {
        $scope.invalid = true;
        console.log(response);
      });
    };
    
    $scope.cancelRating = function() {
      $uibModalInstance.dismiss('cancel');
    };

    window.$scope = $scope;
  }]);
})();