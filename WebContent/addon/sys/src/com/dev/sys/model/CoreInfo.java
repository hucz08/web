package com.dev.sys.model;

import java.util.Date;
import java.util.List;

import com.dev.user.model.UserInfo;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class CoreInfo extends Model<CoreInfo> {
	public String id;
	public Date updateTime;
	public UserInfo updateor;

	public List<CoreInfo> getCoreInfoList(String hql) {
		hql = "select * where id = 1";
		String sql = "select * from " + getTable() + " where FID = 1";
		return null;
	}

	public String getTable() {
		return "T_SYS_CORE";
	}
}
