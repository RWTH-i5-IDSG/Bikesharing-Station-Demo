package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Data;

/**
 * Created by swam on 08/08/14.
 */

@Data
public class ChangePedelecOperationStateDTO {

    private Integer slotPosition;
//    private String pedelecManufacturerId;
    private OperationState pedelecState;
}
