package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 08/08/14.
 */
@Getter
public class ChangePedelecOperationStateDTO {
    private Integer slotPosition;
    private OperationState pedelecState;
}
