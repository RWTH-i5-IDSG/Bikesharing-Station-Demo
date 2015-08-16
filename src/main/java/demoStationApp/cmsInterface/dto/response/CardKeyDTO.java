package demoStationApp.cmsInterface.dto.response;

import lombok.Data;

/**
 * @author Sevket Goekay <goekay@dbis.rwth-aachen.de>
 * @since 28.07.2015
 */
@Data
public class CardKeyDTO {
    private final String name;
    private final String readKey;
    private final String writeKey;
}
