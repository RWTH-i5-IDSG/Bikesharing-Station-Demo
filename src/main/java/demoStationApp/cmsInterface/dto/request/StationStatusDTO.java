package demoStationApp.cmsInterface.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by swam on 31/07/14.
 */

@Data
@AllArgsConstructor
public class StationStatusDTO implements Serializable {
    private String stationManufacturerId;
    private String stationErrorCode;
    private String stationInfo;
    private Long timestamp;
    private List<SlotDTO> slots;

}
