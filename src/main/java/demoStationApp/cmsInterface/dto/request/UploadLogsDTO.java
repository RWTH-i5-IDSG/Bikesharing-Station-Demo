package demoStationApp.cmsInterface.dto.request;

import lombok.Data;

/**
 * Created by swam on 08/08/14.
 */

@Data
public class  UploadLogsDTO {
    private String logDictionaryUrl;
    private Long oldestLogTimestamp;
    private Long latestLogTimestamp;
}
