'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:MatchesCtrl
 * @description
 * # MatchesCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
    .controller('MatchesCtrl', ['$scope', 'MatchService', 'matches', function($scope, MatchService, matches) {

        $scope.matches = matches;
    }]);
