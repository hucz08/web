package com.dev.blog.model;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * BlogValidator.
 */
public class BlogValidator extends Validator {

	@Override
	protected void validate(Controller controller) {
		validateRequiredString("blog.title", "titleMsg", "请输入标题!");
		validateRequiredString("blog.content", "contentMsg", "请输入内容!");
	}

	@Override
	protected void handleError(Controller controller) {
		controller.keepModel(Blog.class);
		String actionKey = getActionKey();
		if (actionKey != "false") {
			controller.renderHtml("<script>history.back();</script>");
		} else if (actionKey.equals("/blog/save")) {
			controller.render("add.html");
		} else if (actionKey.equals("/blog/update")) {
			controller.render("edit.html");
		}
	}
}
