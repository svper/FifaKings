'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:TournamentCtrl
 * @description
 * # TournamentCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
  .controller('TournamentCtrl',['$scope','TournamentService','PlayerService','MatchService','$routeParams', function ($scope,TournamentService,PlayerService,MatchService,$routeParams) {
        $scope.tid = $routeParams.tid;


        TournamentService.getTournament($scope.tid).then(
            function(record) {
                $scope.tournament = record;
            },
            function(data) {
                console.log('tournament retrieval failed.');
            }
        );

        PlayerService.getTournamentTable($scope.tid).then(
            function(record) {
                $scope.players = record;
            },
            function(data) {
                console.log('tournament retrieval failed.');
            }
        );

        MatchService.getTournamentMatches($scope.tid).then(
            function(record) {
                $scope.matches = record;
            },
            function(data) {
                console.log('tournament retrieval failed.');
            }
        );


  }]);
