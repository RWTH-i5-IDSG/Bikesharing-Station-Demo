package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.Battery;
import demoStationApp.domain.ChargingState;
import lombok.Data;

/**
 * Created by swam on 31/07/14.
 */

@Data
public class ChargingStatusDTO {
    private String pedelecManufacturerId;
    private String slotManufacturerId;
    private Long timestamp;
    private ChargingState charginState; //?
    private Double meterValue;
    private Battery battery;
}
