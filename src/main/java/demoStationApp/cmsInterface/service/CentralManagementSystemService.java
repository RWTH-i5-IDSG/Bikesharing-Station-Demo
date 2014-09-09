package demoStationApp.cmsInterface.service;

import demoStationApp.ApplicationConfig;
import demoStationApp.cmsInterface.dto.request.BootNotificationDTO;
import demoStationApp.cmsInterface.dto.request.ChargingStatusDTO;
import demoStationApp.cmsInterface.dto.request.SlotDTO;
import demoStationApp.cmsInterface.dto.response.BootConfirmationDTO;
import demoStationApp.cmsInterface.dto.response.HeartbeatDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.StationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import sun.print.PeekGraphics;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by swam on 11/08/14.
 */

@Slf4j
@Service
public class CentralManagementSystemService {

    @Autowired private StationRepository stationRepository;
    @Autowired private RestTemplate restTemplate;
    @Autowired private ThreadPoolTaskScheduler scheduler;

    private static final String BOOT_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/boot";
    private static final String HEARTBEAT_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/heartbeat";

    public BootConfirmationDTO sendBootNotification(String stationManufacturerId) throws CMSInterfaceException {
        Station station = this.getStation(stationManufacturerId);

        ArrayList<SlotDTO> slots = new ArrayList<>();
        for (Slot slot : station.getSlots()) {
            SlotDTO bootNotificationSlotDTO;

            Pedelec pedelec = slot.getPedelec();
            if (pedelec == null) {
                bootNotificationSlotDTO = new SlotDTO(slot.getSlotManufacturerId(), slot.getSlotPosition(), null, "", "", null);
            } else {
                bootNotificationSlotDTO = new SlotDTO(slot.getSlotManufacturerId(), slot.getSlotPosition(), pedelec.getPedelecManufacturerId(), "", "", null);
            }

            slots.add(bootNotificationSlotDTO);
        }

        BootNotificationDTO bootNotificationDTO = new BootNotificationDTO(station.getStationManufacturerId(),station.getFirmwareVersion(), slots);
        BootConfirmationDTO bootConfirmationDTO = this.sendBoot(bootNotificationDTO);

        long interval = bootConfirmationDTO.getHeartbeatInterval() * 1000; // delay in ms
        scheduler.scheduleAtFixedRate(new HeartbeatRunner(), interval);

        return bootConfirmationDTO;
    }

    public List<ChargingStatusDTO> provideChargingStatus(String stationManufacturerId) throws CMSInterfaceException {
        Station station = this.getStation(stationManufacturerId);

        ArrayList<ChargingStatusDTO> chargingStatusDTOArrayList = new ArrayList<>();
        for (Slot slot : station.getSlots()) {

            Pedelec pedelec = slot.getPedelec();
            if (pedelec != null) {
                ChargingStatusDTO dto = new ChargingStatusDTO();
                dto.setBattery(pedelec.getBattery());
                dto.setCharginState(pedelec.getChargingState());
                dto.setMeterValue(pedelec.getMeterValue());
                dto.setPedelecManufacturerId(pedelec.getPedelecManufacturerId());
                dto.setSlotManufacturerId(slot.getSlotManufacturerId());
                dto.setTimestamp(new Date().getTime());

                chargingStatusDTOArrayList.add(dto);
            }
        }
        return chargingStatusDTOArrayList;
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

    private BootConfirmationDTO sendBoot(BootNotificationDTO bootNotificationDTO) throws CMSInterfaceException {
        try {
            BootConfirmationDTO bootConfirmationDTO = restTemplate.postForObject(BOOT_PATH, bootNotificationDTO, BootConfirmationDTO.class);
            log.debug(bootConfirmationDTO.toString());
            return bootConfirmationDTO;

        } catch (RestClientException e) {
            log.error("Exception occurred", e);
            throw new CMSInterfaceException(e.getMessage(), "not defined");
        }
    }

    private class HeartbeatRunner implements Runnable {
        @Override
        public void run() {
            HeartbeatDTO heartbeatDTO = restTemplate.getForObject(HEARTBEAT_PATH, HeartbeatDTO.class);
            log.debug(heartbeatDTO.toString());
        }
    }

}
