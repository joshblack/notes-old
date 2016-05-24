## Getting Started

Following along with [this tutorial](https://egghead.io/series/angularjs-app-from-scratch-getting-started).

### Controllers

One way communciation:

```js
// Controller logic
angular.module('myApp', [])
  .controller('MainCtrl', function ($scope) {
    $scope.categories = [{ id: 0, name: 'Development' }];
  });
```

```html
<!-- Template -->
<body ng-controller="MainCtrl">
  <li ng-repeat="category in categories">
    <a href="#">{{category.name}}</a>
  </li>
</body>
```

Two-way communication:

```js
// Controller logic
angular.module('myApp', [])
  .controller('MainCtrl', function ($scope) {
    $scope.categories = [{ id: 0, name: 'Development' }];
    $scope.setCurrentCategory = (category) => scope.currentCategory = category;
  });
```

```html
<!-- Template -->
<body ng-controller="MainCtrl">
  <li ng-repeat="category in categories">
    <a href="#" ng-click="setCurrentCategory(category)">{{category.name}}</a>
  </li>
</body>
```
