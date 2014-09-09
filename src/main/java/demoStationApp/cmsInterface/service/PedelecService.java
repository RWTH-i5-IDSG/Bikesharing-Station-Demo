package demoStationApp.cmsInterface.service;

import demoStationApp.ApplicationConfig;
import demoStationApp.cmsInterface.dto.request.ChangePedelecOperationStateDTO;
import demoStationApp.cmsInterface.dto.request.ChargingStatusDTO;
import demoStationApp.cmsInterface.dto.request.PedelecConfigurationDTO;
import demoStationApp.cmsInterface.dto.request.PedelecStatusDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.StationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by swam on 11/08/14.
 */

@Slf4j
@Service
public class PedelecService {

    @Autowired private PedelecRepository pedelecRepository;
    @Autowired private StationRepository stationRepository;
    @Autowired private RestTemplate restTemplate;

    private static final String PEDELEC_STATUS_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/status/pedelec";
    private static final String CHARGING_STATUS_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/status/charging";

    public PedelecConfigurationDTO providePedelecConfiguration(String stationManufacturerId,
                                                               String pedelecManufacturerId) throws CMSInterfaceException {
        Pedelec pedelec = this.getPedelec(pedelecManufacturerId);

        PedelecConfigurationDTO pedelecConfigurationDTO = new PedelecConfigurationDTO();
        pedelecConfigurationDTO.setMaxBatteryLevel(pedelec.getMaxBatteryLevel());
        pedelecConfigurationDTO.setMaxCurrentValue(pedelec.getMaxCurrentValue());

        return pedelecConfigurationDTO;
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
        Station station = this.getStation(stationManufacturerId);

        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        PedelecStatusDTO dto = new PedelecStatusDTO();
        dto.setPedelecmanufacturerId(pedelec.getPedelecManufacturerId());
        dto.setPedelecState(pedelec.getPedelecState());
        dto.setPedelecInfo(pedelec.getPedelecInfo());
        dto.setPedelecErrorCode(pedelec.getPedelecErrorCode());
        dto.setTimestamp(new Date().getTime());

        this.sendPedelecStatus(dto);
    }

    public void sendChargingStatusNotification(String stationManufacturerId) throws CMSInterfaceException {
        Station station = this.getStation(stationManufacturerId);

        ArrayList<ChargingStatusDTO> chargingStatusDTOs = new ArrayList<>();
        for (Slot slot : station.getSlots()) {

            Pedelec pedelec = slot.getPedelec();
            if (pedelec != null) {
                ChargingStatusDTO dto = new ChargingStatusDTO();
                dto.setTimestamp(new Date().getTime());
                dto.setBattery(pedelec.getBattery());
                dto.setCharginState(pedelec.getChargingState());
                dto.setMeterValue(pedelec.getMeterValue());
                dto.setPedelecManufacturerId(pedelec.getPedelecManufacturerId());
                dto.setSlotManufacturerId(slot.getSlotManufacturerId());

                chargingStatusDTOs.add(dto);
            }
        }

        this.sendChargingStatus(chargingStatusDTOs);
    }

    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------

    private Station getStation(String stationManufacturerId) throws CMSInterfaceException {
        Station station = stationRepository.findOne(stationManufacturerId);
        if (station == null) {
            throw new CMSInterfaceException("Station not found", "not defined");
        }
        return station;
    }

    private Pedelec getPedelec(String pedelecManufacturerId) throws CMSInterfaceException {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);
        if (pedelec == null) {
            throw new CMSInterfaceException("No pedelec found", "undefined");
        }
        return pedelec;
    }

    private void sendPedelecStatus(PedelecStatusDTO dto) {
        try {
            String response = restTemplate.postForObject(PEDELEC_STATUS_PATH, dto, String.class);
            log.debug(response);
        } catch (RestClientException e) {
            log.error("Exception occurred", e);
        }
    }

    private void sendChargingStatus(List<ChargingStatusDTO> dtoList) {
        try {
            String response = restTemplate.postForObject(CHARGING_STATUS_PATH, dtoList, String.class);
            log.debug(response);
        } catch (RestClientException e) {
            log.error("Exception occurred", e);
        }
    }

}
