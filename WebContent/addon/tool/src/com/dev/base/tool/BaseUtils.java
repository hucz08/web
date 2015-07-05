package com.dev.base.tool;

import java.util.Date;

public class BaseUtils extends StringUtils {
	public Boolean isDebug = true;

	public String handleException(Exception e) throws BizException {
		throw new BizException(e);
	}

	public String handleException(String logMessage) throws BizException {
		throw new BizException(logMessage);
	}

	public String logTime(long atime, String methName, String message) {
		if (!isDebug) {
			return null;
		}
		long btime = (new Date()).getTime();
		long ztime = btime - atime;
		long mtime = ztime / 1000;
		String logStr = methName + " action logTime:";
		if (mtime < 1) {
			logStr += ztime + "ms,very good^^^";
		} else if (mtime < 10) {
			logStr += mtime + "s,just ok~~~,the message is:\n" + message;
		} else if (mtime < 20) {
			logStr += mtime + "s,waring---,the waring is:\n" + message;
		} else {
			logStr += mtime + "s,error***,the error is:\n" + message;
		}
		System.out.println(logStr);
		return null;
	}
}
