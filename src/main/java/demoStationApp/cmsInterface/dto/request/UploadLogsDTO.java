package demoStationApp.cmsInterface.dto.request;

import lombok.Data;

import java.util.Date;

/**
 * Created by swam on 08/08/14.
 */

@Data
public class UploadLogsDTO {
    private String logDictionaryUrl;
    private Date oldestLogTimestamp;
    private Date latestLogTimestamp;
}
