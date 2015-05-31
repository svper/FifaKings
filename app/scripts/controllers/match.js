'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:MatchCtrl
 * @description
 * # MatchCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
    .controller('MatchCtrl', ['$scope', 'UserService', 'TeamService', 'MatchService', '$location', '$stateParams','teams','players',function($scope, UserService, TeamService, MatchService, $location, $stateParams,teams,players) {

        
        $scope.tid = $stateParams.tournamentId;
        $scope.teams = teams;
        $scope.players = players;

        console.log($stateParams);

        $scope.submitForm = function(isValid) {
            if (isValid) {
                MatchService.add($scope.home, $scope.away, $scope.tid)
                    .then(function(matchId) {
                        $location.path('/tournament/' + $scope.tid);
                        $scope.$emit('throwAlert', {
                            style: 'success',
                            message: 'Match saved!'
                        });
                    });
            }
        };

    }]);
