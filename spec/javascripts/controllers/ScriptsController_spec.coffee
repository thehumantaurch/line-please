describe "ScriptsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null

  setupController =(keywords)->
    inject(($location, $routeParams, $rootScope, $resource, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      ctrl        = $controller('ScriptsController',
                                $scope: scope,
                                $location: location)
    )

  beforeEach(module("linePlease"))
  beforeEach(setupController())

  it 'defaults to no scripts', ->
    expect(scope.scripts).toEqualData([])