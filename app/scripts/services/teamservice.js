'use strict';

/**
 * @ngdoc service
 * @name fifaKingsV2App.teamService
 * @description
 * # teamService
 * Service in the fifaKingsV2App.
 */
 angular.module('fifaKingsV2App')
 .service('TeamService', ['Team', '$http','$q', function(Team, $http,$q) {
        // AngularJS will instantiate a singleton by calling "new" on this function

        var svc = this;



        svc.getTeams = function() {

            var def = $q.defer();
            $http.post('../server/server.php?method=getTeams', {}).
            success(function(teams, status) {
                var resp = [];

                _.forEach(teams, function(team) {
                    resp.push(new Team(team.id,team.name, team.locale, team.quality, team.att, team.mid, team.def));
                });
                def.resolve(resp);
            })
            .error(function() {
                def.reject("Failed to get teams");
            });

            return def.promise;
        };

        svc.addTeam = function(team){
            var def = $q.defer();

            if(team && team.name){
                console.log(team);
                $http.post('../server/server.php?method=addTeam', { "team": team}).
                success(function(resp, status) {
                    def.resolve(resp);
                })
                .error(function() {
                    def.reject("Failed to add team");
                });

                return def.promise;
            }
        };


    }])
.factory('Team', function() {
        //Class Define
        function Team(id,name, country, quality, att, mid, def) {
            this.id= id;
            this.name = name;
            this.country = country;
            this.quality = quality;
            this.att = att;
            this.mid = mid;
            this.def = def;
        }

        return Team;
    });
