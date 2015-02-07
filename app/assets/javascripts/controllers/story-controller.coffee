angular.module 'hackastory-controllers'

.controller 'StoryController', ($scope, $http, $stateParams) ->

  storyId = $stateParams.id

  $scope.setTemplate = ->
    $scope.template = if $scope.story.unlocked
      'unlocked-story.html'
    else
      'locked-story.html'

  $http.get("/stories/#{storyId}").then (response) ->
    $scope.story = response.data.story
    $scope.setTemplate()

  $scope.unlock = (aspect) ->
    return if $scope.story.unlocked_by_me

    aspect.loading = true
    $http.post("/stories/#{storyId}/#{aspect.aspect}/unlock")
      .then (response) ->
        $scope.story.unlocked_aspects.push response.data.aspect
        $scope.story.locked_aspects = _.reject(
          $scope.story.locked_aspects,
          (aspect) -> aspect.aspect == response.data.aspect.aspect
        )
        $scope.story.unlocked_by_me = true
        $scope.story.unlocked = response.data.story.unlocked
      .finally ->
        aspect.loading = false

  $scope.addBadge = (aspect, badge) ->

    sound = new Audio("/assets/#{badge.name}.wav")

    $http.post("/stories/#{storyId}/#{aspect.aspect}/#{badge.name}")
      .then (response) ->
        sound.play()
        badge.loading = true
        aspect.badge = badge.name
      .finally ->
        badge.loading = false