package demoStationApp.controller;

import demoStationApp.cmsInterface.dto.request.CustomerAuthorizeDTO;
import demoStationApp.cmsInterface.dto.request.StartTransactionDTO;
import demoStationApp.cmsInterface.dto.request.StopTransactionDTO;
import demoStationApp.cmsInterface.dto.response.AuthorizeConfirmationDTO;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Station;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.StationRepository;
import demoStationApp.service.GeneralStationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Slf4j
@RestController
public class StationRESTController {

    @Autowired
    private StationRepository stationRepository;

    @Autowired
    private GeneralStationService generalStationService;

    @Autowired
    private PedelecRepository pedelecRepository;

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

    @RequestMapping(value = "/stations/{manufacturerId}/authorize", method = RequestMethod.POST)
    public AuthorizeConfirmationDTO authenticate(@RequestBody CustomerAuthorizeDTO customerAuthorizeDTO) throws HttpClientErrorException {
        log.info("Authorize :{}", customerAuthorizeDTO);

        String uri = "http://localhost:8080/psi/authorize";
        return new RestTemplate().postForObject(uri, customerAuthorizeDTO, AuthorizeConfirmationDTO.class);
    }


    @RequestMapping(value = "/stations/{manufacturerId}/takePedelec", method = RequestMethod.POST)
    public void takeBike(@RequestBody StartTransactionDTO startTransactionDTO) {
        log.info("Pedelec taken: {}", startTransactionDTO);

        generalStationService.startTransaction(startTransactionDTO);

    }

    @RequestMapping(value = "/stations/{manufacturerId}/returnPedelec", method = RequestMethod.POST)
    public void returnBike(@RequestBody StopTransactionDTO stopTransactionDTO) {
        log.info("Pedelec return: {}", stopTransactionDTO);

        generalStationService.stopTransaction(stopTransactionDTO);
    }

}
