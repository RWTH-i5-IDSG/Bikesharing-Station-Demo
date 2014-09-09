package demoStationApp.cmsInterface.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Date;

/**
 * Created by swam on 04/08/14.
 */

@ControllerAdvice
public class GeneralCMSInterfaceExceptionHandler {

    @ExceptionHandler(CMSInterfaceException.class)
    public ResponseEntity<ErrorMessage> cmsInterfaceException(CMSInterfaceException e) {
        ErrorMessage msg = new ErrorMessage(
                new Date().getTime(),
                e.getErrorCode(),
                e.getMessage()
        );
        return new ResponseEntity<>(msg, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
