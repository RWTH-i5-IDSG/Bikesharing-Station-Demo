package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/**
 * Created by swam on 08/08/14.
 */
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ChangePedelecOperationStateDTO {
    private Integer slotPosition;
    private OperationState pedelecState;
}
