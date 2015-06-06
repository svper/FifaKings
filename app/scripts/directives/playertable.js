'use strict';

/**
 * @ngdoc directive
 * @name fifaKingsV2App.directive:playerTable
 * @description
 * # playerTable
 */
angular.module('fifaKingsV2App')
    .directive('playerTable', function() {
        return {
            scope: {
                players: '='
            },
            templateUrl: 'views/directives/playerTable.html',
            restrict: 'E',
            link:function(scope, element, attrs){
            	scope.showPoints = scope.$eval(attrs.showPoints);
            }
        };
    });
