package net.antonio.app.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import net.antonio.app.model.Category;
import net.antonio.app.services.CategoryService;
import net.antonio.app.services.ProductService;

public class SearchTag extends RequestContextAwareTag {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (productService == null || categoryService == null) {
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
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
			List<Category> categories = categoryService.findParentCategories();
			writer.write("<form class='form-inline navbar-search' method='post' action='"
					+ pageContext.getServletContext().getContextPath() + "/product/search'>");
			writer.write("<input class='fa fa-search srchTxt' type='text' name='keyword' value='" + keyword + "' placeholder='Search' />");
			writer.write("<select class='srchTxt' name='category' >");
				writer.write("<option value='-1'>All</option>");
				if (categories != null) {
					for (Category category : categories) {
						writer.write("<optgroup label='" + category.getName() + "'>");
						if (!category.getCategories().isEmpty()) {
							for (Category subcategory : category.getCategories()) {
								writer.write("<option value='" + subcategory.getId() + "'>");
								writer.write(subcategory.getName());
								writer.write("</option>");
							}
						}
						writer.write("</optgroup>");
					}
				}
			writer.write("</select>");
			writer.write("<button type='submit' id='submitButton' class='btn btn-primary'>Go</button>");
			writer.write("</form>");

		} catch (Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		super.doFinally();
	}

}
