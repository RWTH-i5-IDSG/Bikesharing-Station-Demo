package demoStationApp.cmsInterface.dto.request;

import lombok.Data;

/**
 * Created by swam on 31/07/14.
 */

@Data
public class PedelecStatusDTO {
    private String pedelecmanufacturerId;
    private String pedelecErrorCode;
    private String pedelecInfo;
    private String pedelecState;
    private Long timestamp;
}
