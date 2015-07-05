package com.dev.base.tool;

public class BizException extends Exception {
	public BizException() throws Exception {
		super();
	}

	public BizException(Exception e) {
		super(e);
		String expCase = e.getCause().toString();
		String expMsg = e.getMessage();
		String logMessage = "case:" + expCase + ";message:" + expMsg;
		System.out.println(logMessage);

	}

	public BizException(String logMessage) {
		super(logMessage);
		System.out.println(logMessage);
	}

	public BizException(String logMessage, Exception e) throws Exception {
		super(logMessage);
		System.out.println(logMessage);
	}

	public BizException(String methName, String logMessage, Exception e) {
		super(logMessage);
		logMessage = methName + ":" + logMessage;
		System.out.println(logMessage);
	}
}
