angular.module 'newsbricks-controllers'

.controller 'StoriesController', ($scope, $http) ->

  $scope.reload = ->
    $http.get('/stories')
      .then (response) ->
        $scope.stories = response.data.stories
      .finally ->
        $scope.$broadcast('scroll.refreshComplete')

  $scope.reload()

  $scope.templateFor = (story) ->
    if story.unlocked
      'unlocked-story-item.html'
    else
      'locked-story-item.html'