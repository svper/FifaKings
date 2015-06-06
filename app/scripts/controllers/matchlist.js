'use strict';

/**
 * @ngdoc function
 * @name fifaKingsV2App.controller:MatchlistCtrl
 * @description
 * # MatchlistCtrl
 * Controller of the fifaKingsV2App
 */
angular.module('fifaKingsV2App')
    .controller('MatchlistCtrl', function() {
        var vm = this;

        vm.toggleShow = function(match) {
        	console.log(match.show);
            if (match.show)
                match.show = false;
            else
                match.show = true;
        }
    });
