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
      )
])

controllers = angular.module('controllers',[])