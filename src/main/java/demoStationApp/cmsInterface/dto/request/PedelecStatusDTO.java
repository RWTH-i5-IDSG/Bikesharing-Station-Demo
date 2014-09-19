package demoStationApp.cmsInterface.dto.request;

import demoStationApp.domain.OperationState;
import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 31/07/14.
 */
@Getter
@Builder
public final class PedelecStatusDTO {
    private final String pedelecmanufacturerId;
    private final String pedelecErrorCode;
    private final String pedelecErrorInfo;
    private final OperationState pedelecState;
    private final Long timestamp;
}
