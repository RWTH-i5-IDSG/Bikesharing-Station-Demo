package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/**
 * Created by swam on 31/07/14.
 */
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PedelecStatusDTO {
    private String pedelecmanufacturerId;
    private String pedelecErrorCode;
    private String pedelecErrorInfo;
    private OperationState pedelecState;
    private Long timestamp;
}
