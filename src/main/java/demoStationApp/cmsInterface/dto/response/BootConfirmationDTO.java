package demoStationApp.cmsInterface.dto.response;

import lombok.Data;

/**
 * Created by swam on 12/08/14.
 */

@Data
public class BootConfirmationDTO {
    private Long timestamp;
    private Integer heartbeatInterval;
}
