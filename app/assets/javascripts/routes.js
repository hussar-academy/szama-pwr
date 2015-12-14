angular.module("szama").config(function($routeProvider){
  $routeProvider
  .when("/payments", {
    templateUrl: "assets/templates/payments.html",
    controller: "PaymentsCtrl"
  })
  .when("/new_payment", {
    templateUrl: "assets/templates/new_payment.html",
    controller: "NewPaymentCtrl"
  })
  .when("/payment/:id", {
    templateUrl: "assets/templates/payment.html",
    controller: "PaymentCtrl"
  })
  .otherwise("/payments")
});
