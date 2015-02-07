angular.module('hackastory', [
  'ionic'
  'ui.router'
  'templates'
  'nvd3'

  'hackastory-controllers'
])

.run ($window, $state, $rootScope, $timeout) ->

  $rootScope.currentUserId = ->
    parseInt($window.document.cookie.replace(/current_user_id=(\d+)/, '$1'), 10)

  if !$rootScope.currentUserId()
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
      notification = JSON.parse(message.data)

      if notification.user.id != $rootScope.currentUserId()
        $rootScope.$apply ->
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

    .state 'stats',
      url: '/stats'
      templateUrl: 'stats.html',
      controller: 'StatsController'

  $httpProvider.interceptors.push ($rootScope) ->
    'request':  (cfg) ->
      $rootScope.loading = true
      cfg
    'response': (cfg) ->
      $rootScope.loading = false
      cfg
