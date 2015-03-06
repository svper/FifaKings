'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
    .controller('MainCtrl', ['$scope', '$timeout',function($scope,$timeout) {
        $scope.alert = {};

        $scope.$on('throwAlert', function(event, alert) {
            $scope.alert = alert
            $timeout(function() {
                $scope.alert = {};
            }, 3000);
        });
    }]);
