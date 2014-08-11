package demoStationApp.repository;

import demoStationApp.domain.Slot;
import demoStationApp.domain.Station;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by swam on 11/08/14.
 */
public interface SlotRepository extends JpaRepository<Slot, String> {

    public Slot findBySlotPositionAndStation(Integer slotPosition, Station station);

}
