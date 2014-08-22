'use strict';

/**
 * @ngdoc function
 * @name demoStationApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the demoStationApp
 */
angular.module('demoStationApp')
    .controller('MainCtrl', function ($scope, $http, $alert, $interval) {

//        window.onbeforeunload = function (event) {
//            localStorageService.set('DemoStations', $scope.demoStations);
//            localStorageService.set('RentedPedelecs', $scope.pedelecs);
//        };


//        $scope.pedelecs = localStorageService.get('RentedPedelecs');

        $http.get("/stations").success(function (stations) {
            console.log("Polling stations at " + new Date().toLocaleTimeString());
            $scope.demoStations = stations;
        });

        $interval(function () {
            if ($scope.demoStation) {
                $http.get('/stations/' + $scope.demoStation.stationManufacturerId).success(function (station) {
//                    $scope.demoStation = station;
                    for (var i = 0; i < $scope.demoStations.length; i++) {
                        if ($scope.demoStations[i].stationManufacturerId == station.stationManufacturerId) {
                            $scope.demoStations[i] = station;
                            $scope.demoStation = station;
                        }
                    }
                });
            }
        }, 5000);

//        $interval(function() {
//            $http.get("/stations").success(function(stations) {
//                console.log("Polling stations at " + new Date().toLocaleTimeString());
//                $scope.demoStations = stations;
//            });
//        }, 3000);


        if (!$scope.pedelecs) {
            $scope.pedelecs = [];
        }

//        $scope.demoStations = localStorageService.get('DemoStations');

        $scope.authenticate = function () {

            if ($scope.authenticationForm.$invalid) {
                showAlert('Invalid Form', 'Please fill out.');
                return;
            }

//            $scope.user.userId = $scope.user.cardId;

            delete $scope.user.userId;

            $http.post('/stations/' + $scope.demoStation.stationManufacturerId + '/authorize', $scope.user)
                .success(function (data) {
                    $scope.user.userId = data.customerId;
                    $scope.authenticated = true;
                    showAlert('User is authorized', '');
                }).error(function (data, status, headers, config) {
                    alert('Authentication Error.');
                });
        };

        $scope.logout = function () {
            if ($scope.authenticated) {
                $scope.user.userId = null;
                showAlert('Customer canceled operation', '');
            }

            $scope.authenticated = false;

            $http.get("/stations/" + $scope.demoStation.stationManufacturerId + "/rentedPedelecs").success(function (rentedPedelecs) {
                $scope.rentedPedelecs = rentedPedelecs;
            });


        };

        $scope.rent = function (slot) {

            var startTransaction = {};
            startTransaction.userId = $scope.user.userId;
            startTransaction.pedelecManufacturerId = slot.pedelec.pedelecManufacturerId;
            startTransaction.stationManufacturerId = $scope.demoStation.stationManufacturerId;
            startTransaction.slotManufacturerId = slot.slotManufacturerId;
            startTransaction.timestamp = new Date().getTime();

            $http.post('/stations/' + $scope.demoStation.stationManufacturerId + '/takePedelec', startTransaction)
                .success(function (data) {
                    showAlert('User "' + $scope.user.userId + '" chose pedelec at slot ' + slot.slotPosition + '.', '');

                    $scope.authenticated = false;
                    $scope.user.userId = null;
                    showAlert('User is authorized', '');

                    $http.get('/stations/' + $scope.demoStation.stationManufacturerId).success(function (station) {
                        for (var i = 0; i < $scope.demoStations.length; i++) {
                            if ($scope.demoStations[i].stationManufacturerId == station.stationManufacturerId) {
                                $scope.demoStations[i] = station;
                                $scope.demoStation = station;
                            }
                        }
                    });
                    $http.get("/stations/" + $scope.demoStation.stationManufacturerId + "/rentedPedelecs").success(function (rentedPedelecs) {
                        $scope.rentedPedelecs = rentedPedelecs;
                    });
                }).error(function (data, status, headers, config) {
                    alert('Rent Pedelec Error.');
                });


        };

        $scope.return = function (pedelec, slot) {

            var stopTransaction = {};
            stopTransaction.pedelecManufacturerId = pedelec.pedelecManufacturerId;
            stopTransaction.slotManufacturerId = slot.slotManufacturerId;
            stopTransaction.stationManufacturerId = $scope.demoStation.stationManufacturerId;
            stopTransaction.timestamp = new Date().getTime();

            $http.post('/stations/' + $scope.demoStation.stationManufacturerId + '/returnPedelec', stopTransaction)
                .success(function (data) {
                    $http.get('/stations/' + $scope.demoStation.stationManufacturerId).success(function (station) {
                        for (var i = 0; i < $scope.demoStations.length; i++) {
                            if ($scope.demoStations[i].stationManufacturerId == station.stationManufacturerId) {
                                $scope.demoStations[i] = station;
                                $scope.demoStation = station;
                            }
                        }
                    });
                    $http.get("/stations/" + $scope.demoStation.stationManufacturerId + "/rentedPedelecs").success(function (rentedPedelecs) {
                        $scope.rentedPedelecs = rentedPedelecs;
                    });
                    showAlert('Pedelec "' + pedelec.pedelecManufacturerId + '" returned to slot "' + slot.slotPosition + '"');
                }).error(function (data, status, headers, config) {
                    alert('Return Pedelec Error.');
                });


        };

        var showAlert = function (title, content) {
            $alert({container: '.topalert', title: title, content: content, placement: 'top-right', type: 'info', show: true, duration: 3});
        };


        $scope.sendBootNotification = function () {
            var bootNotification = {};
            bootNotification.stationManufacturerId = $scope.demoStation.stationManufacturerId;
            bootNotification.firmwareVersion = $scope.demoStation.firmwareVersion;
            bootNotification.slots = [];

            angular.forEach($scope.demoStation.slots, function (slot) {
                var tmpSlot = {};
                tmpSlot.slotManufacturerId = slot.slotManufacturerId;
                tmpSlot.slotPosition = slot.slotPosition;

                if (slot.pedelec) {
                    tmpSlot.pedelecManufacturerId = slot.pedelec.pedelecManufacturerId;
                }
                bootNotification.slots.push(tmpSlot);
            });

            console.log(bootNotification);
            showAlert('Send "Boot Notification"', '');
        };

        $scope.sendStationStatusNotification = function () {
            var stationStatusNotification = {};
            stationStatusNotification.stationManufacturerId = $scope.demoStation.stationManufacturerId;
            stationStatusNotification.stationErrorCode = $scope.demoStation.stationErrorCode;
            stationStatusNotification.stationInfo = $scope.demoStation.stationInfo;
            stationStatusNotification.stationState = $scope.demoStation.stationState;
            stationStatusNotification.timestamp = new Date().getTime();
            stationStatusNotification.slots = [];

            angular.forEach($scope.demoStation.slots, function (slot) {
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

        $scope.sendPedelecStatusNotification = function (slot) {
            var pedelecStatusNotification = {};

            pedelecStatusNotification.pedelecManufacturerId = slot.pedelec.pedelecManufacturerId;
            pedelecStatusNotification.pedelecErrorCode = slot.pedelec.pedelecErrorCode;
            pedelecStatusNotification.pedelecInfo = slot.pedelec.pedelecInfo;
            pedelecStatusNotification.pedelecState = slot.pedelec.pedelecState;
            pedelecStatusNotification.timestamp = new Date().getTime();

            console.log(pedelecStatusNotification);
            showAlert('Send "Pedelec Status Notification" for Pedelec "' + slot.pedelec.pedelecManufacturerId + '"');
        };

        $scope.sendChargingStatusNotification = function (slot) {
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
