package demoStationApp.cmsInterface.controller;

import demoStationApp.cmsInterface.dto.ChangeStationOperationStateDTO;
import demoStationApp.cmsInterface.dto.StationConfigurationDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.cmsInterface.service.StationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by swam on 08/08/14.
 */

@RestController
@RequestMapping(value = "/{stationManufacturerId}/cmsi", produces = "application/json")
public class StationController {

    @Autowired
    private StationService stationService;

    @RequestMapping(value = "/config", method = RequestMethod.POST)
    public void changeStationConfiguration(@PathVariable String stationManufacturerId, @RequestBody StationConfigurationDTO stationConfigurationDTO) throws CMSInterfaceException {
        stationService.configurateStation(stationManufacturerId, stationConfigurationDTO);
    }

    @RequestMapping(value = "/config", method = RequestMethod.GET)
    public StationConfigurationDTO getStationConfiguration(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        return stationService.provideStationConfiguration(stationManufacturerId);
    }


    @RequestMapping(value = "/state", method = RequestMethod.POST)
    public void changeStationOperationState(@PathVariable String stationManufacturerId, @RequestBody ChangeStationOperationStateDTO changeStationOperationStateDTO) throws CMSInterfaceException {
        stationService.setStationOperationState(stationManufacturerId, changeStationOperationStateDTO);
    }

}