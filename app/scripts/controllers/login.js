'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:LoginCtrl
 * @description
 * # LoginCtrl
 * Controller of the fifaKingsV2App
 */
 angular.module('fifaKingsV2App')
 .controller('LoginCtrl', ['$scope','$location','PlayerService',function ($scope,$location,PlayerService) {

 	$scope.validateLogin = function(user){
 		UserService.login(user.login,user.password);
 	};

 	 	$scope.register = function(){
 		$location.path('/register');
 	};
 }]);
