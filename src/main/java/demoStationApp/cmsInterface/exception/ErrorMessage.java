package demoStationApp.cmsInterface.exception;

import lombok.Value;

/**
 * Created by swam on 01/08/14.
 */
@Value
public class ErrorMessage {
    private Long timestamp;
    private String code;
    private String message;
}
