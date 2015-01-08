package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.Battery;
import demoStationApp.domain.ChargingState;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/**
 * Created by swam on 31/07/14.
 */
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ChargingStatusDTO {
    private String pedelecManufacturerId;
    private String slotManufacturerId;
    private Long timestamp;
    private ChargingState charginState; //?
    private Double meterValue;
    private Battery battery;
}
