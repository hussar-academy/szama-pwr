angular.module("szama").controller("PaymentCtrl", function($scope, $routeParams, Payment, User, TempPayments) {
  $scope.users = User.index();

  var tempPayments = TempPayments.getData();

  if (!tempPayments.length) {
    $scope.payments = Payment.index();
  } else {
    $scope.payments = tempPayments;
  }

  function searchForPayments(element) {
    return element.id == $routeParams.id
  }

  $scope.payment = $scope.payments.find(searchForPayments);

});
