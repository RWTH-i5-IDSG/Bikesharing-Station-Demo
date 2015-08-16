package demoStationApp.cmsInterface.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

import java.util.List;

/**
 * Created by swam on 12/08/14.
 */
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BootNotificationDTO {
    private String stationManufacturerId;
    private String firmwareVersion;
    private String stationURL;
    private List<SlotDTO> slots;
}

