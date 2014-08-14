package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.request.*;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.PedelecRepository;
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
public class PedelecService {

    @Autowired
    private PedelecRepository pedelecRepository;

    @Autowired
    private StationRepository stationRepository;

    public PedelecConfigurationDTO providePedelecConfiguration(String stationManufacturerId, String pedelecManufacturerId) throws CMSInterfaceException {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        if (pedelec == null) {
            throw new CMSInterfaceException("No pedelec found", "not defined");
        }

        PedelecConfigurationDTO pedelecConfigurationDTO = new PedelecConfigurationDTO();
        pedelecConfigurationDTO.setMaxBatteryLevel(pedelec.getMaxBatteryLevel());
        pedelecConfigurationDTO.setMaxCurrentValue(pedelec.getMaxCurrentValue());

        return pedelecConfigurationDTO;
    }

    public void setPedelecConfiguration(String pedelecManufacturerId, PedelecConfigurationDTO pedelecConfigurationDTO) throws CMSInterfaceException {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        if (pedelec == null) {
            throw new CMSInterfaceException("No pedelec found", "not defined");
        }

        pedelec.setMaxCurrentValue(pedelecConfigurationDTO.getMaxCurrentValue());
        pedelec.setMaxBatteryLevel(pedelecConfigurationDTO.getMaxBatteryLevel());

        pedelecRepository.save(pedelec);
    }

    public void setPedelecOperationState(String pedelecManufacturerId, ChangePedelecOperationStateDTO changePedelecOperationStateDTO) throws CMSInterfaceException {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        if (pedelec == null) {
            throw new CMSInterfaceException("No pedelec found", "not defined");
        }

        pedelec.setPedelecState(changePedelecOperationStateDTO.getPedelecState());
        pedelecRepository.save(pedelec);
    }


    public void sendPedelecStatusNotification(String stationManufacturerId) throws CMSInterfaceException {
        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("Station not found", "not defined");
        }

        ArrayList<PedelecStatusDTO> pedelecStatusDTOs = new ArrayList<>();

        for (Slot slot : station.getSlots()) {
            if (slot.getPedelec() == null) {
                continue;
            }
            PedelecStatusDTO pedelecStatusDTO = new PedelecStatusDTO();
            pedelecStatusDTO.setPedelecmanufacturerId(slot.getPedelec().getPedelecManufacturerId());
            pedelecStatusDTO.setPedelecState(slot.getPedelec().getPedelecState());
            pedelecStatusDTO.setPedelecInfo(slot.getPedelec().getPedelecInfo());
            pedelecStatusDTO.setPedelecInfo(slot.getPedelec().getPedelecErrorCode());
            pedelecStatusDTO.setTimestamp(new Date().getTime());

            pedelecStatusDTOs.add(pedelecStatusDTO);
        }

        try
        {
            RestTemplate rt = new RestTemplate();

            String uri = "http://localhost:8080/psi/status/pedelec";

            rt.postForObject(uri, pedelecStatusDTOs, String.class);

        } catch (HttpClientErrorException e) {
            log.error(e.getMessage());
        }
    }

    public void sendChargingStatusNotification(String stationManufacturerId) throws CMSInterfaceException {
        Station station = stationRepository.findOne(stationManufacturerId);

        if (station == null) {
            throw new CMSInterfaceException("Station not found", "not defined");
        }

        ArrayList<ChargingStatusDTO> chargingStatusDTOs = new ArrayList<>();

        for (Slot slot : station.getSlots()) {
            if (slot.getPedelec() == null) {
                continue;
            }

            ChargingStatusDTO chargingStatusDTO = new ChargingStatusDTO();
            chargingStatusDTO.setTimestamp(new Date().getTime());
            chargingStatusDTO.setBattery(slot.getPedelec().getBattery());
            chargingStatusDTO.setCharginState(slot.getPedelec().getChargingState());
            chargingStatusDTO.setMeterValue(slot.getPedelec().getMeterValue());
            chargingStatusDTO.setPedelecManufacturerId(slot.getPedelec().getPedelecManufacturerId());
            chargingStatusDTO.setSlotManufacturerId(slot.getSlotManufacturerId());

            chargingStatusDTOs.add(chargingStatusDTO);
        }

        try
        {
            RestTemplate rt = new RestTemplate();

            String uri = "http://localhost:8080/psi/status/charging";

            rt.postForObject(uri, chargingStatusDTOs, String.class);

        } catch (HttpClientErrorException e) {
            log.error(e.getMessage());
        }
    }

}
