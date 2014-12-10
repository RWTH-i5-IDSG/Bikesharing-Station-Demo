package demoStationApp.repository;

import demoStationApp.Application;
import demoStationApp.domain.Battery;
import demoStationApp.domain.ChargingState;
import demoStationApp.domain.OperationState;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by swam on 05/11/14.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
@DirtiesContext(classMode= DirtiesContext.ClassMode.AFTER_CLASS)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class StationRepositoryTest {

    @Autowired
    private StationRepository stationRepository;

    @Test
    public void test_1_generateDemoData() {
        for (int i = 0; i < 5; i++) {
            Station station = new Station();

            station.setStationManufacturerId(UUID.randomUUID().toString());
            station.setFirmwareVersion("0.1a");
            station.setStationErrorCode("");
            station.setStationErrorInfo("");
            station.setStationState(OperationState.OPERATIVE);
            station.setHeartbeatInterval(30);

            ArrayList<Slot> slots = new ArrayList<Slot>();

            for (int j = 0; j < 20; j++) {
                Slot slot = new Slot();
                slot.setSlotManufacturerId(UUID.randomUUID().toString());
                slot.setSlotPosition(j+1);
                slot.setSlotErrorCode("");
                slot.setSlotErrorInfo("");
                slot.setSlotState(OperationState.OPERATIVE);

                if(Math.round(Math.random()+0.1) == 1) {
                    slot.setPedelec(generatePedelec(slot));
                }

                slot.setStation(station);

                slots.add(slot);
            }

            station.setSlots(slots);

            stationRepository.save(station);
        }
    }


    private Pedelec generatePedelec(Slot slot) {
        Pedelec pedelec = new Pedelec();

        pedelec.setPedelecManufacturerId(UUID.randomUUID().toString());
        pedelec.setPedelecErrorCode("");
        pedelec.setPedelecErrorInfo("");
        pedelec.setPedelecState(OperationState.OPERATIVE);
        pedelec.setChargingState(ChargingState.CHARGING);
        pedelec.setMeterValue(Math.random());

        Battery battery = new Battery();
        battery.setSoc(Math.random());
        battery.setTemperature(Math.random() * 10.0 + 15.0);
        battery.setCycleCount(Math.round(Math.random() * 200));
        battery.setVoltage(12.0);
        battery.setCurrent(1.0);

        pedelec.setBattery(battery);

        pedelec.setSlot(slot);

        return pedelec;
    }

}
