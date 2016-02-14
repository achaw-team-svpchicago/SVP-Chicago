/* global angular */

(function() {
  "use strict";
  angular.module('app').controller('LoiFormController', ["$scope", "$http", "$uibModal", function($scope, $http, $uibModal) {

    $scope.setup = function() {
      $scope.loiFormId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/v1/loi_forms/" + $scope.loiFormId;
      $http.get(url).then(function(response) {
        $scope.loiForm = response.data.loi_form;
        $scope.ratedByUser = response.data.user.rated;
        $scope.userAverageRating = response.data.user.average_rating;
        $scope.userInvitedNonProfit = response.data.user.invited;
        $scope.modalData = {
          loiFormId: $scope.loiFormId,
          loiName: $scope.loiForm.name,
          userId: response.data.user.user_id
        };
        console.log(response);
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

      modalInstance.result.then(function(submittedRatings) {
        var ratings = {ratings: submittedRatings};
        var url = "/api/v1/loi_forms/" + $scope.loiFormId;
        $http.post(url, ratings).then(function(response) {
          $scope.ratedByUser = true;
          $scope.userAverageRating = response.data.average_rating;
          $scope.userInvitedNonProfit = response.data.invited;
        }, function(errors) {
          console.log(errors);
        });
      });
    };
    

    window.$scope = $scope;
  }]);

  angular.module('app').controller('LoiModalCtrl', function($scope, $uibModalInstance, modalData) {

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

    $scope.invalid = [];
    
    $scope.submitRating = function() {
      var validEntry = true;
      for (var i = 1; i < 6; i++) {
        if ($scope.ratings["q" + i] === 0) {
          $scope.invalid[i] = true;
          validEntry = false;
        }
      }
      if (validEntry) {
        $uibModalInstance.close($scope.ratings);
      }
    };

    $scope.cancelRating = function() {
      $uibModalInstance.dismiss('cancel');
    };

    window.$scope = $scope;
  });
})();