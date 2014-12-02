package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Getter;

/**
 * Created by swam on 08/08/14.
 */
@Getter
public class ChangeStationOperationStateDTO {
    private Integer slotPosition;
    private OperationState state;
}
