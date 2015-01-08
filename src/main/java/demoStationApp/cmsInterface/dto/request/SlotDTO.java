package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/**
 * Created by swam on 12/08/14.
 */
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SlotDTO {
    private String slotManufacturerId;
    private Integer slotPosition;
    private String pedelecManufacturerId;
    private String slotErrorCode;
    private String slotErrorInfo;
    private OperationState slotState;
}