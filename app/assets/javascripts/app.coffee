linePlease = angular.module('linePlease', [
  'templates',
  'ngRoute',
  'controllers'
  ])

app.config(['$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when('/',
      templateUrl: "<%= asset_path('index.html') %>"
      controller: 'ScriptsController'
      )
    .when('/scripts/new',
      templateUrl: "<%= asset_path('new.html') %>"
      controller: 'NewScriptController'
      )
  ])

controllers = angular.module('controllers', [])
controllers.controller('ScriptsController', ['$scope', ($scope) ->
  ])