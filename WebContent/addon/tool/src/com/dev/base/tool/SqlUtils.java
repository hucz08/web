package com.dev.base.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class SqlUtils extends BaseUtils {
	public static int maxSize = 8000;

	public String betterSql(String sql) {
		return sql;
	}

	public String closeConnect(Connection conn, Statement stmt, ResultSet rs)
			throws BizException {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (Exception e) {
			handleException(e);
		}
		return null;
	}

	public ResultSet exeQuery(String sql) throws BizException {
		long atime = (new Date()).getTime();
		ResultSet rs = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = getConnect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			logTime(atime, "exeQuery", sql);
			return rs;
		} catch (Exception e) {
			handleException(e);
		} finally {
			try {
				closeConnect(conn, stmt, rs);
			} catch (Exception e) {
				handleException(e);
			}
		}
		return null;
	}

	public int exeSql(String sql) throws BizException {
		long atime = (new Date()).getTime();
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = getConnect();
			stmt = conn.createStatement();
			int executeUpdate = stmt.executeUpdate(sql);
			logTime(atime, "exeSql", sql);
			return executeUpdate;
		} catch (Exception e) {
			handleException(e);
		} finally {
			try {
				closeConnect(conn, stmt, null);
			} catch (Exception e) {
				handleException(e);
			}
		}
		return 0;
	}

	public Connection getConnect() throws BizException {
		try {
			Class.forName("com.mysql.jdbc.Driver"); // ����mysq��
			String dbname = "jfinal_demo";
			String dbip = "127.0.0.1";
			String dbuser = "root";
			String dbpass = "";
			StringBuffer urlBuf = new StringBuffer();
			urlBuf.append("jdbc:mysql://");
			urlBuf.append(dbip);
			urlBuf.append("/");
			urlBuf.append(dbname);
			urlBuf.append("?user=");
			urlBuf.append(dbuser);
			urlBuf.append("&password=");
			urlBuf.append(dbpass);
			urlBuf.append("&useUnicode=true");
			urlBuf.append("&characterEncoding=gb2312");
			urlBuf.append("&autoReconnect = true");
			urlBuf.append("");
			Connection conn = DriverManager.getConnection(urlBuf.toString(),
					dbuser, dbpass);
			return conn;
		} catch (Exception e) {
			handleException(e);
		}
		return null;
	}

	public List<Map<String, Object>> getListData(String sql)
			throws BizException {
		try {
			ResultSet resultSet = exeQuery(sql);
			while (resultSet.next()) {
				resultSet.getString("");
			}
		} catch (Exception e) {
			handleException(e);
		}
		return null;
	}

	public String toSql(String sql) {
		return sql;
	}

}
