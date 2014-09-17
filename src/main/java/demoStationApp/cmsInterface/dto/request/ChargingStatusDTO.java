package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.Battery;
import demoStationApp.domain.ChargingState;
import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 31/07/14.
 */
@Getter
@Builder
public final class ChargingStatusDTO {
    private final String pedelecManufacturerId;
    private final String slotManufacturerId;
    private final Long timestamp;
    private final ChargingState charginState; //?
    private final Double meterValue;
    private final Battery battery;
}
