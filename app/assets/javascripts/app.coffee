angular.module('hackastory', [
  'ionic'
  'ui.router'
  'templates'
  'ngAnimate'

  'hackastory-controllers'
])

.run ($window, $state, $rootScope, $timeout) ->

  if !$window.document.cookie.match(/current_user_id=\d+/)
    $state.go 'login'

  $rootScope.badges = [{
    name: 'meh',
    caption: 'Meh...'
  }, {
    name: 'so-sad',
    caption: 'So sad'
  }, {
    name: 'huh',
    caption: 'Huh?'
  }, {
    name: 'omg',
    caption: 'OMG!'
  }]

  $rootScope.badgeCaption = (name) ->
    return null unless name

    badge = _.find($rootScope.badges, (b) -> b.name == name)
    badge.caption

  $rootScope.notifications = []

  expireNotification = ->
    $rootScope.notifications.shift()

  WebSocket = window.WebSocket ? window.MozWebSocket
  if WebSocket
    connection = new WebSocket('ws://10.10.150.134:1337')

    connection.onmessage = (message) ->
      $rootScope.$apply ->
        notification = JSON.parse(message.data);
        $rootScope.notifications.push(notification)
        $timeout expireNotification, 3000

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
