package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;
import lombok.experimental.Builder;

import java.util.List;

/**
 * Created by swam on 31/07/14.
 */
@Getter
@Builder
public final class StationStatusDTO {
    private final String stationManufacturerId;
    private final String stationErrorCode;
    private final String stationErrorInfo;
    private final Long timestamp;
    private final List<SlotDTO> slots;
}
