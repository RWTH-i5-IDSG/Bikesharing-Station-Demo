package demoStationApp.cmsInterface.controller;

import demoStationApp.cmsInterface.dto.request.AuthorizeDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.cmsInterface.service.AuthorizeService;
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
@RequestMapping(value = "/{stationManufacturerId}/cmsi/authorize", produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthorizeController {

    @Autowired private AuthorizeService authorizeService;

    @RequestMapping(value = "/remote", method = RequestMethod.POST)
    public void remoteAuthorize(@PathVariable String stationManufacturerId,
                                @RequestBody AuthorizeDTO authorizeDTO) throws CMSInterfaceException {
        authorizeService.removePedelec(stationManufacturerId, authorizeDTO);
    }

    @RequestMapping(value = "/cancel/{slotPosition}", method = RequestMethod.POST)
    public void cancelAuthorize(@PathVariable String stationManufacturerId,
                                @PathVariable Integer slotPosition) throws CMSInterfaceException {
        // TODO
    }
}
