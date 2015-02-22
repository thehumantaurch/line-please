describe "ScriptController", ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  scriptId     = 27

  fakeScript   =
    id: scriptId
    title: "My So Called Life Play"
    author: "Claire Danes"

  setupController =(scriptExists=true)->
    inject(($location, $routeParams, $rootScope, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.scriptId = scriptId

      request = new RegExp("\/scripts/#{scriptId}")
      results = if scriptExists
        [200, fakeScript]
      else
      [404]

      httpBackend.expectGET(request).respond(results[0], results[1])

      ctrl        = $controller('ScriptController',
                                $scope: scope)
    )

  beforeEach(module("linePlease"))

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'controller initialization', ->
    describe 'script is found', ->
      beforeEach(setupController())
      it 'loads the given script', ->
        httpBackend.flush()
        expect(scope.script).toEqualData(fakeScript)
    describe 'script is not found', ->
      beforeEach(setupController(false))
      it 'loads the given recipe', ->
        httpBackend.flush()
        expect(scope.script).toBe(null)