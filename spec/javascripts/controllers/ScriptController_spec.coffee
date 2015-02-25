describe "ScriptController", ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  flash        = null
  location     = null
  scriptId     = 27

  fakeScript   =
    id: scriptId
    title: "My So Called Life Play"
    author: "Claire Danes"

  setupController =(scriptExists=true,scriptId=27)->
    inject(($location, $routeParams, $rootScope, $httpBackend, $controller, _flash_)->
      scope       = $rootScope.$new()
      location    = $location
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.scriptId = scriptId if scriptId
      flash = _flash_

      if scriptId
        request = new RegExp("\/scripts/#{scriptId}")
        results = if scriptExists
          [200,fakeScript]
        else
          [404]

        httpBackend.expectGET(request).respond(results[0],results[1])

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
      it 'loads the given script', ->
        httpBackend.flush()
        expect(scope.script).toBe(null)
        expect(flash.error).toBe("There is no script with ID #{scriptId}")

  describe 'create', ->
    newScript =
      id: 27
      title: 'Living Dead in Denmark'
      author: "Qui Nguyen"

    beforeEach ->
      setupController(false,false)
      request = new RegExp("\/scripts")
      httpBackend.expectPOST(request).respond(201,newScript)

    it 'posts to the backend', ->
      scope.script.title  = newScript.title
      scope.script.author = newScript.author
      scope.save()
      httpBackend.flush()
      expect(location.path()).toBe("/scripts/#{newScript.id}")

  describe 'update', ->
    updatedScript =
      title: 'She Loves Monsters'
      author: 'Sarah Taurchini'

    beforeEach ->
      setupController()
      httpBackend.flush()
      request = new RegExp("\/scripts")
      httpBackend.expectPUT(request).respond(204)

    it 'posts to the backend', ->
      scope.script.title  = updatedScript.title
      scope.script.author = updatedScript.author
      scope.save()
      httpBackend.flush()
      expect(location.path()).toBe("/scripts/#{scope.script.id}")

  describe 'delete' ,->
    beforeEach ->
      setupController()
      httpBackend.flush()
      request = new RegExp("\/scripts/#{scope.script.id}")
      httpBackend.expectDELETE(request).respond(204)

    it 'posts to the backend', ->
      scope.delete()
      httpBackend.flush()
      expect(location.path()).toBe("/")