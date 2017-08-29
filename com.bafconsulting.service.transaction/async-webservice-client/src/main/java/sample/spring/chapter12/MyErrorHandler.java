package sample.spring.chapter12;

import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.DefaultResponseErrorHandler;

public class MyErrorHandler extends DefaultResponseErrorHandler {
	private static Logger logger = Logger.getLogger(MyErrorHandler.class);
	
	@Override
	public void handleError(ClientHttpResponse response)
            throws IOException {
		logger.info("Status code received from the web service : " + response.getStatusCode());
		String body = IOUtils.toString(response.getBody());
		logger.info("Response body: " + body);
		super.handleError(response);
	}
}
