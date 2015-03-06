'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:PlayersCtrl
 * @description
 * # PlayersCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
  .controller('PlayersCtrl', ['$scope','PlayerService',function ($scope,PlayerService) {
PlayerService.getPlayers().then(
        function(records) {
            $scope.players = records;
        },
        function(data) {
            console.log('teams retrieval failed.');
        }
        );
  }]);
