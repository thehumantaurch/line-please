linePlease = angular.module('linePlease',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

linePlease.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ScriptsController'
      ).when('/scripts/new',
        templateUrl: "form.html"
        controller: 'ScriptController'
      ).when('/scripts/:scriptId',
        templateUrl: "show.html"
        controller: 'ScriptController'
      ).when('/scripts/:scriptId/edit',
        templateUrl: "form.html"
        controller: 'ScriptController'
      )
])

angular
    .module('linePlease', ['angularFileUpload'])
    .controller('ScriptController', function($scope, FileUploader) {
        $scope.uploader = new FileUploader({url: '/scripts/new'});
    });

controllers = angular.module('controllers',[])