package demoStationApp.cmsInterface.dto.response;

import lombok.Value;

/**
 * Created by swam on 12/08/14.
 */
@Value
public class BootConfirmationDTO {
    private Long timestamp;
    private Integer heartbeatInterval;
}
