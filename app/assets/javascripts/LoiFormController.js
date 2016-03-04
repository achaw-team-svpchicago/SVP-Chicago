/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("LoiFormController", ["$scope", "$http", "$uibModal", function($scope, $http, $uibModal) {

    $scope.setup = function(loiFormId, userId, superAdmin) {
      var url = "/api/v1/loi_forms/" + loiFormId;
      $http.get(url).then(function(response) {
        $scope.loiForm = response.data.loi_form;
        $scope.contactInfo = response.data.contact_info;
        $scope.ratedByUser = response.data.user.rated;
        $scope.userAverageRating = response.data.user.average_rating;
        $scope.userInvitedNonProfit = response.data.user.invited;
        $scope.modalData = {
          loiFormId: loiFormId,
          loiName: $scope.loiForm.name,
          userId: userId
        };
        $scope.superAdmin = superAdmin;
      });
    };

    $scope.openRatingModal = function() {
      var modalInstance = $uibModal.open({
        animation: true,
        templateUrl: 'loiRatingContent.html',
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

    $scope.openReviewModal = function() {
      var modalInstance = $uibModal.open({
        animation: true,
        templateUrl: 'loiReviewContent.html',
        controller: 'LoiModalCtrl',
        size: 'lg',
        resolve: {
          modalData: function() {
            return $scope.modalData.loiFormId;
          }
        }
      });

      modalInstance.result;
    };

    window.$scope = $scope;
  }]);

  angular.module("app").controller("LoiModalCtrl", ["$scope", "$http", "$uibModalInstance", "modalData", function($scope, $http, $uibModalInstance, modalData) {
    $scope.modalData = modalData;

    $scope.setupRating = function() {
      $scope.loiName = $scope.modalData.loiName;
      $scope.ratings = {
        userId: $scope.modalData.userId,
        loiFormId: $scope.modalData.loiFormId,
        "q1": 0,
        "q2": 0,
        "q3": 0,
        "q4": 0,
        "q5": 0,
        "comment": ""
      };
    };

    $scope.setupReview = function() {
      var url = "/api/v1/loi_forms/review/" + $scope.modalData;
      $http.get(url).then(function(response) {
        $scope.ratings = response.data.ratings;
      }, function(errors) {
        console.log(errors);
      });
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
    
    $scope.closeModal = function() {
      $uibModalInstance.dismiss('cancel');
    };

    window.$scope = $scope;
  }]);
})();