package demoStationApp.cmsInterface.controller;

import demoStationApp.cmsInterface.dto.request.ChangeStationOperationStateDTO;
import demoStationApp.cmsInterface.dto.request.StationConfigurationDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.cmsInterface.service.StationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by swam on 08/08/14.
 */

@RestController
@RequestMapping(value = "/{stationManufacturerId}", produces = MediaType.APPLICATION_JSON_VALUE)
public class StationController {

    @Autowired private StationService stationService;

    @RequestMapping(value = "/config", method = RequestMethod.POST)
    public void changeStationConfiguration(@PathVariable String stationManufacturerId,
                                           @RequestBody StationConfigurationDTO stationConfigurationDTO) throws CMSInterfaceException {
        stationService.configurateStation(stationManufacturerId, stationConfigurationDTO);
    }

    @RequestMapping(value = "/config", method = RequestMethod.GET)
    public StationConfigurationDTO getStationConfiguration(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        return stationService.provideStationConfiguration(stationManufacturerId);
    }

    @RequestMapping(value = "/state", method = RequestMethod.POST)
    public void changeStationOperationState(@PathVariable String stationManufacturerId,
                                            @RequestBody ChangeStationOperationStateDTO changeStationOperationStateDTO)
            throws CMSInterfaceException {
        stationService.setStationOperationState(stationManufacturerId, changeStationOperationStateDTO);
    }

    @RequestMapping(value = "/sendStationStatusNotification", method = RequestMethod.POST)
    public void sendStationStatusNotification(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        stationService.sendStationStatusNotification(stationManufacturerId);
    }

}
