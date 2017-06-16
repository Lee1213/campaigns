package cn.dolphin.campaigns.filter;

import cn.dolphin.campaigns.threadlocal.ParameterThreadLocal;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LiLinZhi on 17/6/16.
 */
public class ParameterFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        ParameterThreadLocal.clear();
        String name = request.getParameter("name");
        if (StringUtils.isNotBlank(name)) {
            ParameterThreadLocal.setName(name);
        }
    }
}
