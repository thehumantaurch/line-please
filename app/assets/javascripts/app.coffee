linePlease = angular.module('linePlease',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

linePlease.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ScriptsController'
      ).when('/scripts/:scriptId',
        templateUrl: "show.html"
        controller: 'ScriptController'
      )
])

controllers = angular.module('controllers',[])