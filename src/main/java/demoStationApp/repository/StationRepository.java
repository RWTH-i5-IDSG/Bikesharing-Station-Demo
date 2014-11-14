package demoStationApp.repository;

import demoStationApp.domain.Station;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by swam on 07/08/14.
 */
public interface StationRepository extends JpaRepository<Station, String> {

    Station findByStationManufacturerId(String stationManufacturerId);

}
