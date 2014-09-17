package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 12/08/14.
 */
@Getter
@Builder
public final class SlotDTO {
    private final String slotManufacturerId;
    private final Integer slotPosition;
    private final String pedelecManufacturerId;
    private final String slotErrorCode;
    private final String slotInfo;
    private final OperationState slotState;
}