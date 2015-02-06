angular.module('hackastory', [
  'ui.router'
  'templates'
  'ngAnimate'

  'hackastory-controllers'
])

.run ($window, $state) ->

  if !$window.document.cookie.match(/current_user_id=\d+/)
    $state.go 'login'

.config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise '/stories'

  $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: 'login.html',
      controller: 'LoginController'

  $stateProvider
    .state 'stories',
      url: '/stories'
      templateUrl: 'stories.html',
      controller: 'StoriesController'

  $stateProvider
    .state 'story',
      url: '/story/:id'
      templateUrl: 'story.html',
      controller: 'StoryController'