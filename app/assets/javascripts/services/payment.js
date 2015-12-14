angular.module('szama').service('Payment', function($http){
  // https://docs.angularjs.org/api/ng/service/$http
  var api_endpoint = "/api/v1/payments";
  this.index = function(){ return $http.get(api_endpoint); }
  this.create = function(params){ return $http.post(api_endpoint, params); }
  return this;
});
