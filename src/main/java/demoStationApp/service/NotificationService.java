package demoStationApp.service;

import demoStationApp.cmsInterface.dto.request.BootNotificationDTO;
import demoStationApp.cmsInterface.dto.request.SlotDTO;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by swam on 06/11/14.
 */

@Service
@Transactional(readOnly = true)
public class NotificationService {

    @Autowired
    private StationRepository stationRepository;

    public BootNotificationDTO generateBootNotification(String stationManufacturerId) {
        Station station = stationRepository.findByStationManufacturerId(stationManufacturerId);

        List<SlotDTO> slotDTOs = new ArrayList<>();

        for (Slot slot : station.getSlots()) {
            SlotDTO slotDTO = SlotDTO.builder()
                .slotManufacturerId(slot.getSlotManufacturerId())
                .slotPosition(slot.getSlotPosition())
                .pedelecManufacturerId(slot.getPedelec().getPedelecManufacturerId())
                .build();

            slotDTOs.add(slotDTO);
        }

        BootNotificationDTO bootNotificationDTO = BootNotificationDTO.builder()
            .stationManufacturerId(stationManufacturerId)
            .firmwareVersion("1.0")
            .slots(slotDTOs)
            .build();

        return bootNotificationDTO;
    }


}
