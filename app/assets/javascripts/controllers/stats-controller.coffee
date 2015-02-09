angular.module 'newsbricks-controllers'

.controller 'StatsController', ($scope, $http) ->

  aspectColors =
    what:  '#e0483e'
    where: '#f7941d'
    who:   '#22c064'
    pic:   '#1c57ff'
    why:   '#ff1caa'

  colors = _.values(aspectColors)

  $scope.options =
    chart:
      type: 'pieChart'
      height: 320
      x: (d) -> d.key
      y: (d) -> d.y
      color: (d) ->
        if aspectColors[d.key]
          aspectColors[d.key]
        else if aspectColors[d.data.key]
          aspectColors[d.data.key]
        else
          colors[Math.floor(Math.random() * colors.length)]
      showLabels: true
      transitionDuration: 500
      labelThreshold: 0.01
      showLegend: false

  $scope.data = null

  $scope.reload = ->
    $http.get('/stats')
      .then (result) ->
        $scope.data = result.data.data
      .finally ->
        $scope.$broadcast('scroll.refreshComplete')
  $scope.reload()
