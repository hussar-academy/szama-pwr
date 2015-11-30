angular.module('szama').service('User', function(){

  this.index = function() {
    return {
      1: { name: "Jon", balance: 3.0 },
      2: { name: "Hodor", balance: -3.0 },
    };
  };

});
