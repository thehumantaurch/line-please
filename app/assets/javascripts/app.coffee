linePlease = angular.module('linePlease',[
  'templates',
  'ngRoute',
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

scripts = [
  {
    id: 1
    name: 'Hamlet'
  },
  {
    id: 2
    name: 'Neverwhere',
  },
  {
    id: 3
    name: 'Very Still & Hard To See',
  },
  {
    id: 4
    name: 'As You Like It',
  },
]
controllers = angular.module('controllers',[])
controllers.controller("ScriptsController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.scripts = scripts.filter (script)-> script.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.scripts = []
])