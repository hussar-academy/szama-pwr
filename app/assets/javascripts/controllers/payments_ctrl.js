angular.module("szama").controller("PaymentsCtrl", function($scope, Payment, User, TempPayments) {
  $scope.users = User.index();

  var tempPayments = TempPayments.getData();

  if (!tempPayments.length) {
    $scope.payments = Payment.index();
  } else {
    $scope.payments = tempPayments;
  }

});
