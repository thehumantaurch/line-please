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
controllers.controller("ScriptsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Script = $resource('/scripts/:scriptId', {scriptId: "@id", format: 'json'})

    if $routeParams.keywords
      Script.query(keywords: $routeParams.keywords, (results) -> $scope.scripts = results)
    else
      $scope.scripts = []
])