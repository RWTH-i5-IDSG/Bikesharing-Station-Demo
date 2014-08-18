package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Data;

/**
 * Created by swam on 31/07/14.
 */

@Data
public class PedelecStatusDTO {
    private String pedelecmanufacturerId;
    private String pedelecErrorCode;
    private String pedelecInfo;
    private OperationState pedelecState;
    private Long timestamp;
}
