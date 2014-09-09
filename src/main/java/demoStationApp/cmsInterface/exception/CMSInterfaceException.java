package demoStationApp.cmsInterface.exception;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by swam on 04/08/14.
 */
public class CMSInterfaceException extends Exception {
    private static final long serialVersionUID = 1L;

    @Getter @Setter private String errorCode;

    public CMSInterfaceException(String message, String errorCode) {
        super(message);
        this.errorCode = errorCode;
    }

    public CMSInterfaceException(String message, String errorCode, Throwable cause) {
        super(message, cause);
        this.errorCode = errorCode;
    }

}
