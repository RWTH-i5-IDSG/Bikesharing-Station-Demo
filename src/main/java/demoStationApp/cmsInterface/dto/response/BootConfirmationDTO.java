package demoStationApp.cmsInterface.dto.response;

import lombok.Getter;

import java.util.List;

/**
 * Created by swam on 12/08/14.
 */
@Getter
public class BootConfirmationDTO {
    private Long timestamp;
    private Integer heartbeatInterval;
    private List<CardKeyDTO> cardKeys;
}
