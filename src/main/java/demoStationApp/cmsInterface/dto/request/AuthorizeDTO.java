package demoStationApp.cmsInterface.dto.request;

import lombok.Data;

/**
 * Created by swam on 08/08/14.
 */

@Data
public class AuthorizeDTO {
    private Integer slotPosition;
    private String userId;
}
