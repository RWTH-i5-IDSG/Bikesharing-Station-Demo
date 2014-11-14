package demoStationApp.cmsInterface.dto.request;

import lombok.Data;
import lombok.experimental.Builder;

/**
 * Created by swam on 06/10/14.
 */

@Builder
@Data
public class CancelReservationDTO {

    private Long reservationId;
}
