package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.ChargingStatusDTO;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by swam on 11/08/14.
 */

@Service
public class CentralManagementSystemService {

    @Autowired
    private StationRepository stationRepository;

    public List<ChargingStatusDTO> provideChargingStatus(String stationManufacturerId) {
        Station station = stationRepository.findOne(stationManufacturerId);

        ArrayList<ChargingStatusDTO> chargingStatusDTOArrayList = new ArrayList<ChargingStatusDTO>();

        for (Slot slot : station.getSlots()) {
            if (slot.getPedelec() != null) {
                ChargingStatusDTO chargingStatusDTO = new ChargingStatusDTO();
                chargingStatusDTO.setBattery(slot.getPedelec().getBattery());
                chargingStatusDTO.setCharginState(slot.getPedelec().getChargingState());
                chargingStatusDTO.setMeterValue(slot.getPedelec().getMeterValue());
                chargingStatusDTO.setPedelecManufacturerId(slot.getPedelec().getPedelecManufacturerId());
                chargingStatusDTO.setSlotManufacturerId(slot.getSlotManufacturerId());
                chargingStatusDTO.setTimestamp(new Date().getTime());

                chargingStatusDTOArrayList.add(chargingStatusDTO);
            }
        }

        return chargingStatusDTOArrayList;
    }

}
