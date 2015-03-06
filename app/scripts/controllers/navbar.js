'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:NavbarCtrl
 * @description
 * # NavbarCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
  .controller('NavbarCtrl',['$scope','$location', function ($scope,$location) {
   $scope.isActive = function (viewLocation) { 
        return viewLocation === $location.path();
    };

  }]);
