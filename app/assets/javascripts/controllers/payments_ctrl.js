angular.module("szama").controller("PaymentsCtrl", function($scope, Payment, User) {
  $scope.users = User.index();
  $scope.payments = Payment.index();

  resetNewPayment = function() {
    $scope.newPayment = {
      title: "",
      user_id: "",
      balance_changes: {}
    };
  };

  resetNewPayment();

  // Example $scope.newPayment object:
  // {
  //   title: "New payment",
  //   creator_id: "1",
  //   balance_changes: {
  //     1: "10.5",
  //     2: "20",
  //   }
  // }
  $scope.addNewPayment = function() {
    // We must convert $scope.newPayment.balance_changes from hash
    // (as it come from form) to array (as $scope.payments expect)
    balanceChangesArray = [];

    // We must calculate how much money creator of the payment paid
    sumChanges = 0;

    // We take hash keys from $scope.newPayment.balance_changes,
    // which are user ids and iterate through them
    Object.keys($scope.newPayment.balance_changes).forEach(function(userID) {
      // Each change must be negative - look at how back-end works.
      // Jon: 10 means - Jon ate something that cost zł10, so we must negate
      // this value
      change = -1 * parseFloat($scope.newPayment.balance_changes[userID]);

      // Push "converted" balance change to temp balanceChangesArray
      balanceChangesArray.push({ user_id: userID, change: change });
      // Update total balance for $scope.users
      $scope.users[userID].balance += change;
      // How much money, in total, were spent
      sumChanges += change;
    });

    // Logic for adding new balance change for the creator - he is the one,
    // that paid the whole bill. Once again we negate the value, push new
    // balance change to balanceChangesArray and also update creator's whole
    // balance in $scope.users
    creatorsChange = -1 * sumChanges;
    balanceChangesArray.push({
      user_id: $scope.newPayment.creator_id,
      change: creatorsChange,
    })
    $scope.users[$scope.newPayment.creator_id].balance += parseFloat(creatorsChange);

    // Replace balance_changes hash with an array expected in $scope.payments
    $scope.newPayment.balance_changes = balanceChangesArray
    // Push new payment
    $scope.payments.push($scope.newPayment)
    // reset $scope.newPayment to zero so we can add new one
    resetNewPayment()
  };
});
