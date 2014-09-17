package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 31/07/14.
 */
@Getter
@Builder
public final class StopTransactionDTO {
    private final String pedelecManufacturerId;
    private final String stationManufacturerId;
    private final String slotManufacturerId;
    private final Long timestamp;
}
