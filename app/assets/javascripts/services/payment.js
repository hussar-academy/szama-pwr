angular.module('szama').service('Payment', function(){

  this.index = function() {
    return [
      {
        title: "Pizza",
        creator_id: 1,
        balance_changes: [
          { user_id: 1, change: -10.0 },
          { user_id: 2, change: -15.0 },
          { user_id: 1, change: 25.0 },
        ],
      },
      {
        title: "Bagiety",
        creator_id: 2,
        balance_changes: [
          { user_id: 1, change: -12.0 },
          { user_id: 2, change: -14.0 },
          { user_id: 2, change: 26.0 },
        ]
      },
    ];
  };

});
