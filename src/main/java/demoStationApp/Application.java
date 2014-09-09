package demoStationApp;

import demoStationApp.domain.Battery;
import demoStationApp.domain.ChargingState;
import demoStationApp.domain.OperationState;
import demoStationApp.domain.Pedelec;
import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import demoStationApp.repository.StationRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.UUID;

@ComponentScan
@Configuration
@EnableAutoConfiguration
public class Application {

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(Application.class, args);
        //generateDemoData(context);
    }

    @Bean
    public ThreadPoolTaskScheduler threadPoolTaskScheduler() {
        ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
        scheduler.setPoolSize(5);
        return scheduler;
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    private static void generateDemoData(ConfigurableApplicationContext context) {
        StationRepository stationRepository = context.getBean(StationRepository.class);

        for (int i = 0; i < 5; i++) {
            Station station = new Station();

            station.setStationManufacturerId(UUID.randomUUID().toString());
            station.setFirmwareVersion("0.1a");
            station.setStationErrorCode("");
            station.setStationInfo("");
            station.setStationState(OperationState.OPERATIVE);
            station.setHeartbeatInterval(30);

            ArrayList<Slot> slots = new ArrayList<Slot>();

            for (int j = 0; j < 20; j++) {
                Slot slot = new Slot();
                slot.setSlotManufacturerId(UUID.randomUUID().toString());
                slot.setSlotPosition(j+1);
                slot.setSlotErrorCode("");
                slot.setSlotInfo("");
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

    private static Pedelec generatePedelec(Slot slot) {
        Pedelec pedelec = new Pedelec();

        pedelec.setPedelecManufacturerId(UUID.randomUUID().toString());
        pedelec.setPedelecErrorCode("");
        pedelec.setPedelecInfo("");
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
