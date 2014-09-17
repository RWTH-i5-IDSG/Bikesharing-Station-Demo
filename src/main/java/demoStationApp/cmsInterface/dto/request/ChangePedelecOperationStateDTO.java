package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 08/08/14.
 */
@Getter
@Builder
public final class ChangePedelecOperationStateDTO {
    private final Integer slotPosition;
    private final OperationState pedelecState;
}
