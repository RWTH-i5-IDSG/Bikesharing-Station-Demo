package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;
import lombok.experimental.Builder;

import java.util.List;

/**
 * Created by swam on 12/08/14.
 */
@Getter
@Builder
public final class BootNotificationDTO {
    private final String stationManufacturerId;
    private final String firmwareVersion;
    private final List<SlotDTO> slotDTOs;
}



