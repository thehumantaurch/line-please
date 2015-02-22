controllers = angular.module('controllers')

controllers.controller('ScriptController', ['$scope', '$routeParams', '$resource', ($scope, $routeParams, $resource) ->
  Script = $resource('/scripts/:scriptId', { scriptId: "@id", format: 'json' })

  ])