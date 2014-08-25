package demoStationApp.cmsInterface.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * Created by swam on 12/08/14.
 */

@Getter
@Setter
@AllArgsConstructor
public class BootNotificationDTO implements Serializable {
    private final String stationManufacturerId;
    private final String firmwareVersion;
    private final List<SlotDTO> slotDTOs;
}



