package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.Battery;
import lombok.Data;

import java.util.Date;

/**
 * Created by swam on 31/07/14.
 */

@Data
public class ChargingStatusDTO {
    private String pedelecManufacturerId;
    private String slotManufacturerId;
    private Long timestamp;
    private String charginState; //?
    private Double meterValue;
    private Battery battery;
}
