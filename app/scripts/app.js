'use strict';

/**
 * @ngdoc overview
 * @name fifaKingsV2App
 * @description
 * # fifaKingsV2App
 *
 * Main module of the application.
 */
angular
    .module('fifaKingsV2App', [
        'ngAnimate',
        'ngCookies',
        'ngResource',
        'ngRoute',
        'ngSanitize',
        'ngTouch',
        'ui.bootstrap'
    ])
    .config(function($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'views/main.html',
                controller: 'MainCtrl'
            })
            .when('/users', {
                templateUrl: 'views/users.html',
                controller: 'UsersCtrl'
            })
            .when('/login', {
                templateUrl: 'views/login.html',
                controller: 'LoginCtrl'
            })
            .when('/teams', {
                templateUrl: 'views/teams.html',
                controller: 'TeamsCtrl'
            })
            .when('/match', {
                templateUrl: 'views/match.html',
                controller: 'MatchCtrl'
            })
            .when('/register', {
                templateUrl: 'views/register.html',
                controller: 'RegisterCtrl'
            })
            .when('/tournaments', {
                templateUrl: 'views/tournaments.html',
                controller: 'TournamentsCtrl'
            })
            .when('/tournament', {
                templateUrl: 'views/tournamentedit.html',
                controller: 'TournamentEditCtrl'
            })
            .when('/tournament/:tid', {
                templateUrl: 'views/tournament.html',
                controller: 'TournamentCtrl'
            })
            .when('/player', {
                templateUrl: 'views/player.html',
                controller: 'PlayerCtrl'
            })
            .when('/players', {
                templateUrl: 'views/players.html',
                controller: 'PlayersCtrl'
            })
            .when('/matches', {
                templateUrl: 'views/matches.html',
                controller: 'MatchesCtrl'
            })
            .when('/tournamentEdit', {
              templateUrl: 'views/tournamentedit.html',
              controller: 'TournamenteditCtrl'
            })
            .otherwise({
                redirectTo: '/'
            });
    });
