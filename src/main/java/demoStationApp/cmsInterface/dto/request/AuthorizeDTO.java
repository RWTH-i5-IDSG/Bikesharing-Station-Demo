package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;
import lombok.experimental.Builder;

/**
 * Created by swam on 08/08/14.
 */
@Getter
@Builder
public final class AuthorizeDTO {
    private final Integer slotPosition;
    private final String userId;
}
