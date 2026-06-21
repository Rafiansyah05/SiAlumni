package utils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*")
public class PerformanceFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        long start = System.currentTimeMillis();
        String uri = "";
        if (request instanceof HttpServletRequest) {
            uri = ((HttpServletRequest) request).getRequestURI();
        }
        try {
            chain.doFilter(request, response);
        } finally {
            long duration = System.currentTimeMillis() - start;
            if (!uri.contains("/assets/")) {
                System.out.println("[PERF-LOG] Request to " + uri + " processed in " + duration + " ms");
            }
        }
    }

    @Override
    public void destroy() {}
}
