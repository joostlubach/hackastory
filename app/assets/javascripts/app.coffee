angular.module('hackastory', [
  'ionic'
  'ui.router'
  'templates'
  'ngAnimate'

  'hackastory-controllers'
])

.run ($window, $state) ->

  if !$window.document.cookie.match(/current_user_id=\d+/)
    $state.go 'login'

.config ($stateProvider, $urlRouterProvider, $httpProvider) ->

  $urlRouterProvider.otherwise '/stories'

  $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: 'login.html',
      controller: 'LoginController'

    .state 'stories',
      url: '/stories'
      templateUrl: 'stories.html',
      controller: 'StoriesController'

    .state 'story',
      url: '/story/:id'
      templateUrl: 'story.html',
      controller: 'StoryController'

  $httpProvider.interceptors.push ($rootScope) ->
    'request':  (cfg) ->
      $rootScope.loading = true
      cfg
    'response': (cfg) ->
      $rootScope.loading = false
      cfg
