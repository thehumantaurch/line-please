linePlease = angular.module('linePlease', [])

app.config(['$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when('/',
      templateUrl: "<%= asset_path('index.html') %>"
      controller: 'ScriptsController'
      )
    .when('/scripts/new',
      templateUrl: "<%= asset_path('new.html') %>"
      controller: 'NewScriptController'
      )
  ])