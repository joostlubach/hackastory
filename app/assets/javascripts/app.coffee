angular.module('hackastory', [
  'ui.router'
  'templates'
  'ngAnimate'

  'hackastory-controllers'
])

.config ($stateProvider, $urlRouterProvider) ->

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