<!DOCTYPE html>
<html data-ng-app="bankAccounts">
<head>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<meta charset="ISO-8859-1">
<title>Camel MicroService demo example</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">
	var app = angular.module('bankAccounts', []);

	var postController = app.controller('FormPostController', [ '$scope',
			'$http', function($scope, $http) {

				// 								$scope.list = [];
				// 								$scope.headerText = 'AngularJS Post Form Spring MVC example: Submit below form';

				$scope.myAddForm = {};
				$scope.myAddForm.list = [];
				$scope.myAddForm.headerText = 'Add Beneficiary details below';
				$scope.myAddForm.postSuccess = false;

				$scope.myAddForm.submit = function() {

					var formData = {
						"accountName" : $scope.myAddForm.accountName,
						"nickName" : $scope.myAddForm.nickName,
						"bankName" : $scope.myAddForm.bankName,
						"accountId" : $scope.myAddForm.accountId,
						"ifscCode" : $scope.myAddForm.ifscCode
					};

					var response = $http.post('PostFormData', formData);
					response.success(function(data, status, headers, config) {
						$scope.myAddForm.list = data;
						//$scope.$digest();
						//alert("success = " + $scope.success);
						$scope.myAddForm.postSuccess = true;

					});
					response.error(function(data, status, headers, config) {
						alert("Exception details: " + JSON.stringify({
							data : data
						}));
					});

					//Empty list data after process
					$scope.list = [];

				};

				$scope.myAddForm.clear = function() {
					while ($scope.myAddForm.list.length) {
						$scope.myAddForm.list.pop();
					}
					$scope.myAddForm.postSuccess = false;
					$scope.myAddForm.accountName = "";
					$scope.myAddForm.nickName = "";
					$scope.myAddForm.bankName = "";
					$scope.myAddForm.accountId = "";
					$scope.myAddForm.ifscCode = "";
					$scope.$apply();
				};
			} ]);
	var getController = app.controller('FormGetController', [
			'$scope',
			'$http',
			function($scope, $http) {
				document.getElementById("getBeneficiaries").addEventListener(
						'click', function() {
							$scope.submit();
						});
				$scope.myViewForm = {};
				$scope.myViewForm.getSuccess = false;
				$scope.myViewForm.list = [];
				$scope.myViewForm.getBenefeciariesList = function() {
					return this.list;
				};
				$scope.submit = function() {
					var response = $http.get('GetFormData');

					response.success(function(data, status, headers, config) {
						$scope.myViewForm.list = data;
						$scope.myViewForm.getSuccess = true;
					});
					response.error(function(data, status, headers, config) {
						alert("Exception details: " + JSON.stringify({
							data : data
						}));
					});

					//Empty list data after process
					$scope.myViewForm.list = [];
				};
			} ]);

	function showViewBeneficiaries() {
		/* 		document.getElementById("add").style.display = 'none';
		 document.getElementById("view").style.display = 'block'; */
		$("#add").hide();
		$("#view").show();
		$("#getBeneficiaries").click();
	}

	function showAddBeneficiaries() {
		/* 		document.getElementById("add").style.display = 'block';
		 document.getElementById("view").style.display = 'none'; */
		$("#add").show();
		$("#view").hide();
		angular.element(document.getElementById("formPostController")).scope().myAddForm
				.clear();
	}
</script>
</head>
<body>
	<div class="container">
		<!-------->
		<div id="content">
			<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
				<li class="active"><a href="#add" data-toggle="tab"
					onclick="showAddBeneficiaries()">Add Beneficiary</a></li>
				<li><a href="#view" data-toggle="tab"
					onclick="showViewBeneficiaries()">View Beneficiaries</a></li>
			</ul>
			<div id="my-tab-content" class="tab-content">
				<div class="tab-pane active" id="add" style="display: none">
					<div id="formPostController" ng-controller="FormPostController">
						<form id="postSubmit">
							<div ng-hide="myAddForm.postSuccess">
								<h3>{{myAddForm.headerText}}</h3>
								<table class="pure-table">
									<tr>
										<td><p>Account Name:</p></td>
										<td><input type="text"
											data-ng-model="myAddForm.accountName"></td>
									</tr>
									<tr>
										<td><p>Nick Name:</p></td>
										<td><input type="text" data-ng-model="myAddForm.nickName"></td>
									</tr>
									<tr>
										<td><p>Account Number</p></td>
										<td><input type="text"
											data-ng-model="myAddForm.accountId"></td>
									</tr>
									<tr>
										<td><p>Bank</p></td>
										<td><input type="text" data-ng-model="myAddForm.bankName"></td>
									</tr>
									<tr>
										<td><p>IFSC code</p></td>
										<td><input type="text" data-ng-model="myAddForm.ifscCode"></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>
								<br>
								<button ng-click="myAddForm.submit()">Save Beneficiary</button>
							</div>

							<div ng-show="myAddForm.postSuccess">
								<h4>Benefeciary details saved successfully</h4>
								<!-- <pre>Form data ={{myAddForm.list}}</pre> -->
								<table class="pure-table">
									<thead>
										<tr>
											<td>Acount Name</td>
											<td>Nick Name</td>
											<td>Account #</td>
											<td>IFSC Code</td>
											<td>Bank Name</td>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="person in myAddForm.list">
											<td>{{person.accountName}}</td>
											<td>{{person.nickName}}</td>
											<td>{{person.accountId}}</td>
											<td>{{person.ifscCode}}</td>
											<td>{{person.bankName}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
				<div class="tab-pane" id="view"">
					<div ng-controller="FormGetController">
						<form id="getSubmit">
							<br>
							<div id="invisibleButtonDiv">
								<button id="getBeneficiaries" ng-click="myViewForm.submit()" />
							</div>
							<div ng-show="myViewForm.getSuccess">
								<h4>Benefeciaries :</h4>
								<table class="pure-table">
									<thead>
										<tr>
											<td>Acount Name</td>
											<td>Nick Name</td>
											<td>Account #</td>
											<td>IFSC Code</td>
											<td>Bank Name</td>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="person in myViewForm.list">
											<td>{{person.accountName}}</td>
											<td>{{person.nickName}}</td>
											<td>{{person.accountId}}</td>
											<td>{{person.ifscCode}}</td>
											<td>{{person.bankName}}</td>
										</tr>
									</tbody>
								</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#invisibleButtonDiv").hide();
	</script>
</body>
</html>