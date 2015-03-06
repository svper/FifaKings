'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:TournamentsCtrl
 * @description
 * # TournamentsCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
  .controller('TournamentsCtrl', ['$scope','TournamentService',function ($scope,TournamentService) {
TournamentService.getTournaments().then(
        function(records) {
            $scope.tournaments = records;
        },
        function(data) {
            console.log('tournaments retrieval failed.');
        }
        );
  }]);
