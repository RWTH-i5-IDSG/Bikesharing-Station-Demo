package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.AuthorizeDTO;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.SlotRepository;
import demoStationApp.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by swam on 11/08/14.
 */

@Service
public class AuthorizeService {

    @Autowired
    private SlotRepository slotRepository;

    @Autowired
    private StationRepository stationRepository;

    @Autowired
    private PedelecRepository pedelecRepository;

    public void removePedelec(String stationManufacturerId, AuthorizeDTO authorizeDTO) {
        Station station = stationRepository.findOne(stationManufacturerId);

        Slot slot = slotRepository.findBySlotPositionAndStation(authorizeDTO.getSlotPosition(), station);

        slot.getPedelec().setSlot(null);
        slot.getPedelec().setOwner(authorizeDTO.getUserId());
        pedelecRepository.save(slot.getPedelec());

        slot.setPedelec(null);

        slotRepository.save(slot);
    }

}