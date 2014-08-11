package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.ChangePedelecOperationStateDTO;
import demoStationApp.cmsInterface.dto.PedelecConfigurationDTO;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Station;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by swam on 11/08/14.
 */

@Service
public class PedelecService {

    @Autowired
    private PedelecRepository pedelecRepository;

    public PedelecConfigurationDTO providePedelecConfiguration(String stationManufacturerId, String pedelecManufacturerId) {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        PedelecConfigurationDTO pedelecConfigurationDTO = new PedelecConfigurationDTO();
        pedelecConfigurationDTO.setMaxBatteryLevel(pedelec.getMaxBatteryLevel());
        pedelecConfigurationDTO.setMaxCurrentValue(pedelec.getMaxCurrentValue());

        return pedelecConfigurationDTO;
    }

    public void setPedelecConfiguration(String pedelecManufacturerId, PedelecConfigurationDTO pedelecConfigurationDTO) {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        pedelec.setMaxCurrentValue(pedelecConfigurationDTO.getMaxCurrentValue());
        pedelec.setMaxBatteryLevel(pedelecConfigurationDTO.getMaxBatteryLevel());

        pedelecRepository.save(pedelec);
    }

    public void setPedelecOperationState(String pedelecManufacturerId, ChangePedelecOperationStateDTO changePedelecOperationStateDTO) {
        Pedelec pedelec = pedelecRepository.findOne(pedelecManufacturerId);

        pedelec.setPedelecState(changePedelecOperationStateDTO.getPedelecState());
        pedelecRepository.save(pedelec);
    }
}
