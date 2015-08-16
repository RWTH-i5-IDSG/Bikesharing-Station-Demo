package demoStationApp.cmsInterface.service;

import demoStationApp.cmsInterface.dto.request.AuthorizeDTO;
import demoStationApp.cmsInterface.dto.request.StartTransactionDTO;
import demoStationApp.cmsInterface.exception.CMSInterfaceException;
import demoStationApp.domain.OperationState;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.PedelecRepository;
import demoStationApp.repository.SlotRepository;
import demoStationApp.repository.StationRepository;
import demoStationApp.service.TransactionService;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by swam on 11/08/14.
 */

@Service
public class AuthorizeService {

    @Autowired private SlotRepository slotRepository;
    @Autowired private StationRepository stationRepository;
    @Autowired private PedelecRepository pedelecRepository;
    @Autowired private TransactionService transactionService;

    @Transactional(readOnly = false)
    public void removePedelec(String stationManufacturerId, AuthorizeDTO authorizeDTO) throws CMSInterfaceException {
        Station station = stationRepository.findOne(stationManufacturerId);
        Slot slot = slotRepository.findBySlotPositionAndStation(authorizeDTO.getSlotPosition(), station);
        Pedelec pedelec = slot.getPedelec();

        if (pedelec != null) {
            if (pedelec.getPedelecState() != OperationState.INOPERATIVE) {
                StartTransactionDTO transactionDTO = StartTransactionDTO.builder()
                        .cardId(authorizeDTO.getCardId())
                        .pedelecManufacturerId(pedelec.getPedelecManufacturerId())
                        .slotManufacturerId(slot.getSlotManufacturerId())
                        .stationManufacturerId(stationManufacturerId)
                        .timestamp(new LocalDateTime().now().toDateTime().getMillis()/1000)
                        .build();

                transactionService.startTransaction(transactionDTO);
            }
        } else {
            throw new CMSInterfaceException("Pedelec not available!", "not defined");
        }

        if (slot == null || station == null) {
            throw  new CMSInterfaceException("Slot or Station not found", "not defined");
        }

        pedelec.setOwner(authorizeDTO.getCardId());
        pedelecRepository.save(pedelec);
    }
}
