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
            controller: function() {
                var vm = this;

                vm.toggleShow = function(match) {
                    console.log(match.show);
                    if (match.show)
                        match.show = false;
                    else
                        match.show = true;
                }
            },

            controllerAs: 'vm',
            templateUrl: 'views/directives/matchList.html',
            restrict: 'E'
        };
    });
