'use strict';

/**
 * @ngdoc service
 * @name fifaKingsV2App.TournamentService
 * @description
 * # TournamentService
 * Service in the fifaKingsV2App.
 */
angular.module('fifaKingsV2App')
  .service('TournamentService',['Tournament','$http','$q', function(Tournament,$http,$q) {
        var svc = this;

        svc.getTournaments = function() {

            var def = $q.defer();
            $http.post('../server/server.php?method=getTournaments', {}).
            success(function(tournaments, status) {
                    var resp = [];

                    _.forEach(tournaments, function(tour) {
                        resp.push(new Tournament(tour.id,tour.name,tour.hostId,tour.regDate,tour.closed,tour.version,tour.leagueId,tour.elo));
                    });
                    def.resolve(resp);
                })
                .error(function() {
                    def.reject("Failed to get tournaments");
                });

            return def.promise;
        };

           svc.getTournament = function(id) {
            var def = $q.defer();

            if (id) {
                $http.post('../server/server.php?method=getTournament', {
                    "id": id
                }).
                success(function(tour, status) {
                        def.resolve(new Tournament(tour.id,tour.name,tour.hostId,tour.regDate,tour.closed,tour.version,tour.leagueId,tour.elo));
                    })
                    .error(function() {
                        def.reject("Failed to find tournament");
                    });

                return def.promise;
            }
        };

        svc.add = function(tournament) {

            var def = $q.defer();
            $http.post('../server/server.php?method=addTournament', {"tour":tournament}).
            success(function(tournamentId, status) {
                    var resp = [];
                    def.resolve(tournamentId);
                })
                .error(function() {
                    def.reject("Failed to add tournament");
                });

            return def.promise;
        };

  }]).factory('Tournament', function() {
        //Class Define
        function Tournament(id,name,hostId,regDate,closed,version,leagueId,elo)
	    {
	        this.id = id;
	        this.name = name;
	        this.hostId = hostId;
	        this.regDate = new Date(regDate);
	        this.closed = closed;
	        this.version = version;
	        this.leagueId = leagueId;
	        this.elo = elo;
	    }

        return Tournament;
    });
