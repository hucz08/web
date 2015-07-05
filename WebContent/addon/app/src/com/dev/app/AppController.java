package com.dev.app;

import com.jfinal.core.Controller;

public class AppController extends Controller {
	public void index() {
		setAttr("web", "/addon/app/web/");
		render("index.html");
	}

	public void welcome() {
		setAttr("web", "/addon/app/web/");
		render("welcome.html");
	}

	public void newyork() {
		setAttr("web", "/addon/app/web/");
		render("newyork.html");
	}

	public void buenosaires() {
		setAttr("web", "/addon/app/web/");
		render("buenosaires.html");
	}

	public void paris() {
		setAttr("web", "/addon/app/web/");
		render("paris.html");
	}

	public void capetown() {
		setAttr("web", "/addon/app/web/");
		render("capetown.html");
	}

	public void seoul() {
		setAttr("web", "/addon/app/web/");
		render("seoul.html");
	}

	public void sydney() {
		setAttr("web", "/addon/app/web/");
		render("sydney.html");
	}
}
