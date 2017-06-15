package cn.dolphin.campaigns.exception;

import org.springframework.http.HttpStatus;

/**
 * Created by LiLinZhi on 17/6/15.
 */
public class CommonException extends RuntimeException {
    private int status;
    private int code;
    private String message;
    private String developerMessage;

    public CommonException() {
    }

    public CommonException(String message) {
        super(message);
    }

    public CommonException(int code, String message) {
        this(HttpStatus.UNPROCESSABLE_ENTITY.value(), code, message);
    }

    public CommonException(int status, int code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }

    public CommonException(int status, int code, String message, String developerMessage) {
        this.status = status;
        this.code = code;
        this.message = message;
        this.developerMessage = developerMessage;
    }

    public CommonException(Throwable cause) {
        super(cause);
    }

    public CommonException(String message, Throwable cause) {
        super(message, cause);
    }

    public CommonException(int code, String message, Throwable cause) {
        this(HttpStatus.UNPROCESSABLE_ENTITY.value(), code, message, cause);
    }

    public CommonException(int status, int code, String message, Throwable cause) {
        super(message, cause);
        this.status = status;
        this.code = code;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDeveloperMessage() {
        return developerMessage;
    }

    public void setDeveloperMessage(String developerMessage) {
        this.developerMessage = developerMessage;
    }
}
