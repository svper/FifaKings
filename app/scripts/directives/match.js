'use strict';

/**
 * @ngdoc directive
 * @name fifaKingsV2App.directive:Match
 * @description
 * # Match
 */
angular.module('fifaKingsV2App')
  .directive('Match', function () {
    return {
      template: '<div></div>',
      restrict: 'E',
      link: function postLink(scope, element, attrs) {
        element.text('this is the Match directive');
      }
    };
  });
