package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by swam on 12/08/14.
 */

@Data
public class SlotDTO implements Serializable {
    private final String slotManufacturerId;
    private final Integer slotPosition;
    private final String pedelecManufacturerId;
    private final String slotErrorCode;
    private final String slotInfo;
    private final OperationState slotState;
}