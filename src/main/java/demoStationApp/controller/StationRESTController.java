package demoStationApp.controller;

import java.util.List;

import demoStationApp.domain.Station;
import demoStationApp.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StationRESTController {

    @Autowired
    private StationRepository stationRepository;

    @RequestMapping("/stations")
    public List<Station> getStations() {

        return stationRepository.findAll();
    }
}
