<!DOCTYPE html>
<html data-ng-app="bankAccounts">
<head>
<meta charset="ISO-8859-1">
<title>Camel MicroService demo example</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module('bankAccounts', []);

	var postController = app
			.controller(
					'FormPostController',
					[
							'$scope',
							'$http',
							function($scope, $http) {

								$scope.list = [];
								$scope.headerText = 'AngularJS Post Form Spring MVC example: Submit below form';
								$scope.submit = function() {

									var formData = {
										"firstName" : $scope.firstName,
										"lastName" : $scope.lastName
									};

									var response = $http.post('PostFormData',
											formData);
									response.success(function(data, status,
											headers, config) {
										$scope.list.push(data);
									});
									response.error(function(data, status,
											headers, config) {
										alert("Exception details: "
												+ JSON.stringify({
													data : data
												}));
									});

									//Empty list data after process
									$scope.list = [];

								};
							} ]);
	var getController = app.controller('FormGetController', [ '$scope',
			'$http', function($scope, $http) {
				$scope.submit = function() {
					var response = $http.get('GetFormData');
					$scope.list = {};
					response.success(function(data, status, headers, config) {
						$scope.list = data;
					});
					response.error(function(data, status, headers, config) {
						alert("Exception details: " + JSON.stringify({
							data : data
						}));
					});

					//Empty list data after process
					//$scope.list = [];
				};
			} ]);
</script>
</head>
<body>
	<div ng-controller="FormPostController">
		<form id="postSubmit">
			<h3>{{headerText}}</h3>
			<p>
				Name: <input type="text" data-ng-model="firstName">
			</p>
			<p>
				Location: <input type="text" data-ng-model="lastName">
			</p>
			<br>
			<button ng-click="submit()">Submit Post</button>
			<h4>You submitted below data through post:</h4>
			<pre>Form data ={{list}}</pre>
		</form>
	</div>
	<div ng-controller="FormGetController">
		<form id="getSubmit">
			<br>
			<button ng-click="submit()">Submit Get</button>
			<h4>Data Fetched = :</h4>
			<table>
				<thead>
					<tr>
						<td>First Name</td>
						<td>Last Name</td>
						<td>Cust Id</td>
					</tr>
				</thead>
				<tbody ng-repeat="person in list">
					<tr>
						<td>{{person.firstName}}</td>
						<td>{{person.lastName}}</td>
						<td>{{person.id}}</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>