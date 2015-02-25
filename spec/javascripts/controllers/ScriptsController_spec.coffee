describe "ScriptsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null
  httpBackend  = null

  setupController =(keywords,results)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.keywords = keywords

      if results
        request = new RegExp("\/scripts.*keywords=#{keywords}")
        httpBackend.expectGET(request).respond(results)

      ctrl        = $controller('ScriptsController',
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("linePlease"))

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'controller initialization', ->
    describe 'when no keywords present', ->
      beforeEach(setupController())

      it 'defaults to no scripts', ->
        expect(scope.scripts).toEqualData([])

    describe 'with keywords', ->
      keywords = 'foo'
      scripts = [
        {
          id: 1
          title: 'Hamlet'
          author: "William Shakespeare"
        },
        {
          id: 3
          name: 'Very Still & Hard To See'
          author: "Steve Yockey"
        }
      ]
      beforeEach ->
        setupController(keywords,scripts)
        httpBackend.flush()

      it 'calls the back-end', ->
        expect(scope.scripts).toEqualData(scripts)

  describe 'search()', ->
    beforeEach ->
      setupController()

    it 'redirects to itself with a keyword param', ->
      keywords = 'foo'
      scope.search(keywords)
      expect(location.path()).toBe("/")
      expect(location.search()).toEqualData({keywords: keywords})