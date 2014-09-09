package demoStationApp.cmsInterface.service;

import demoStationApp.ApplicationConfig;
import demoStationApp.cmsInterface.dto.request.ChangeStationOperationStateDTO;
import demoStationApp.cmsInterface.dto.request.SlotDTO;
import demoStationApp.cmsInterface.dto.request.StationConfigurationDTO;
import demoStationApp.cmsInterface.dto.request.StationStatusDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.SlotRepository;
import demoStationApp.repository.StationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by swam on 11/08/14.
 */

@Slf4j
@Service
public class StationService {

    @Autowired private StationRepository stationRepository;
    @Autowired private SlotRepository slotRepository;
    @Autowired private RestTemplate restTemplate;

    private static final String STATION_STATUS_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/status/station";

    public void configurateStation(String stationManufacturerId,
                                   StationConfigurationDTO stationConfigurationDTO) throws CMSInterfaceException {
        Station station = this.getStation(stationManufacturerId);

        station.setCmsURI(stationConfigurationDTO.getCmsURI());
        station.setOpenSlotTimeout(stationConfigurationDTO.getOpenSlotTimeout());
        station.setRebootRetries(stationConfigurationDTO.getRebootRetries());
        station.setChargingStatusInformInterval(stationConfigurationDTO.getChargingStatusInformInterval());
        station.setHeartbeatInterval(stationConfigurationDTO.getHeartbeatInterval());

        stationRepository.save(station);
    }

    public StationConfigurationDTO provideStationConfiguration(String stationManufacturerId) throws CMSInterfaceException {
        Station station = this.getStation(stationManufacturerId);

        StationConfigurationDTO stationConfigurationDTO = new StationConfigurationDTO();
        stationConfigurationDTO.setHeartbeatInterval(station.getHeartbeatInterval());
        stationConfigurationDTO.setChargingStatusInformInterval(station.getChargingStatusInformInterval());
        stationConfigurationDTO.setOpenSlotTimeout(station.getOpenSlotTimeout());
        stationConfigurationDTO.setCmsURI(station.getCmsURI());
        stationConfigurationDTO.setRebootRetries(station.getRebootRetries());

        return stationConfigurationDTO;
    }

    public void setStationOperationState(String stationManufacturerId,
                                         ChangeStationOperationStateDTO changeStationOperationStateDTO) throws CMSInterfaceException {
        Station station = this.getStation(stationManufacturerId);

        if (changeStationOperationStateDTO.getSlotPosition() != null) {
            Slot slot = slotRepository.findBySlotPositionAndStation(changeStationOperationStateDTO.getSlotPosition(), station);
            slot.setSlotState(changeStationOperationStateDTO.getState());
            slotRepository.save(slot);
            return;
        }

        station.setStationState(changeStationOperationStateDTO.getState());
        stationRepository.save(station);
    }


    public void sendStationStatusNotification(String stationManufacturerId) throws CMSInterfaceException {
        Station station = this.getStation(stationManufacturerId);

        ArrayList<SlotDTO> slots = new ArrayList<>();
        for (Slot slot : station.getSlots()) {
            SlotDTO stationSlotDTO = new SlotDTO(slot.getSlotManufacturerId(), null, null, slot.getSlotErrorCode(), slot.getSlotInfo(), slot.getSlotState());

            slots.add(stationSlotDTO);
        }

        StationStatusDTO stationStatusDTO = new StationStatusDTO(station.getStationManufacturerId(), station.getStationErrorCode(), station.getStationInfo(), new Date().getTime(), slots);

        this.sendStationStatus(stationStatusDTO);
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

    private void sendStationStatus(StationStatusDTO dto) {
        try {
            String response = restTemplate.postForObject(STATION_STATUS_PATH, dto, String.class);
            log.debug(response);
        } catch (RestClientException e) {
            log.error("Exception occurred", e);
        }
    }
}
