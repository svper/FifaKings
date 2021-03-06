'use strict';

/**
 * @ngdoc service
 * @name fifaKingsV2App.MatchService
 * @description
 * # MatchService
 * Service in the fifaKingsV2App.
 */
angular.module('fifaKingsV2App')
    .service('MatchService', ['ListMatch', 'Team', 'User', '$http', '$q', function(ListMatch, Team, User, $http, $q) {
        var svc = this;


        svc.add = function(home, away,tournamentId) {

            var match = {
                homeId : home.player.id,
                    homeScore : home.score,
                    homeTeamId : home.team.id,
                    awayId : away.player.id,
                    awayScore : away.score,
                    awayTeamId : away.team.id,
                    adminId : 1,
                    tournamentId :tournamentId,
                    version:15,
                    random:1
            };

            var def = $q.defer();
            $http.post('../server/server.php?method=addMatch', {
                "match": match
            }).
            success(function(tournamentId, status) {
                    var resp = [];
                    def.resolve(tournamentId);
                })
                .error(function() {
                    def.reject("Failed to add tournament");
                });

            return def.promise;
        };

        svc.getListMatches = function() {

            var def = $q.defer();
            $http.post('../server/server.php?method=getListMatches', {}).
            success(function(matches, status) {
                    var resp = [],
                        homePlayer, homeTeam, awayPlayer, awayTeam, listMatch;

                    _.forEach(matches, function(match) {
                        homePlayer = new User(match.homePlayer.id, match.homePlayer.firstName, match.homePlayer.lastName, match.homePlayer.email, match.homePlayer.lastLogin);
                        awayPlayer = new User(match.awayPlayer.id, match.awayPlayer.firstName, match.awayPlayer.lastName, match.awayPlayer.email, match.awayPlayer.lastLogin);
                        homeTeam = new Team(match.homeTeam.id, match.homeTeam.name, match.homeTeam.locale, match.homeTeam.quality, match.homeTeam.att, match.homeTeam.mid, match.homeTeam.def);
                        awayTeam = new Team(match.awayTeam.id, match.awayTeam.name, match.awayTeam.locale, match.awayTeam.quality, match.awayTeam.att, match.awayTeam.mid, match.awayTeam.def);

                        listMatch = new ListMatch(match.id, homePlayer, homeTeam, match.homeScore, awayPlayer, awayTeam, match.awayScore, match.adminId, match.tournamentId, match.regDate, match.version, match.random);
                        resp.push(listMatch);
                    });
                    def.resolve(resp);
                })
                .error(function() {
                    def.reject("Failed to get teams");
                });

            return def.promise;
        };

        svc.getTournamentMatches = function(id) {

            var def = $q.defer();
            $http.post('../server/server.php?method=getTournamentMatches', {
                "id": id
            }).
            success(function(matches, status) {
                    var resp = [],
                        homePlayer, homeTeam, awayPlayer, awayTeam, listMatch;

                    _.forEach(matches, function(match) {
                        homePlayer = new User(match.homePlayer.id, match.homePlayer.firstName, match.homePlayer.lastName, match.homePlayer.email, match.homePlayer.lastLogin);
                        awayPlayer = new User(match.awayPlayer.id, match.awayPlayer.firstName, match.awayPlayer.lastName, match.awayPlayer.email, match.awayPlayer.lastLogin);
                        homeTeam = new Team(match.homeTeam.id, match.homeTeam.name, match.homeTeam.locale, match.homeTeam.quality, match.homeTeam.att, match.homeTeam.mid, match.homeTeam.def);
                        awayTeam = new Team(match.awayTeam.id, match.awayTeam.name, match.awayTeam.locale, match.awayTeam.quality, match.awayTeam.att, match.awayTeam.mid, match.awayTeam.def);

                        listMatch = new ListMatch(match.id, homePlayer, homeTeam, match.homeScore, awayPlayer, awayTeam, match.awayScore, match.adminId, match.tournamentId, match.regDate, match.version, match.random);
                        resp.push(listMatch);
                    });
                    def.resolve(resp);
                })
                .error(function() {
                    def.reject("Failed to get tournament matches");
                });

            return def.promise;
        };


    }]).factory('ListMatch', function() {
        //Class Define
        function ListMatch(id, homePlayer, homeTeam, homeScore, awayPlayer, awayTeam, awayScore, adminId, tournamentId, regDate, version, random) {
            this.id = id;
            this.homePlayer = homePlayer;
            this.homeTeam = homeTeam;
            this.homeScore = homeScore;
            this.awayPlayer = awayPlayer;
            this.awayTeam = awayTeam;
            this.awayScore = awayScore;
            this.adminId = adminId;
            this.tournamentId = tournamentId;
            this.regDate = regDate instanceof Date ? regDate : new Date(regDate);
            this.version = version;
            this.random = random;
        }

        return ListMatch;
    });
