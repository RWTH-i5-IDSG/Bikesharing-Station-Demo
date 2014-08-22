package demoStationApp.service;

import demoStationApp.cmsInterface.dto.request.StartTransactionDTO;
import demoStationApp.cmsInterface.dto.request.StopTransactionDTO;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.SlotRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * Created by swam on 22/08/14.
 */

@Service
public class GeneralStationService {

    @Autowired
    private SlotRepository slotRepository;

    @Autowired
    private PedelecRepository pedelecRepository;

    public void startTransaction(StartTransactionDTO startTransactionDTO) {
        Pedelec pedelec = pedelecRepository.findOne(startTransactionDTO.getPedelecManufacturerId());
        Slot slot = slotRepository.findOne(startTransactionDTO.getSlotManufacturerId());
        pedelec.setSlot(null);
        slot.setPedelec(null);
        slotRepository.save(slot);
        pedelecRepository.save(pedelec);

        String uri = "http://localhost:8080/psi/transaction/start";
        new RestTemplate().postForLocation(uri, startTransactionDTO);
    }

    public void stopTransaction(StopTransactionDTO stopTransactionDTO) {
        Pedelec pedelec = pedelecRepository.findOne(stopTransactionDTO.getPedelecManufacturerId());
        Slot slot = slotRepository.findOne(stopTransactionDTO.getSlotManufacturerId());
        pedelec.setSlot(slot);
        slot.setPedelec(pedelec);
        slotRepository.save(slot);
        pedelecRepository.save(pedelec);

        String uri = "http://localhost:8080/psi/transaction/stop";
        new RestTemplate().postForLocation(uri, stopTransactionDTO);
    }
}
