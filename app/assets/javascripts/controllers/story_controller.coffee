angular.module 'hackastory-controllers'

.controller 'StoryController', ($scope, $http) ->

  $http.get('/stories').then (response) ->
    $scope.story = response.data.stories[0]