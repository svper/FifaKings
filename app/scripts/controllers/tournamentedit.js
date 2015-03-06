'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:TournamenteditCtrl
 * @description
 * # TournamenteditCtrl
 * Controller of the fifaKingsV2App
 */
 angular.module('fifaKingsV2App')
 .controller('TournamentEditCtrl',['$scope','$location','UserService','TournamentService', function ($scope,$location,UserService,TournamentService) {
 	$scope.tournament = {
 		leagueId:1,
 		version:15,
 		players :[]
 	};

 	UserService.getUsers().then(
 		function(records) {
 			$scope.users = records;
 		},
 		function(data) {
 			console.log('users retrieval failed.');
 		}
 		);

 	$scope.addPlayerToTournament = function(player){
 		if(player && player.firstName)
 			$scope.tournament.players.push(player);
 	};

 	$scope.removePlayer = function(player){
 		_.pullAt($scope.tournament.players, _.findIndex($scope.tournament.players, 'id', player.id));
 		$scope.selectedPlayer = '';
 	};

 	$scope.submitForm = function (isValid){
 		if (isValid){
 			$scope.tournament.hostId = $scope.tournament.host.id;
 			TournamentService.add($scope.tournament)
 			.then(function(tournamentId) {
 				console.log('savveeeeddd');
 				$location.path('/tournament/'+ tournamentId);
 				$scope.$emit('throwAlert', {
 					style: 'success',
 					message: 'Tournament added!'
 				});
 			});
 		}
 	};

 }]);
