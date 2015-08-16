package demoStationApp.controller;

import demoStationApp.ApplicationConfig;
import demoStationApp.cmsInterface.dto.request.CustomerAuthorizeDTO;
import demoStationApp.cmsInterface.dto.request.StartTransactionDTO;
import demoStationApp.cmsInterface.dto.request.StopTransactionDTO;
import demoStationApp.cmsInterface.dto.response.AuthorizeConfirmationDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.cmsInterface.service.CentralManagementSystemService;
import demoStationApp.cmsInterface.service.PedelecService;
import demoStationApp.cmsInterface.service.StationService;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Station;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.StationRepository;
import demoStationApp.service.TransactionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Slf4j
@RestController
public class StationRESTController {

    @Autowired private StationRepository stationRepository;
    @Autowired private TransactionService transactionService;
    @Autowired private PedelecRepository pedelecRepository;
    @Autowired private RestTemplate restTemplate;
    @Autowired private CentralManagementSystemService centralManagementSystemService;
    @Autowired private PedelecService pedelecService;
    @Autowired private StationService stationService;

    private static final String AUTH_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/authorize";


    /*
     * Internal Communication
     */

    @RequestMapping("/stations")
    public List<Station> getStations() {
        return stationRepository.findAll();
    }

    @RequestMapping("/stations/{manufacturerId}")
    public Station getStation(@PathVariable String manufacturerId) {
        return stationRepository.findOne(manufacturerId);
    }

    @RequestMapping("/stations/{manufacturerId}/rentedPedelecs")
    public List<Pedelec> getRentedPedelecs(@PathVariable String manufacturerId) {
        return pedelecRepository.findBySlotIsNull();
    }


    /*
     * Authorization, Start-, Stop-Transaction Requests
     */

    @RequestMapping(value = "/stations/{manufacturerId}/authorize", method = RequestMethod.POST)
    public AuthorizeConfirmationDTO authorize(@PathVariable String manufacturerId,
                                              @RequestBody CustomerAuthorizeDTO customerAuthorizeDTO) throws RestClientException {
        log.info("Authorize: {}", customerAuthorizeDTO);

        HttpHeaders headers = new HttpHeaders();
        headers.add("STATION-ID", manufacturerId);
        HttpEntity<CustomerAuthorizeDTO> entity = new HttpEntity<>(customerAuthorizeDTO, headers);
        return restTemplate.postForObject(AUTH_PATH, entity, AuthorizeConfirmationDTO.class);
    }

    @RequestMapping(value = "/stations/{manufacturerId}/takePedelec", method = RequestMethod.POST, produces = "application/json")
    public void takeBike(@PathVariable String manufacturerId,
                         @RequestBody StartTransactionDTO startTransactionDTO) throws RestClientException {
        log.info("Pedelec taken: {}", startTransactionDTO);

        transactionService.startTransaction(startTransactionDTO);
    }

    @RequestMapping(value = "/stations/{manufacturerId}/returnPedelec", method = RequestMethod.POST)
    public void returnBike(@PathVariable String manufacturerId,
                           @RequestBody StopTransactionDTO stopTransactionDTO) {
        log.info("Pedelec return: {}", stopTransactionDTO);

        transactionService.stopTransaction(stopTransactionDTO);
    }


    /*
     * Trigger Notification from Demo-Site
     */

    @RequestMapping(value = "/{stationManufacturerId}/sendBootNotification", method = RequestMethod.POST)
    public void boot(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        log.debug("BOOT NOTIFICATION SENT");
        centralManagementSystemService.sendBootNotification(stationManufacturerId);
    }

    @RequestMapping(value = "/{stationManufacturerId}/pedelecs/{pedelecManufacturerId}/sendPedelecStatusNotification", method = RequestMethod.POST)
    public void sendPedelecStatusNotification(@PathVariable String stationManufacturerId,
                                              @PathVariable String pedelecManufacturerId) throws CMSInterfaceException {
        pedelecService.sendPedelecStatusNotification(stationManufacturerId, pedelecManufacturerId);
    }

    @RequestMapping(value = "/{stationManufacturerId}/sendChargingStatusNotification", method = RequestMethod.POST)
    public void sendChargingStatusNotification(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        pedelecService.sendChargingStatusNotification(stationManufacturerId);
    }

    @RequestMapping(value = "/{stationManufacturerId}/sendStationStatusNotification", method = RequestMethod.POST)
    public void sendStationStatusNotification(@PathVariable String stationManufacturerId) throws CMSInterfaceException {
        stationService.sendStationStatusNotification(stationManufacturerId);
    }

}
