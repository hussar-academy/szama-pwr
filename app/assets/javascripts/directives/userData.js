angular.module('szama').directive('userData', function() {
  return {
    scope: {
      user: '=userData'
    },
    template: '{{ user.name }}; {{ user.balance }}',
    link: function($scope, element){
      $scope.$watch('user.balance', function(newBalance){
        if (newBalance > 10){
          element.attr('style', 'color: green;');
        } else if (newBalance <= 10 && newBalance >= - 10){
          element.attr('style', '');
        } else if (newBalance < -10){
          element.attr('style', 'color: red;');
        }
      }, true);
    }
  };
});
