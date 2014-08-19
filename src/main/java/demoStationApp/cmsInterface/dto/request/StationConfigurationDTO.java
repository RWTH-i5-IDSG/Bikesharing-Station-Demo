package demoStationApp.cmsInterface.dto.request;

import lombok.Data;

/**
 * Created by swam on 08/08/14.
 */

@Data
public class StationConfigurationDTO {
    private String cmsURI;
    private Integer heartbeatInterval;
    private Integer openSlotTimeout;
    private Integer rebootRetries;
    private Integer chargingStatusInformInterval;
}
