package com.dev.sys.factory;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dev.base.tool.BizException;
import com.dev.base.tool.BizUtils;
import com.dev.sys.model.CoreInfo;

public class CoreFactory {
	public BizUtils util = new BizUtils();

	public Map<String, Object> convertCoreInfo(CoreInfo info) {
		Map<String, Object> map = new HashMap<String, Object>();
		String[] attrNames = info.getAttrNames();
		for (String attrName : attrNames) {
			map.put(attrName, info.get(attrName));
		}
		return map;
	}

	public int save(CoreInfo info) throws BizException {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO T_SYS_CORE (");
		sql.append("FID");
		sql.append(",FUpdateTime");
		sql.append(",FUpdateorID");
		sql.append(")values(");
		sql.append("newid('core')");
		sql.append("," + new Date(new java.util.Date().getTime()));
		sql.append("," + util.getUUID());
		sql.append(");");
		int exeSql = util.exeSql(sql.toString());
		return exeSql;
	}

	public List<CoreInfo> list(String sql) throws BizException {
		ResultSet exeQuery = util.exeQuery(sql);
		return null;
	}
}
