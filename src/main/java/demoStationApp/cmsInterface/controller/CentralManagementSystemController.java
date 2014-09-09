package demoStationApp.cmsInterface.controller;

import demoStationApp.cmsInterface.dto.request.ChargingStatusDTO;
import demoStationApp.cmsInterface.dto.request.UploadLogsDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.cmsInterface.service.CentralManagementSystemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by swam on 08/08/14.
 */

@Slf4j
@RestController
@RequestMapping(value = "/{stationManufacturerId}/cmsi", produces = MediaType.APPLICATION_JSON_VALUE)
public class CentralManagementSystemController {

    @Autowired private CentralManagementSystemService centralManagementSystemService;

    @RequestMapping(value = "/charging-status", method = RequestMethod.GET)
    public List<ChargingStatusDTO> getChargingStatus(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        return centralManagementSystemService.provideChargingStatus(stationManufacturerId);
    }

    @RequestMapping(value = "/reboot", method = RequestMethod.POST)
    public void reboot(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        log.debug("REBOOT INITIATED");
    }

    @RequestMapping(value = "/unlock/{slotPosition}", method = RequestMethod.POST)
    public void unlock(@PathVariable String stationManufacturerId,
                       @PathVariable Integer slotPosition) throws CMSInterfaceException {
        // TODO
    }

    @RequestMapping(value = "/update-firmware", method = RequestMethod.POST)
    public void updateFirmware(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        // TODO
    }

    @RequestMapping(value = "/upload-logs", method = RequestMethod.POST)
    public void uploadLogs(@PathVariable String stationManufacturerId,
                           @RequestBody UploadLogsDTO uploadLogsDTO) throws CMSInterfaceException {
        // TODO
    }

    @RequestMapping(value = "/boot", method = RequestMethod.POST)
    public void boot(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        log.debug("BOOT NOTIFICATION SENT");
        centralManagementSystemService.sendBootNotification(stationManufacturerId);
    }

}
