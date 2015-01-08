package demoStationApp.cmsInterface.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/**
 * Created by swam on 08/08/14.
 */
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UploadLogsDTO {
    private String logDictionaryUrl;
    private Long oldestLogTimestamp;
    private Long latestLogTimestamp;
}
