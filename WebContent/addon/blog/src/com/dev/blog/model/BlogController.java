package com.dev.blog.model;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

@Before(BlogInterceptor.class)
public class BlogController extends Controller {
	public void index() {
		setAttr("blogPage", Blog.me.paginate(getParaToInt(0, 1), 10));
		render("blog.html");
	}

	public void add() {
	}

	@Before(BlogValidator.class)
	public void save() {
		String id = getPara("blog.id");
		getModel(Blog.class).save();
		if (id == null || id.length() == 0) {
			renderHtml("<script>alert('留言成功!');location = '/';</script>");
			return;
		}
		redirect("/blog");
	}

	public void edit() {
		setAttr("blog", Blog.me.findById(getParaToInt()));
	}

	@Before(BlogValidator.class)
	public void update() {
		getModel(Blog.class).update();
		redirect("/blog");
	}

	public void delete() {
		Blog.me.deleteById(getParaToInt());
		redirect("/blog");
	}
}
