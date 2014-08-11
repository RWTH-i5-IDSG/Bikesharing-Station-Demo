package demoStationApp.cmsInterface.dto;

import lombok.Data;

/**
 * Created by swam on 08/08/14.
 */

@Data
public class ChangeStationOperationStateDTO {
    private Integer slotPosition;
    private String state;
}
