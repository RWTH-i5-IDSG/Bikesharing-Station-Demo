package demoStationApp.cmsInterface.dto.request;

import lombok.Getter;
import lombok.ToString;
import lombok.experimental.Builder;

@Getter
@Builder
@ToString(includeFieldNames = true)
public class RemoteAuthorizeDTO {
    private Integer slotPosition;
    private String cardId;
}

