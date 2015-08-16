package demoStationApp.service;

import demoStationApp.ApplicationConfig;
import demoStationApp.cmsInterface.dto.request.StartTransactionDTO;
import demoStationApp.cmsInterface.dto.request.StopTransactionDTO;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.SlotRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * Created by swam on 22/08/14.
 */

@Service
public class TransactionService {

    @Autowired private SlotRepository slotRepository;
    @Autowired private PedelecRepository pedelecRepository;
    @Autowired private RestTemplate restTemplate;

    private static final String START_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/transaction/start";
    private static final String STOP_PATH = ApplicationConfig.BACKEND_BASE_PATH + "/psi/transaction/stop";

    public void startTransaction(StartTransactionDTO startTransactionDTO) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("STATION-ID", startTransactionDTO.getStationManufacturerId());
        HttpEntity<StartTransactionDTO> entity = new HttpEntity<StartTransactionDTO>(startTransactionDTO, headers);
        restTemplate.postForLocation(START_PATH, entity);

        Pedelec pedelec = pedelecRepository.findOne(startTransactionDTO.getPedelecManufacturerId());
        Slot slot = slotRepository.findOne(startTransactionDTO.getSlotManufacturerId());
        pedelec.setSlot(null);
        slot.setPedelec(null);
        slotRepository.save(slot);
        pedelecRepository.save(pedelec);
    }

    public void stopTransaction(StopTransactionDTO stopTransactionDTO) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("STATION-ID", stopTransactionDTO.getStationManufacturerId());
        HttpEntity<StopTransactionDTO> entity = new HttpEntity<StopTransactionDTO>(stopTransactionDTO, headers);
        restTemplate.postForLocation(STOP_PATH, entity);

        Pedelec pedelec = pedelecRepository.findOne(stopTransactionDTO.getPedelecManufacturerId());
        Slot slot = slotRepository.findOne(stopTransactionDTO.getSlotManufacturerId());
        pedelec.setSlot(slot);
        slot.setPedelec(pedelec);
        slotRepository.save(slot);
        pedelecRepository.save(pedelec);
    }
}
