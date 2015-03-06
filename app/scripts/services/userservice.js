'use strict';

/**
 * @ngdoc service
 * @name fifaKingsV2App.UserService
 * @description
 * # UserService
 * Service in the fifaKingsV2App.
 */
angular.module('fifaKingsV2App')
    .service('UserService',['User','$http','$q', function(User,$http,$q) {
        var svc = this;

        svc.getUsers = function() {

            var def = $q.defer();
            $http.post('../server/server.php?method=getUsers', {}).
            success(function(users, status) {
                    var resp = [];

                    _.forEach(users, function(usr) {
                        resp.push(new User(usr.id,usr.firstName, usr.lastName, usr.email, usr.lastLogin));
                    });
                    def.resolve(resp);
                })
                .error(function() {
                    def.reject("Failed to get users");
                });

            return def.promise;
        };



        svc.getUser = function(id) {
            var def = $q.defer();

            if (id) {
                $http.post('../server/server.php?method=getPlayer', {
                    "id": id
                }).
                success(function(usr, status) {
                        def.resolve(new User(usr.id,usr.firstName, usr.lastName, usr.email, usr.lastLogin));
                    })
                    .error(function() {
                        def.reject("Failed to add team");
                    });

                return def.promise;
            }
        };





        svc.login = function(usr, pass) {
            console.log('received user ' + usr + ' and pass ' + pass);
            return true;
        };

    }]).factory('User', function() {
    //Class Define
    function User(id, firstName, lastName, email, lastLogin) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.lastLogin = lastLogin;
    }

    User.prototype.getName = function() {
        return this.firstName + ' ' + this.lastName;
    };

    return User;
});
