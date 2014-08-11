'use strict';

/**
 * @ngdoc overview
 * @name demoStationApp
 * @description
 * # demoStationApp
 *
 * Main module of the application.
 */
angular
  .module('demoStationApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'LocalStorageModule',
    'mgcrea.ngStrap'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
//.run(function (localStorageService){
//
//        var generatedStations = [];
//
//        for (var j = 0; j < 4; j++) {
//            var station = {};
//            station.stationManufacturerId = ('' + Math.random()).substring(2, 7);
//            station.firmwareVersion = '0.1a';
//            station.stationErrorCode = '';
//            station.stationInfo = '';
//            station.stationState = 'OPERATIVE';
//            station.heartbeatInterval = 30;
//
//            station.slots = [];
//
//            for (var i = 0; i < 20; i++) {
//                var slot = {};
//                slot.slotManufacturerId = ('' + Math.random()).substring(2, 7);
//                slot.slotPosition = i + 1;
//                slot.slotErrorCode = '';
//                slot.slotInfo = '';
//                slot.slotState = 'OPERATIVE';
//                slot.pedelec = {};
//
//                if (Math.round(Math.random() + 0.1)) {
//                    slot.pedelec.pedelecManufacturerId = ('' + Math.random()).substring(2, 7);
//                    slot.pedelec.pedelecErrorCode = '';
//                    slot.pedelec.pedelecInfo = '';
//                    slot.pedelec.pedelecState = 'OPERATIVE';
//                    slot.pedelec.chargingState = 'CHARGING';
//                    slot.pedelec.meterValue = Math.random();
//
//                    slot.pedelec.battery = {};
//                    slot.pedelec.battery.soc = Math.round(Math.random() * 100);
//                    slot.pedelec.battery.temperature = Math.round(Math.random() * 10 + 15);
//                    slot.pedelec.battery.cycleCount = Math.round(Math.random() * 200);
//                    slot.pedelec.battery.voltage = 12;
//                    slot.pedelec.battery.current = 1;
//
//                }
//
//                station.slots.push(slot);
//            }
//
//            generatedStations.push(station);
//
//        }
//
//        if (!localStorageService.get('DemoStations')) {
//            console.log('Generate DemoStation into local storage.');
//            localStorageService.set('DemoStations', generatedStations);
//        } else {
//            console.log('DemoStation still exists.');
//        }
//
//
//    });
