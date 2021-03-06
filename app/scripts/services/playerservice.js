'use strict';

/**
 * @ngdoc service
 * @name fifaKingsV2App.PlayerService
 * @description
 * # PlayerService
 * Service in the fifaKingsV2App.
 */
angular.module('fifaKingsV2App')
    .service('PlayerService', ['Player', '$http', '$q', function(Player, $http, $q) {
        // AngularJS will instantiate a singleton by calling "new" on this function
        var svc = this;

        svc.getPlayers = function() {

            var def = $q.defer();
            $http.post('../server/server.php?method=getPlayers', {}).
            success(function(players, status) {
                    var resp = [];

                    _.forEach(players, function(plyr) {
                        resp.push(new Player(plyr.id, plyr.firstName, plyr.lastName, 'none', plyr.played, plyr.wins, plyr.draws, plyr.losses, plyr.goalsFor, plyr.goalsAgainst, plyr.points));
                    });
                    console.log(resp);
                    def.resolve(resp);
                })
                .error(function() {
                    def.reject("Failed to get players");
                });

            return def.promise;
        };

        svc.getPlayer = function(id) {
            var def = $q.defer();

            if (id) {
                $http.post('../server/server.php?method=getPlayer', {
                    "id": id
                }).
                success(function(usr, status) {
                        def.resolve(new Player(usr.firstName, usr.lastName, usr.Wins, usr.Draws, usr.Losses));
                    })
                    .error(function() {
                        def.reject("Failed to add team");
                    });

                return def.promise;
            }
        };

        svc.getTournamentTable = function(id) {

            var def = $q.defer();
            $http.post('../server/server.php?method=getTournamentTable', {
                "id": id
            }).
            success(function(players, status) {
                    var resp = [];

                    _.forEach(players, function(plyr) {
                        resp.push(new Player(plyr.id, plyr.firstName, plyr.lastName, '', plyr.played, plyr.wins, plyr.draws, plyr.losses, plyr.goalsFor, plyr.goalsAgainst, plyr.points));
                    });
                    def.resolve(resp);
                })
                .error(function() {
                    def.reject("Failed to get tournament table");
                });

            return def.promise;
        };

    }]).factory('Player', function() {
        //Class Define
        function Player(id, firstName, lastName, team, played, wins, draws, losses, goalsFor, goalsAgainst, points) {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.team = team;
            this.played = played;
            this.wins = wins;
            this.draws = draws;
            this.losses = losses;
            this.goalsFor = goalsFor;
            this.goalsAgainst = goalsAgainst;
            this.goalsDiff = goalsFor - goalsAgainst;
            this.points = points;
        }

        Player.prototype.getName = function() {
            return this.firstName + ' ' + this.lastName;
        };

        Player.prototype.getShortName = function() {
            return this.firstName + ' ' + this.lastName.substring(0,1) +'.';
        };

        return Player;
    });
