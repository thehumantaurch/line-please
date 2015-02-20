linePlease = angular.module('linePlease', [
  'templates',
  'ngRoute',
  'controllers'
  ])

linePlease.config(['$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'ScriptsController'
      )
  ])

controllers = angular.module('controllers', [])
controllers.controller('ScriptsController', ['$scope', ($scope) ->
  ])