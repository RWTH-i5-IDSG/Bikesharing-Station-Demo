package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 08/08/14.
 */
@Getter
@Builder
public final class StationConfigurationDTO {
    private final String cmsURI;
    private final Integer heartbeatInterval;
    private final Integer openSlotTimeout;
    private final Integer rebootRetries;
    private final Integer chargingStatusInformInterval;
}
