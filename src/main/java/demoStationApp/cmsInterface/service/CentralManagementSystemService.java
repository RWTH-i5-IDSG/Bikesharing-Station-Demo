package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.request.SlotDTO;
import demoStationApp.cmsInterface.dto.response.BootConfirmationDTO;
import demoStationApp.cmsInterface.dto.request.BootNotificationDTO;
import demoStationApp.cmsInterface.dto.request.ChargingStatusDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.StationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by swam on 11/08/14.
 */

@Slf4j
@Service
public class CentralManagementSystemService {

    @Autowired
    private StationRepository stationRepository;

    public BootConfirmationDTO sendBootNotification(String stationManufacturerId) throws CMSInterfaceException {

        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("Station not found", "not defined");
        }

        ArrayList<SlotDTO> slots = new ArrayList<SlotDTO>();

        for (Slot slot : station.getSlots()) {
            SlotDTO bootNotificationSlotDTO;
            if (slot.getPedelec() != null) {
                bootNotificationSlotDTO = new SlotDTO(slot.getSlotManufacturerId(),slot.getSlotPosition(),slot.getPedelec().getPedelecManufacturerId(), "","",null);
            } else {
                bootNotificationSlotDTO = new SlotDTO(slot.getSlotManufacturerId(),slot.getSlotPosition(), null,"","",null);
            }
            slots.add(bootNotificationSlotDTO);
        }

        BootNotificationDTO bootNotificationDTO = new BootNotificationDTO(station.getStationManufacturerId(),station.getFirmwareVersion(), slots);

        BootConfirmationDTO bootConfirmationDTO = null;

        try
        {
            RestTemplate rt = new RestTemplate();

            String uri = "http://localhost:8080/psi/boot";

            bootConfirmationDTO = rt.postForObject(uri, bootNotificationDTO, BootConfirmationDTO.class);
            log.debug(bootConfirmationDTO.toString());

        } catch (HttpClientErrorException e) {
            log.error(e.getMessage());
        }
        return bootConfirmationDTO;
    }



    public List<ChargingStatusDTO> provideChargingStatus(String stationManufacturerId) throws CMSInterfaceException {

        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("Station not found", "not defined");
        }

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
