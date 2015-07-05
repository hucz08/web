package com.dev.base.tool;

import java.math.BigDecimal;
import java.util.UUID;

public class StringUtils {

	public String getUUID() {
		String uuid = UUID.randomUUID().toString();
		return uuid;
	}

	public Boolean isEmpty(Object obj) {
		Boolean res = false;
		if (null == obj) {
			return true;
		}
		String str = String.valueOf(obj);
		if (null == str || str.trim().length() == 0) {
			return true;
		}
		return res;
	}

	public Boolean isEmpty(Object... objects) {
		Boolean res = false;
		for (Object obj : objects) {
			if (isEmpty(obj)) {
				return true;
			}
		}
		return res;
	}

	public Boolean isEquals(Object obj1, Object obj2) {
		Boolean res = true;
		if (isEmpty(obj1) && isEmpty(obj2)) {
			return true;
		}
		if (isEmpty(obj1) || isEmpty(obj2)) {
			return false;
		}
		if (obj1.equals(obj2)) {
			return true;
		}
		return res;
	}

	public Boolean isEqulas(Object... objects) {
		Boolean res = true;
		for (Object obj : objects) {
			if (!isEquals(objects[0], obj)) {
				return false;
			}
		}
		return res;
	}

	public BigDecimal toBigDecimal(Object obj) {
		BigDecimal res = null;
		if (isEmpty(obj)) {
			return res;
		}
		String str = toString(obj);
		try {
			res = new BigDecimal(str);
		} catch (Exception e) {
			res = null;
		}
		return res;
	}

	public Double toDouble(Object obj) {
		BigDecimal bigDecimal = toBigDecimal(obj);
		return bigDecimal.doubleValue();
	}

	public String toDoubleString(Object obj) {
		String str = toDouble(obj).toString();
		if (str.contains("\\.") && (str.endsWith("0") || str.endsWith("\\."))) {
			str = str.substring(0, str.length() - 1);
			return toDoubleString(str);
		}
		return str;
	}

	public Float toFloat(Object obj) {
		BigDecimal bigDecimal = toBigDecimal(obj);
		return bigDecimal.floatValue();
	}

	public Integer toInt(Object obj) {
		BigDecimal bigDecimal = toBigDecimal(obj);
		return bigDecimal.intValue();
	}

	public String toString(Object obj) {
		String res = null;
		if (isEmpty(obj)) {
			return res;
		}
		res = String.valueOf(obj);
		return res;
	}
}
