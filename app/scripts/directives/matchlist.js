'use strict';

/**
 * @ngdoc directive
 * @name fifaKingsV2App.directive:MatchList
 * @description
 * # MatchList
 */
angular.module('fifaKingsV2App')
    .directive('matchList', function() {
        return {
            scope: {
                matches: '='
            },
            templateUrl: 'views/directives/matchList.html',
            restrict: 'E'
        };
    });
