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
        'ui.router',
        'ngSanitize',
        'ngTouch',
        'ui.bootstrap'
    ])
    .config(function($stateProvider, $urlRouterProvider) {

        $urlRouterProvider.otherwise("/");

        $stateProvider
            .state('main', {
                url: "/",
                templateUrl: 'views/main.html',
                controller: 'MainCtrl'
            })
            .state('users', {
                url: "/users",
                templateUrl: 'views/users.html',
                controller: 'UsersCtrl'
            })
            .state('login', {
                url: "/login",
                templateUrl: 'views/login.html',
                controller: 'LoginCtrl'
            })
            .state('teams', {
                url: "/teams",
                templateUrl: 'views/teams.html',
                controller: 'TeamsCtrl'
            })
            /*.state('match', {
                url:"/match",
                templateUrl: 'views/match.html',
                controller: 'MatchCtrl'
            })*/
            .state('matchNew', {
                url: "/match",
                templateUrl: 'views/match.html',
                controller: 'MatchCtrl',
                params: {
                    tournamentId: null
                },
                resolve: {
                    teams: ['TeamService', function(TeamService) {
                        return TeamService.getTeams();
                    }],
                    players:['UserService','$stateParams', function(UserService,$stateParams) {
                        return UserService.getUsersTournament($stateParams.tournamentId);
                    }],
                }
            })
            .state('register', {
                url: "/register",
                templateUrl: 'views/register.html',
                controller: 'RegisterCtrl'
            })
            .state('tournaments', {
                url: "/tournaments",
                templateUrl: 'views/tournaments.html',
                controller: 'TournamentsCtrl'
            })
            .state('tournament', {
                url: "/tournament",
                templateUrl: 'views/tournamentedit.html',
                controller: 'TournamentEditCtrl'
            })
            .state('tournamentDetail', {
                url: "/tournament/:tid",
                templateUrl: 'views/tournament.html',
                controller: 'TournamentCtrl'
            })
            .state('player', {
                url: "/player",
                templateUrl: 'views/player.html',
                controller: 'PlayerCtrl'
            })
            .state('players', {
                url: "/players",
                templateUrl: 'views/players.html',
                controller: 'PlayersCtrl'
            })
            .state('matches', {
                url: "/matches",
                templateUrl: 'views/matches.html',
                controller: 'MatchesCtrl'
            })
            .state('tournamentEdit', {
                url: "/tournamentEdit",
                templateUrl: 'views/tournamentedit.html',
                controller: 'TournamenteditCtrl'
            });
    });
