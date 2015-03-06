'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:MatchesCtrl
 * @description
 * # MatchesCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
  .controller('MatchesCtrl',[ '$scope','MatchService',function ($scope,MatchService) {

 MatchService.getListMatches().then(
        function(records) {
        	console.log(records);
            $scope.matches = records;
        },
        function(data) {
            console.log('teams retrieval failed.');
        }
        );

  }]);
