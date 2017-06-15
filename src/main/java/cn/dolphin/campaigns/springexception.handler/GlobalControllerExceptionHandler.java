package cn.dolphin.campaigns.springexception.handler;

import cn.dolphin.campaigns.exception.CommonException;
import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by LiLinZhi on 17/6/15.
 */
@ControllerAdvice(annotations = {Controller.class, RestController.class})
public class GlobalControllerExceptionHandler {

    private static Logger logger = LoggerFactory.getLogger(GlobalControllerExceptionHandler.class);

    @ExceptionHandler
    @ResponseBody
    public String handleException(Exception e) {
        ExceptionResponse exceptionResponse = new ExceptionResponse(500,
                GlobalExceptionResponseConstants.COMMON_SERVER_ERROR_CODE,
                GlobalExceptionResponseConstants.COMMON_SERVER_ERROR_MESSAGE);

        return JSON.toJSONString(exceptionResponse);
    }

    @ExceptionHandler
    @ResponseBody
    public ExceptionResponse handleException(CommonException commonEx) {
        ExceptionResponse exceptionResponse = new ExceptionResponse();
        BeanUtils.copyProperties(commonEx, exceptionResponse);

        return exceptionResponse;
    }

}
