'use strict';

/**
 * @ngdoc directive
 * @name fifaKingsV2App.directive:alert
 * @description
 * # alert
 */
angular.module('fifaKingsV2App')
    .directive('alertBox', function() {
        return {
            template: '<div  class="alert alert-{{alert.style}} animate-show" role="alert">{{alert.message}}</div>',
            restrict: 'E'
        };
    });
