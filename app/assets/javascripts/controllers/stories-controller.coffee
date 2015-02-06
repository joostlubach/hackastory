angular.module 'hackastory-controllers'

.controller 'StoriesController', ($scope, $http) ->

  $http.get('/stories').then (response) ->
    $scope.stories = response.data.stories

  $scope.templateFor = (story) ->
    if story.unlocked
      'unlocked-story-item.html'
    else
      'locked-story-item.html'