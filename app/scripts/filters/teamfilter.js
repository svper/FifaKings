'use strict';

/**
 * @ngdoc filter
 * @name fifaKingsV2App.filter:TeamFilter
 * @function
 * @description
 * # TeamFilter
 * Filter in the fifaKingsV2App.
 */
angular.module('fifaKingsV2App')
  .filter('TeamFilter', function () {
    return function (input) {
      return 'TeamFilter filter: ' + input;
    };
  });
