angular.module('szama').directive('paymentData', function() {
  return {
    scope: {
      payment: "=paymentData",
      users: "="
    },
    template: "<td>"
                + "<a ng-href=\"#/payment/{{payment.id}}\">{{ payment.title }}</a>"
              + "</td>"
              + "<td>{{ users[payment.creator_id].name }}</td>"
              + "<td>"
                + "<ul>"
                  + "<li ng-repeat=\"change in payment.balance_changes\">"
                    + "{{  users[change.user_id].name }}: {{ change.change }}"
                  + "</li>"
                + "</ul>"
              + "</td>",
  };
});
