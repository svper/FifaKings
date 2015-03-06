'use strict';

/**
 * @ngdoc service
 * @name fifaKingsV2App.MatchService
 * @description
 * # MatchService
 * Service in the fifaKingsV2App.
 */
angular.module('fifaKingsV2App')
  .service('MatchService', ['ListMatch','Team','User','$http','$q',function (ListMatch,Team,User,$http,$q) {
     var svc = this;



        svc.getListMatches = function() {

            var def = $q.defer();
            $http.post('../server/server.php?method=getListMatches', {}).
            success(function(matches, status) {
                var resp = [],homePlayer,homeTeam,awayPlayer,awayTeam,listMatch;

                _.forEach(matches, function(match) {
                    homePlayer = new User(match.homePlayer.id, match.homePlayer.firstName, match.homePlayer.lastName, match.homePlayer.email, match.homePlayer.lastLogin);
                    awayPlayer = new User(match.awayPlayer.id, match.awayPlayer.firstName, match.awayPlayer.lastName, match.awayPlayer.email, match.awayPlayer.lastLogin);
                    homeTeam = new Team(match.homeTeam.id,match.homeTeam.name, match.homeTeam.locale, match.homeTeam.quality, match.homeTeam.att, match.homeTeam.mid, match.homeTeam.def);
                    awayTeam = new Team(match.awayTeam.id,match.awayTeam.name, match.awayTeam.locale, match.awayTeam.quality, match.awayTeam.att, match.awayTeam.mid, match.awayTeam.def);
                	
                    listMatch = new ListMatch(match.id, homePlayer,homeTeam,match.homeScore,awayPlayer,awayTeam,match.awayScore,match.adminId,match.tournamentId,match.regDate,match.version,match.random);
                    resp.push(listMatch);
                });
                def.resolve(resp);
            })
            .error(function() {
                def.reject("Failed to get teams");
            });

            return def.promise;
        };


  }]).factory('ListMatch', function() {
        //Class Define
        function ListMatch(id, homePlayer,homeTeam,homeScore,awayPlayer,awayTeam,awayScore,adminId,tournamentId,regDate,version,random){
        	this.id = id;
        	this.homePlayer = homePlayer;
        	this.homeTeam = homeTeam;
        	this.homeScore = homeScore;
        	this.awayPlayer = awayPlayer;
        	this.awayTeam = awayTeam;
        	this.awayScore = awayScore;
        	this.adminId = adminId;
        	this.tournamentId = tournamentId;
        	this.regDate = regDate;
        	this.version = version;
        	this.random = random;
        }

        return ListMatch;
    });
