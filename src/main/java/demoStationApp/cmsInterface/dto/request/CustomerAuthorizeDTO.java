package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 31/07/14.
 */
@Getter
@Builder
public final class CustomerAuthorizeDTO {
    private final String cardId;
    private final Integer pin;
}
