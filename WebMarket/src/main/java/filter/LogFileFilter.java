package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{
	
	PrintWriter printWriter;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		String filename = config.getInitParameter("filename");
		
		if(filename == null) throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		
		try {
			printWriter = new PrintWriter(new FileWriter(filename, true),true);
		}catch(IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		printWriter.println("접속한 클라이언트 IP : "+request.getRemoteAddr());
		long start = System.currentTimeMillis();
		printWriter.println("접속한 URL 경로 : "+getURLPath(request));
		printWriter.println("요청 처리 시작 시각 : "+getCurrentTime());
		
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		printWriter.println("요청 종료 시각 : "+getCurrentTime());
		printWriter.println("요청 종료 시각 : "+(end-start)+"ms ");
		printWriter.println("=========================================");
	}
	
	private String getCurrentTime() {
		DateFormat dateFormat =  new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		
		return dateFormat.format(calendar.getTime());
	}

	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath="";
		String queryString="";
		
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest)request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString== null? "" : "?"+queryString;
		}
		return currentPath+queryString;
	}
	
	@Override
	public void destroy() {
		printWriter.close();
	}

}
