/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("LoiFormController", ["$scope", "$http", "$uibModal", function($scope, $http, $uibModal) {
    /*
    Note that the $uibModal documentation on https://angular-ui.github.io/bootstrap/
    is out of date. I recommend building any modals using this controller and it's
    corresponding view as a template.
    */

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
      var modalInstance = $uibModal.open({ //creates new modal instance with the following properties
        animation: true,
        templateUrl: 'loiRatingContent.html',
        controller: 'LoiModalCtrl',
        size: "md",
        resolve: {
          /*
          Modals operate on a different controller and scope. Build a variable to pass
          any data needed from this scope to the modal.
          */
          modalData: function() {
            return $scope.modalData;
          }
        }
      });

      modalInstance.result.then(function(modalResponse) { //This funciton is run upon closing the modal
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

  angular.module("app").controller("LoiModalCtrl", ["$scope", "$http", "$uibModalInstance", "modalData", function($scope, $http, $uibModalInstance, modalData) { //note that modalData is passed here
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
        $scope.totalAverage = calculateAverage(response.data.ratings);
        calculateTotals(response.data.ratings);
      }, function(errors) {
        console.log(errors);
      });
    };

    var calculateAverage = function(ratings) {
      var sum = 0;
      for (var i = ratings.length - 1; i >= 0; i--) {
        sum += ratings[i].average;
      }
      return sum / ratings.length; //Note that this should probably be upgraded to round percentage to 2 decimals.
    };

    var calculateTotals = function(ratings) {
      $scope.totalYes = 0;
      $scope.totalMaybe = 0;
      $scope.totalNo = 0;
      for (var i = ratings.length - 1; i >= 0; i--) {
        switch (ratings[i].q5) {
        case "Yes":
          $scope.totalYes += 1;
          break;
        case "Maybe":
          $scope.totalMaybe += 1;
          break;
        case "No":
          $scope.totalNo += 1;
          break;
        }
      }
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
    
    $scope.closeModal = function() { //this closes the modal without calling the above result function
      $uibModalInstance.dismiss('cancel');
    };

    window.$scope = $scope;
  }]);
})();