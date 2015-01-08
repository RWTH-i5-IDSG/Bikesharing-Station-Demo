package demoStationApp.cmsInterface.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

import java.util.List;

/**
 * Created by swam on 31/07/14.
 */
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class StationStatusDTO {
    private String stationManufacturerId;
    private String stationErrorCode;
    private String stationErrorInfo;
    private Long timestamp;
    private List<SlotDTO> slots;
}
