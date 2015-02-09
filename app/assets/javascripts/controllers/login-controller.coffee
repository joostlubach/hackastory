angular.module 'newsbricks-controllers'

.controller 'LoginController', ($scope, $http, $state, $window) ->

  $http.get('/users').then (response) ->
    $scope.users = response.data.users

  $scope.logIn = (user) ->
    expires = new Date
    expires.setTime expires.getTime() + 1000 * 3600 * 24 * 365
    $window.document.cookie = "current_user_id=#{user.id};path=/;expires=#{expires.toUTCString()}"
    $state.go('stories')