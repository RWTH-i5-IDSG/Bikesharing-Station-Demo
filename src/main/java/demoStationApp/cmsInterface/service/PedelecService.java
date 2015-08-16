package demoStationApp.cmsInterface.service;

import demoStationApp.ApplicationConfig;
import demoStationApp.cmsInterface.dto.request.*;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.Pedelec;
import demoStationApp.repository.PedelecRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.List;

/**
 * Created by swam on 11/08/14.
 */

@Slf4j
@Service
public class PedelecService {

    @Autowired private CentralManagementSystemService centralService;
    @Autowired private PedelecRepository pedelecRepository;
    @Autowired private RestTemplate restTemplate;

    private static final String PEDELEC_STATUS_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/status/pedelec";
    private static final String CHARGING_STATUS_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/status/charging";

    public PedelecConfigurationDTO providePedelecConfiguration(String stationManufacturerId,
                                                               String pedelecManufacturerId) throws CMSInterfaceException {
        Pedelec pedelec = this.getPedelec(pedelecManufacturerId);

        return PedelecConfigurationDTO.builder()
                .maxBatteryLevel(pedelec.getMaxBatteryLevel())
                .maxCurrentValue(pedelec.getMaxCurrentValue())
                .build();
    }

    public void setPedelecConfiguration(String pedelecManufacturerId,
                                        PedelecConfigurationDTO pedelecConfigurationDTO) throws CMSInterfaceException {
        Pedelec pedelec = this.getPedelec(pedelecManufacturerId);

        pedelec.setMaxCurrentValue(pedelecConfigurationDTO.getMaxCurrentValue());
        pedelec.setMaxBatteryLevel(pedelecConfigurationDTO.getMaxBatteryLevel());

        pedelecRepository.save(pedelec);
    }

    public void setPedelecOperationState(String pedelecManufacturerId,
                                         ChangePedelecOperationStateDTO changePedelecOperationStateDTO) throws CMSInterfaceException {
        Pedelec pedelec = this.getPedelec(pedelecManufacturerId);

        pedelec.setPedelecState(changePedelecOperationStateDTO.getPedelecState());
        pedelecRepository.save(pedelec);
    }

    public void sendPedelecStatusNotification(String stationManufacturerId,
                                              String pedelecManufacturerId) throws CMSInterfaceException {
        // TODO: Why get station? It's not used
        //Station station = this.getStation(stationManufacturerId);

        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        PedelecStatusDTO dto = PedelecStatusDTO.builder()
                .pedelecManufacturerId(pedelec.getPedelecManufacturerId())
                .pedelecState(pedelec.getPedelecState())
                .pedelecErrorInfo(pedelec.getPedelecErrorInfo())
                .pedelecErrorCode(pedelec.getPedelecErrorCode())
                .timestamp(new Date().getTime())
                .build();

        this.sendPedelecStatus(dto, stationManufacturerId);
    }

    public void sendChargingStatusNotification(String stationManufacturerId) throws CMSInterfaceException {
        List<ChargingStatusDTO> dtoList = centralService.provideChargingStatus(stationManufacturerId);
        this.sendChargingStatus(dtoList, stationManufacturerId);
    }

    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------

    private Pedelec getPedelec(String pedelecManufacturerId) throws CMSInterfaceException {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);
        if (pedelec == null) {
            throw new CMSInterfaceException("No pedelec found", "undefined");
        }
        return pedelec;
    }

    private void sendPedelecStatus(PedelecStatusDTO dto, String stationManufacturerId) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add("STATION-ID", stationManufacturerId);
            HttpEntity<PedelecStatusDTO> entity = new HttpEntity<PedelecStatusDTO>(dto, headers);

            String response = restTemplate.postForObject(PEDELEC_STATUS_PATH, entity, String.class);
            log.debug(response);
        } catch (RestClientException e) {
            log.error("Exception occurred", e);
        }
    }

    private void sendChargingStatus(List<ChargingStatusDTO> dtoList, String stationManufacturerId) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add("STATION-ID", stationManufacturerId);
            HttpEntity<List<ChargingStatusDTO>> entity = new HttpEntity<List<ChargingStatusDTO>>(dtoList, headers);

            String response = restTemplate.postForObject(CHARGING_STATUS_PATH, entity, String.class);
            log.debug(response);
        } catch (RestClientException e) {
            log.error("Exception occurred", e);
        }
    }

}
