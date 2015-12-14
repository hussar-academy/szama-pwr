// This should be maybe called userHttp now, but let's stay with what we got for now
angular.module('szama').service('User', function($http){
  // $http is angular service for doing http request
  // https://docs.angularjs.org/api/ng/service/$http
  var api_endpoint = "/api/v1/users";
  this.index = function(){ return $http.get(api_endpoint); }
  return this;
});
