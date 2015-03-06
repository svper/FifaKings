'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:MatchCtrl
 * @description
 * # MatchCtrl
 * Controller of the fifaKingsV2App
 */
 angular.module('fifaKingsV2App')
 .controller('MatchCtrl', ['$scope','PlayerService','TeamService',function ($scope,PlayerService,TeamService) {
 	$scope.teams = TeamService.getTeams();
 	$scope.players = PlayerService.getPlayers();

 }]);
