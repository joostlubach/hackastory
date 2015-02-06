angular.module 'hackastory-controllers'

.controller 'StoryController', ($scope, $http, $stateParams) ->

  storyId = $stateParams.id

  $http.get("/stories/#{storyId}").then (response) ->
    $scope.story = response.data.story

  $scope.unlock = (aspect) ->
    $http.post("/stories/#{storyId}/#{aspect.aspect}/unlock").then (response) ->
      $scope.story.unlocked_aspects.push response.data.aspect
      $scope.story.locked_aspects = _.reject(
        $scope.story.locked_aspects,
        (aspect) -> aspect.aspect == response.data.aspect.aspect
      )
