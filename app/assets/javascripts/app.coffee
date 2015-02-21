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

controllers = angular.module('controllers',[])
controllers.controller("ScriptsController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.scripts = scripts.filter (script)-> script.title.toLowerCase().indexOf(keywords) != -1
    else
      $scope.scripts = []
])