linePlease = angular.module('linePlease',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

linePlease.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ScriptsController'
      ).when('/scripts/new',
        templateUrl: "form.html"
        controller: 'ScriptController'
      ).when('/scripts/:scriptId',
        templateUrl: "show.html"
        controller: 'ScriptController'
      ).when('/scripts/:scriptId/edit',
        templateUrl: "form.html"
        controller: 'ScriptController'
      )
])

controllers = angular.module('controllers',[])