'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:MatchCtrl
 * @description
 * # MatchCtrl
 * Controller of the fifaKingsV2App
 */
 angular.module('fifaKingsV2App')
 .controller('MatchCtrl', ['$scope','UserService','TeamService','MatchService','$routeParams','$location',function ($scope,UserService,TeamService,MatchService,$routeParams,$location) {

 	$scope.tid = $routeParams.tid;
 	 	$scope.teams = TeamService.getTeams();
 	$scope.players = UserService.getUsersTournament($scope.tid);


 	$scope.submitForm = function (isValid){
 		if (isValid){

 			MatchService.add($scope.home,$scope.away,$scope.tid)
 			.then(function(matchId) {
 				$location.path('/tournament/'+ $scope.tid);
 				$scope.$emit('throwAlert', {
 					style: 'success',
 					message: 'Match saved!'
 				});
 			});
 		}
 	};

 }]);
