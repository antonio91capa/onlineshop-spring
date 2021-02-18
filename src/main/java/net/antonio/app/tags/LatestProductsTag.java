package net.antonio.app.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import net.antonio.app.model.Photo;
import net.antonio.app.model.Product;
import net.antonio.app.services.ProductService;

public class LatestProductsTag extends RequestContextAwareTag {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ProductService productService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if(productService==null) {
			WebApplicationContext waContext=getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory beanFactory=waContext.getAutowireCapableBeanFactory();
			beanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {
			List<Product> products = productService.latestProducts(true, 2);
			if (products != null) {
				for (Product product : products) {
					Photo photo=product.getPhotos().stream().filter(p->p.isStatus() &&p.isMain()).findFirst().get();
					
					writer.write("<div class=\"thumbnail\">");
					writer.write("<img src=\""+getRequestContext().getContextPath()+"/uploads/images/"+photo.getName()+"\" />");
					writer.write("<div class=\"caption\">");
					writer.write("<h5>"+product.getName()+"</h5>");
					writer.write("<h4 style=\"text-align: center\">");
					
					writer.write("<a class='btn' href='"+pageContext.getServletContext().getContextPath()+"/product/details/"+product.getId()+"'>");
					writer.write("<i class=\"icon-zoom-in\"></i>");
					writer.write("</a>");
					
					writer.write("<a class=\"btn\" href='"+pageContext.getServletContext().getContextPath()+"/cart/buy/"+product.getId()+"'>Add to");
					writer.write("<i class=\"icon-shopping-cart\"></i>");
					writer.write("</a>");
					
					writer.write("<a class=\"btn btn-primary\" href=\"#\">$"+product.getPrice()+"</a>");
					
					writer.write("</h4>");
					writer.write("</div>");
					writer.write("</div><br />");
				}
			}
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
