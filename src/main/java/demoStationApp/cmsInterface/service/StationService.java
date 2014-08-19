package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.request.*;
import demoStationApp.cmsInterface.dto.response.BootConfirmationDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.SlotRepository;
import demoStationApp.repository.StationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by swam on 11/08/14.
 */

@Slf4j
@Service
public class StationService {

    @Autowired
    private StationRepository stationRepository;

    @Autowired
    private SlotRepository slotRepository;

    public void configurateStation(String stationManufacturerId, StationConfigurationDTO stationConfigurationDTO) throws CMSInterfaceException {
        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("No station found","not defined");
        }

        station.setCmsURI(stationConfigurationDTO.getCmsURI());
        station.setOpenSlotTimeout(stationConfigurationDTO.getOpenSlotTimeout());
        station.setRebootRetries(stationConfigurationDTO.getRebootRetries());
        station.setChargingStatusInformInterval(stationConfigurationDTO.getChargingStatusInformInterval());
        station.setHeartbeatInterval(stationConfigurationDTO.getHeartbeatInterval());

        stationRepository.save(station);
    }

    public StationConfigurationDTO provideStationConfiguration(String stationManufacturerId) throws CMSInterfaceException {
        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("No station found","not defined");
        }

        StationConfigurationDTO stationConfigurationDTO = new StationConfigurationDTO();
        stationConfigurationDTO.setHeartbeatInterval(station.getHeartbeatInterval());
        stationConfigurationDTO.setChargingStatusInformInterval(station.getChargingStatusInformInterval());
        stationConfigurationDTO.setOpenSlotTimeout(station.getOpenSlotTimeout());
        stationConfigurationDTO.setCmsURI(station.getCmsURI());
        stationConfigurationDTO.setRebootRetries(station.getRebootRetries());

        return stationConfigurationDTO;
    }

    public void setStationOperationState(String stationManufacturerId, ChangeStationOperationStateDTO changeStationOperationStateDTO) throws CMSInterfaceException {

        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("No station found","not defined");
        }

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
        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("Station not found", "not defined");
        }

        ArrayList<SlotDTO> slots = new ArrayList<SlotDTO>();

        for (Slot slot : station.getSlots()) {
            SlotDTO stationSlotDTO = new SlotDTO(slot.getSlotManufacturerId(), null, null, slot.getSlotErrorCode(), slot.getSlotInfo(), slot.getSlotState());

            slots.add(stationSlotDTO);
        }

        StationStatusDTO stationStatusDTO = new StationStatusDTO(station.getStationManufacturerId(), station.getStationErrorCode(), station.getStationInfo(), new Date().getTime(), slots);

        try
        {
            RestTemplate rt = new RestTemplate();

            String uri = "http://localhost:8080/psi/status/station";

            rt.postForObject(uri, stationStatusDTO, String.class);

        } catch (HttpClientErrorException e) {
            log.error(e.getMessage());
        }
    }
}
