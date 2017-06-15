package cn.dolphin.campaigns.springexception.handler;

/**
 * Created by LiLinZhi on 17/6/15.
 */
public class ExceptionResponse {
    private int status;
    private int code;
    private String message;
    private String developerMessage;

    public ExceptionResponse() {
    }

    public ExceptionResponse(Integer status, Integer code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }

    public ExceptionResponse(Integer status, Integer code, String message, String developerMessage) {
        super();
        this.status = status;
        this.code = code;
        this.message = message;
        this.developerMessage = developerMessage;
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
