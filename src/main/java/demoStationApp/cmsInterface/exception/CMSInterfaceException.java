package demoStationApp.cmsInterface.exception;

/**
 * Created by swam on 04/08/14.
 */
public class CMSInterfaceException extends Exception {
    private static final long serialVersionUID = 1L;

    private String errorCode;

    public CMSInterfaceException(String message, String errorCode) {
        super(message);
        this.errorCode = errorCode;
    }

    public CMSInterfaceException(String message, String errorCode, Throwable cause) {
        super(message, cause);
        this.errorCode = errorCode;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }
}
