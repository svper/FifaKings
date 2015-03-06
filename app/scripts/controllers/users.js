'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:UsersCtrl
 * @description
 * # UsersCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
    .controller('UsersCtrl', ['$scope', 'UserService', function($scope, UserService) {

        UserService.getUsers().then(
            function(records) {
                $scope.users = records;
                console.log(records);
            },
            function(data) {
                console.log('users retrieval failed.');
            }
        );

        $scope.getUser = function(pid) {
            UserService.getUser(pid).then(
                function(records) {
                    console.log('arrived');
                    console.log(records);
                },
                function(data) {
                    console.log('user retrieval failed.')
                });
        };

        $scope.addPlayer = function() {
            $scope.$emit('throwAlert', {
                style: 'success',
                message: 'User added Succesfully!'
            });
        }


    }]);
