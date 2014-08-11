package demoStationApp.repository;

import demoStationApp.domain.Pedelec;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by swam on 11/08/14.
 */
public interface PedelecRepository extends JpaRepository<Pedelec, String> {
}
