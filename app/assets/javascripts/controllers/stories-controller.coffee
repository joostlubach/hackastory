angular.module 'hackastory-controllers'

.controller 'StoriesController', ($scope, $http) ->

  $http.get('/stories').then (response) ->
    $scope.stories = response.data.stories