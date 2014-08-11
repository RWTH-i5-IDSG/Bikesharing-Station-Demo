package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.ChangeStationOperationStateDTO;
import demoStationApp.cmsInterface.dto.StationConfigurationDTO;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.SlotRepository;
import demoStationApp.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by swam on 11/08/14.
 */

@Service
public class StationService {

    @Autowired
    private StationRepository stationRepository;

    @Autowired
    private SlotRepository slotRepository;

    public void configurateStation(String stationManufacturerId, StationConfigurationDTO stationConfigurationDTO) {
        Station station = stationRepository.findOne(stationManufacturerId);

        station.setCmsURI(stationConfigurationDTO.getCmsURI());
        station.setOpenSlotTimeout(stationConfigurationDTO.getOpenSlotTimeout());
        station.setRebootRetries(stationConfigurationDTO.getRebootRetrics());
        station.setChargingStatusInformInterval(stationConfigurationDTO.getChargingStatusInformInterval());
        station.setHeartbeatInterval(stationConfigurationDTO.getHeartbeatInterval());

        stationRepository.save(station);
    }

    public StationConfigurationDTO provideStationConfiguration(String stationManufacturerId) {
        Station station = stationRepository.findOne(stationManufacturerId);

        StationConfigurationDTO stationConfigurationDTO = new StationConfigurationDTO();
        stationConfigurationDTO.setHeartbeatInterval(station.getHeartbeatInterval());
        stationConfigurationDTO.setChargingStatusInformInterval(station.getChargingStatusInformInterval());
        stationConfigurationDTO.setOpenSlotTimeout(station.getOpenSlotTimeout());
        stationConfigurationDTO.setCmsURI(station.getCmsURI());
        stationConfigurationDTO.setRebootRetrics(station.getRebootRetries());

        return stationConfigurationDTO;
    }

    public void setStationOperationState(String stationManufacturerId, ChangeStationOperationStateDTO changeStationOperationStateDTO) {

        Station station = stationRepository.findOne(stationManufacturerId);

        if (changeStationOperationStateDTO.getSlotPosition() != null) {
            Slot slot = slotRepository.findBySlotPositionAndStation(changeStationOperationStateDTO.getSlotPosition(), station);
            slot.setSlotState(changeStationOperationStateDTO.getState());
            slotRepository.save(slot);
            return;
        }

        station.setStationState(changeStationOperationStateDTO.getState());
        stationRepository.save(station);
    }

}
