package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;

/**
 * Created by swam on 31/07/14.
 */
@Getter
public class StartTransactionDTO {
    private String cardId;
    private String pedelecManufacturerId;
    private String stationManufacturerId;
    private String slotManufacturerId;
    private Long timestamp;
}
