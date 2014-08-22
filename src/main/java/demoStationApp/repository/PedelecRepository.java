package demoStationApp.repository;

import demoStationApp.domain.Pedelec;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by swam on 11/08/14.
 */
public interface PedelecRepository extends JpaRepository<Pedelec, String> {

    public List<Pedelec> findBySlotIsNull();
}
