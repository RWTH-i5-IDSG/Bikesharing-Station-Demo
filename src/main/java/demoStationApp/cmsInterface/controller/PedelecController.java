package demoStationApp.cmsInterface.controller;

import demoStationApp.cmsInterface.dto.ChangePedelecOperationStateDTO;
import demoStationApp.cmsInterface.dto.PedelecConfigurationDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.cmsInterface.service.PedelecService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by swam on 08/08/14.
 */

@RestController
@RequestMapping(value = "/{stationManufacturerId}/cmsi/pedelecs", produces = "application/json")
public class PedelecController {

    @Autowired
    private PedelecService pedelecService;

    @RequestMapping(value = "/{pedelecManufacturerId}/config", method = RequestMethod.POST)
    public void changePedelecConfiguration(@PathVariable String stationManufacturerId, @PathVariable String pedelecManufacturerId, @RequestBody PedelecConfigurationDTO pedelecConfigurationDTO)
            throws CMSInterfaceException {
        pedelecService.setPedelecConfiguration(pedelecManufacturerId, pedelecConfigurationDTO);
    }

    @RequestMapping(value = "/{pedelecManufacturerId}/config", method = RequestMethod.GET)
    public PedelecConfigurationDTO getPedelecConfiguration(@PathVariable String stationManufacturerId, @PathVariable String pedelecManufacturerId)
            throws CMSInterfaceException {

        return pedelecService.providePedelecConfiguration(stationManufacturerId, pedelecManufacturerId);

    }

    @RequestMapping(value = "/{pedelecManufacturerId}/state", method = RequestMethod.POST)
    public void changePedelecOperationState(@PathVariable String stationManufacturerId, @PathVariable String pedelecManufacturerId, @RequestBody ChangePedelecOperationStateDTO changePedelecOperationStateDTO) throws  CMSInterfaceException {
        pedelecService.setPedelecOperationState(pedelecManufacturerId, changePedelecOperationStateDTO);
    }
}
