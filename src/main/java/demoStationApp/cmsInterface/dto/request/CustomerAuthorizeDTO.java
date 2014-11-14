package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;

/**
 * Created by swam on 31/07/14.
 */
@Getter
public class CustomerAuthorizeDTO {
    private String cardId;
    private String pin;
}
