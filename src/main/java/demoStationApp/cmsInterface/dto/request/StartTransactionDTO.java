package demoStationApp.cmsInterface.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/**
 * Created by swam on 31/07/14.
 */
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StartTransactionDTO {
    private String cardId;
    private String pedelecManufacturerId;
    private String stationManufacturerId;
    private String slotManufacturerId;
    private Long timestamp;
}
