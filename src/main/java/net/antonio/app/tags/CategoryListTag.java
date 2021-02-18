package net.antonio.app.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import net.antonio.app.model.Category;
import net.antonio.app.services.CategoryService;

public class CategoryListTag extends RequestContextAwareTag {

	private static final long serialVersionUID = 1L;

	@Autowired
	private CategoryService categoryService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (categoryService == null) {
			WebApplicationContext waContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory beanFactory = waContext.getAutowireCapableBeanFactory();
			beanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {
			writer.write("<ul id=\"sideManu\" class=\"nav nav-tabs nav-stacked\">");
			List<Category> categories = categoryService.findParentCategoriesWithStatus(true);
			if (categories != null) {
				for (Category category : categories) {
					writer.write("<li class=\"subMenu\"><a href='#'> " + category.getName() + " </a>");
					if (!category.getCategories().isEmpty()) {
						writer.write("<ul style=\"display: none\">");
						for (Category subcategory : category.getCategories()) {
							writer.write("<li><a href='" + pageContext.getServletContext().getContextPath()
									+ "/product/category/" + subcategory.getId()+"' >"
									+ "<i class='icon-chevron-right'></i>" + subcategory.getName() + "</a></li>");
						}
						writer.write("</ul>");
					}
					writer.write("</li>");
				}
			}
			writer.write("</ul>");
		} catch (Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		super.doFinally();
	}

}
