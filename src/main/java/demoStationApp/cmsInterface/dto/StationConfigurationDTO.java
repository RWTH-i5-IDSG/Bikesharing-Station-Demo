package demoStationApp.cmsInterface.dto;

import lombok.Data;

/**
 * Created by swam on 08/08/14.
 */

@Data
public class StationConfigurationDTO {
    private String cmsURI;
    private Integer heartbeatInterval;
    private Integer openSlotTimeout;
    private Integer rebootRetrics;
    private Integer chargingStatusInformInterval;
}
