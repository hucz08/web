package com.dev.resume.handle;

import java.sql.ResultSet;

import com.dev.base.tool.BizException;
import com.dev.base.tool.BizUtils;
import com.jfinal.core.Controller;

public class ResumeController extends Controller {
	public BizUtils util = new BizUtils();

	public void index() {
		try {
			ResultSet exeQuery = util.exeQuery("select * from T_SYS_Table");

		} catch (BizException e) {
			e.printStackTrace();
		}
		render("index.html");
	}

	public void introduction() {
		render("introduction.html");
	}

	public void contact() {
		render("contact.html");
	}

	public void working() {
		render("working.html");
	}

	public void learning() {
		render("learning.html");
	}
}
