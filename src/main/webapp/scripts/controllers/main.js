'use strict';

/**
 * @ngdoc function
 * @name demoStationApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the demoStationApp
 */
angular.module('demoStationApp')
  .controller('MainCtrl', function ($scope, $http, localStorageService, $alert) {

//        window.onbeforeunload = function (event) {
//            localStorageService.set('DemoStations', $scope.demoStations);
//            localStorageService.set('RentedPedelecs', $scope.pedelecs);
//        };


//        $scope.pedelecs = localStorageService.get('RentedPedelecs');

        $http.get("/stations").success(function(stations) {
            $scope.demoStations = stations;
        });


        if (!$scope.pedelecs) {
            $scope.pedelecs = [];
        }

//        $scope.demoStations = localStorageService.get('DemoStations');

        $scope.authenticate = function() {

            if ($scope.authenticationForm.$invalid) {
                showAlert('Invalid Form', 'Please fill out.');
                return;
            }



                $scope.user.userId = $scope.user.cardId;

            var customerHasRentedPedelec = false;

            angular.forEach($scope.pedelecs, function(value) {
                if (value.owner.userId === $scope.user.userId) {
                    showAlert('Sorry, you have a pedelec rented', '');
                    $scope.user = null;
                    customerHasRentedPedelec = true;
                }
            });

            if (!customerHasRentedPedelec) {
                $scope.authenticated = true;
                showAlert('User is authorized', '');
            }

//            $http.post('/psi/authorize', $scope.user).success(function(data, status, headers, config) {
//
//                $scope.authenticated = true;
//            }).
//                error(function(data, status, headers, config) {
//                    alert('Authentication Error.');
//                });
        };

        $scope.logout = function() {
            if ($scope.authenticated) {
                $scope.user.userId = null;
                showAlert('Customer canceled operation','');
            }

            $scope.authenticated = false;




        };

        $scope.rent = function(slot) {

            showAlert('User "' + $scope.user.userId + '" chose pedelec at slot ' + slot.slotPosition + '.' ,'');

                slot.pedelec.owner = angular.copy($scope.user);
                $scope.pedelecs.push(slot.pedelec);
                slot.pedelec = null;

                $scope.authenticated = false;
                $scope.user.userId = null;

                showAlert('Pedelec removed by user.','');

        };

        $scope.return = function(pedelec, slot) {
            // initiate 'stop transaction' method with 'slot' and 'rentedPedelec'
            slot.pedelec = pedelec;
            pedelec.owner = null;

            angular.forEach($scope.pedelecs, function(value, index){
                if (value === pedelec) {
                    $scope.pedelecs.splice(index, 1);
                }
            });

            showAlert('Pedelec "' + pedelec.pedelecManufacturerId + '" returned to slot "' + slot.slotPosition + '"');

        };

        var showAlert = function(title, content) {
            $alert({container:'.topalert', title: title, content: content, placement: 'top-right', type: 'info', show: true, duration:3});
        };


        $scope.sendBootNotification = function() {
            var bootNotification = {};
            bootNotification.stationManufacturerId = $scope.demoStation.stationManufacturerId;
            bootNotification.firmwareVersion = $scope.demoStation.firmwareVersion;
            bootNotification.slots = [];

            angular.forEach($scope.demoStation.slots, function(slot) {
                var tmpSlot = {};
                tmpSlot.slotManufacturerId = slot.slotManufacturerId;
                tmpSlot.slotPosition = slot.slotPosition;

                if (slot.pedelec) {
                    tmpSlot.pedelecManufacturerId = slot.pedelec.pedelecManufacturerId;
                }
                bootNotification.slots.push(tmpSlot);
            });

            console.log(bootNotification);
            showAlert('Send "Boot Notification"','');
        };

        $scope.sendStationStatusNotification = function() {
            var stationStatusNotification = {};
            stationStatusNotification.stationManufacturerId = $scope.demoStation.stationManufacturerId;
            stationStatusNotification.stationErrorCode = $scope.demoStation.stationErrorCode;
            stationStatusNotification.stationInfo = $scope.demoStation.stationInfo;
            stationStatusNotification.stationState = $scope.demoStation.stationState;
            stationStatusNotification.timestamp = new Date().getTime();
            stationStatusNotification.slots = [];

            angular.forEach($scope.demoStation.slots, function(slot) {
                var tmpSlot = {};
                tmpSlot.slotManufacturerId = slot.slotManufacturerId;
                tmpSlot.slotErrorCode = slot.slotErrorCode;
                tmpSlot.slotInfo = slot.slotInfo;
                tmpSlot.slotState = slot.slotState;

                stationStatusNotification.slots.push(tmpSlot);
            });

            console.log(stationStatusNotification);
            showAlert('Send "Station Status Notification"');
        };

        $scope.sendPedelecStatusNotification = function(slot) {
            var pedelecStatusNotification = {};

            pedelecStatusNotification.pedelecManufacturerId = slot.pedelec.pedelecManufacturerId;
            pedelecStatusNotification.pedelecErrorCode = slot.pedelec.pedelecErrorCode;
            pedelecStatusNotification.pedelecInfo = slot.pedelec.pedelecInfo;
            pedelecStatusNotification.pedelecState = slot.pedelec.pedelecState;
            pedelecStatusNotification.timestamp = new Date().getTime();

            console.log(pedelecStatusNotification);
            showAlert('Send "Pedelec Status Notification" for Pedelec "' + slot.pedelec.pedelecManufacturerId + '"');
        };

        $scope.sendChargingStatusNotification = function(slot) {
            var chargingStatusNotification = {};

            chargingStatusNotification.pedelecManufacturerId = slot.pedelec.pedelecManufacturerId;
            chargingStatusNotification.slotManufacturerId = slot.slotManufacturerId;
            chargingStatusNotification.timestamp = new Date().getTime();
            chargingStatusNotification.chargingState = slot.pedelec.chargingState;
            chargingStatusNotification.meterValue = slot.pedelec.meterValue;
            chargingStatusNotification.battery = slot.pedelec.battery;


            console.log(chargingStatusNotification);
            showAlert('Send "Charging Status Notification" for Pedelec "' + slot.pedelec.pedelecManufacturerId + '"');
        };

  });
