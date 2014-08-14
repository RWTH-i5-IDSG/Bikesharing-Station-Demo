package demoStationApp.cmsInterface.controller;

import demoStationApp.cmsInterface.dto.response.BootConfirmationDTO;
import demoStationApp.cmsInterface.dto.request.ChargingStatusDTO;
import demoStationApp.cmsInterface.dto.request.UploadLogsDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.cmsInterface.service.CentralManagementSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by swam on 08/08/14.
 */

@RestController
@RequestMapping(value = "/{stationManufacturerId}/cmsi", produces = "application/json")
public class CentralManagementSystemController {

    @Autowired
    private CentralManagementSystemService centralManagementSystemService;

    @RequestMapping(value = "/charging-status", method = RequestMethod.GET)
    public List<ChargingStatusDTO> getChargingStatus(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        return centralManagementSystemService.provideChargingStatus(stationManufacturerId);

    }

    @RequestMapping(value = "/reboot", method = RequestMethod.POST)
    public BootConfirmationDTO reboot(@PathVariable String stationManufacturerId) throws  CMSInterfaceException {
        return centralManagementSystemService.sendBootNotification(stationManufacturerId);
    }

    @RequestMapping(value = "/unlock/{slotPosition}", method = RequestMethod.POST)
    public void unlock(@PathVariable String stationManufacturerId, @PathVariable Integer slotPosition) throws CMSInterfaceException {

    }

    @RequestMapping(value = "/update-firmware", method = RequestMethod.POST)
    public void updateFirmware(@PathVariable String stationManufacturerId) throws CMSInterfaceException {

    }

    @RequestMapping(value = "/upload-logs", method = RequestMethod.POST)
    public void uploadLogs(@PathVariable String stationManufacturerId, @RequestBody UploadLogsDTO uploadLogsDTO) throws CMSInterfaceException {

    }

}
