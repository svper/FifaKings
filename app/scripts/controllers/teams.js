'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:TeamsCtrl
 * @description
 * # TeamsCtrl
 * Controller of the fifaKingsV2App
 */
 angular.module('fifaKingsV2App')
 .controller('TeamsCtrl', ['$scope','TeamService', function($scope, TeamService) {
    $scope.alert = {};


    TeamService.getTeams().then(
        function(records) {
            $scope.teams = records;
        },
        function(data) {
            console.log('teams retrieval failed.');
        }
        );


    function showAlert(style, message) {
        $scope.alert = {
            style: style,
            message: message
        };
        $timeout(function() {
            $scope.alert = {};
        }, 3000);
    }

    $scope.editTeam = function(team) {
        $scope.$emit('throwAlert',{
            style:'success',
            message:'Team Edited Succesfully!'}
            );
        console.log(team);
    };
}]);
