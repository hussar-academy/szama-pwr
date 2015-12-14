angular.module("szama").service("TempPayments", function(){
  var data = [];

  return {
    getData: function(){
      return data;
    },
    setData: function(payments) {
      data = payments;
    }
  };
});
