controllers = angular.module('controllers')
controllers.controller("ScriptController", [ '$scope', '$routeParams', '$resource', '$location', 'flash', 'FileUploader'
  ($scope,$routeParams,$resource,$location, flash, FileUploader)->
    Script = $resource('/scripts/:scriptId', { scriptId: "@id", format: 'json' },
      {
        'save':   {method:'PUT'},
        'create': {method:'POST'}
      }
    )
    uploader = $scope.uploader = new FileUploader({url: '/scripts/new'})
    console.info('uploader',uploader)

    if $routeParams.scriptId
      Script.get({scriptId: $routeParams.scriptId},
        ( (script)-> $scope.script = script ),
        ( (httpResponse)->
          $scope.script = null
          flash.error   = "There is no script with ID #{$routeParams.scriptId}"
        )
      )
    else
      $scope.script = {}

    $scope.back   = -> $location.path("/")
    $scope.edit   = -> $location.path("/scripts/#{$scope.script.id}/edit")
    $scope.cancel = ->
      if $scope.script.id
        $location.path("/scripts/#{$scope.script.id}")
      else
        $location.path("/")

    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.script.id
        $scope.script.$save(
          ( ()-> $location.path("/scripts/#{$scope.script.id}") ),
          onError)
      else
        Script.create($scope.script,
          ( (newScript)-> $location.path("/scripts/#{newScript.id}") ),
          onError
        )

    $scope.delete = ->
      $scope.script.$delete()
      $scope.back()


])