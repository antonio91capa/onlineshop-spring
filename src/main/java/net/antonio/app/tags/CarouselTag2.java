package net.antonio.app.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import net.antonio.app.services.SlideService;

public class CarouselTag2 extends RequestContextAwareTag {

	private static final long serialVersionUID = 1L;

	@Autowired
	private SlideService slideService;

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.setAttribute("slides", slideService.findAllWithStatus(true));
			String jspPage = "component/carouse_tag.jsp";
			request.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
		} catch (Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	@Override
	protected int doStartTagInternal() throws Exception {
		if (slideService == null) {
			WebApplicationContext waContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory beanFactory = waContext.getAutowireCapableBeanFactory();
			beanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}

}
