angular.module('hackastory', [
  'ui.router'
  'templates'
  'hackastory-controllers'
])

.config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider
    .otherwise '/story'

  $stateProvider
    .state 'story',
      url: '/story'
      templateUrl: 'story.html',
      controller: 'StoryController'