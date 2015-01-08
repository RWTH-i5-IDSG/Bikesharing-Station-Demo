package demoStationApp.cmsInterface.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/**
 * Created by swam on 06/10/14.
 */

@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CancelReservationDTO {

    private Long reservationId;
}
