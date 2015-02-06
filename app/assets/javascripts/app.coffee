angular.module('hackastory', [
  'ui.router'
  'templates'
  'ngAnimate'

  'hackastory-controllers'
])

.config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider
    .otherwise '/stories'

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