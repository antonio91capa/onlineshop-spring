package net.antonio.app.tags;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class CarouselTag extends RequestContextAwareTag {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {
			writer.write("<div id=\"carouselBlk\">\r\n" + 
					"		<div id=\"myCarousel\" class=\"carousel slide\">\r\n" + 
					"			<div class=\"carousel-inner\">\r\n" + 
					"				<div class=\"item active\">\r\n" + 
					"					<div class=\"container\">\r\n" + 
					"						<a href=\"register.html\"><img style=\"width: 100%\"\r\n" + 
					"							src=\"${pageContext.request.contextPath}/resources/user/themes/images/carousel/1.png\"\r\n" + 
					"							alt=\"special offers\" /></a>\r\n" + 
					"						<div class=\"carousel-caption\">\r\n" + 
					"							<h4>Second Thumbnail label</h4>\r\n" + 
					"							<p>Cras justo odio, dapibus ac facilisis in, egestas eget\r\n" + 
					"								quam. Donec id elit non mi porta gravida at eget metus. Nullam\r\n" + 
					"								id dolor id nibh ultricies vehicula ut id elit.</p>\r\n" + 
					"						</div>\r\n" + 
					"					</div>\r\n" + 
					"				</div>\r\n" + 
					"				<div class=\"item\">\r\n" + 
					"					<div class=\"container\">\r\n" + 
					"						<a href=\"register.html\"><img style=\"width: 100%\"\r\n" + 
					"							src=\"${pageContext.request.contextPath}/resources/user/themes/images/carousel/2.png\"\r\n" + 
					"							alt=\"\" /></a>\r\n" + 
					"						<div class=\"carousel-caption\">\r\n" + 
					"							<h4>Second Thumbnail label</h4>\r\n" + 
					"							<p>Cras justo odio, dapibus ac facilisis in, egestas eget\r\n" + 
					"								quam. Donec id elit non mi porta gravida at eget metus. Nullam\r\n" + 
					"								id dolor id nibh ultricies vehicula ut id elit.</p>\r\n" + 
					"						</div>\r\n" + 
					"					</div>\r\n" + 
					"				</div>\r\n" + 
					"				<div class=\"item\">\r\n" + 
					"					<div class=\"container\">\r\n" + 
					"						<a href=\"register.html\"><img\r\n" + 
					"							src=\"${pageContext.request.contextPath}/resources/user/themes/images/carousel/3.png\"\r\n" + 
					"							alt=\"\" /></a>\r\n" + 
					"						<div class=\"carousel-caption\">\r\n" + 
					"							<h4>Second Thumbnail label</h4>\r\n" + 
					"							<p>Cras justo odio, dapibus ac facilisis in, egestas eget\r\n" + 
					"								quam. Donec id elit non mi porta gravida at eget metus. Nullam\r\n" + 
					"								id dolor id nibh ultricies vehicula ut id elit.</p>\r\n" + 
					"						</div>\r\n" + 
					"\r\n" + 
					"					</div>\r\n" + 
					"				</div>\r\n" + 
					"				<div class=\"item\">\r\n" + 
					"					<div class=\"container\">\r\n" + 
					"						<a href=\"register.html\"><img\r\n" + 
					"							src=\"${pageContext.request.contextPath}/resources/user/themes/images/carousel/4.png\"\r\n" + 
					"							alt=\"\" /></a>\r\n" + 
					"						<div class=\"carousel-caption\">\r\n" + 
					"							<h4>Second Thumbnail label</h4>\r\n" + 
					"							<p>Cras justo odio, dapibus ac facilisis in, egestas eget\r\n" + 
					"								quam. Donec id elit non mi porta gravida at eget metus. Nullam\r\n" + 
					"								id dolor id nibh ultricies vehicula ut id elit.</p>\r\n" + 
					"						</div>\r\n" + 
					"\r\n" + 
					"					</div>\r\n" + 
					"				</div>\r\n" + 
					"				<div class=\"item\">\r\n" + 
					"					<div class=\"container\">\r\n" + 
					"						<a href=\"register.html\"><img\r\n" + 
					"							src=\"${pageContext.request.contextPath}/resources/user/themes/images/carousel/5.png\"\r\n" + 
					"							alt=\"\" /></a>\r\n" + 
					"						<div class=\"carousel-caption\">\r\n" + 
					"							<h4>Second Thumbnail label</h4>\r\n" + 
					"							<p>Cras justo odio, dapibus ac facilisis in, egestas eget\r\n" + 
					"								quam. Donec id elit non mi porta gravida at eget metus. Nullam\r\n" + 
					"								id dolor id nibh ultricies vehicula ut id elit.</p>\r\n" + 
					"						</div>\r\n" + 
					"					</div>\r\n" + 
					"				</div>\r\n" + 
					"				<div class=\"item\">\r\n" + 
					"					<div class=\"container\">\r\n" + 
					"						<a href=\"register.html\"><img\r\n" + 
					"							src=\"${pageContext.request.contextPath}/resources/user/themes/images/carousel/6.png\"\r\n" + 
					"							alt=\"\" /></a>\r\n" + 
					"						<div class=\"carousel-caption\">\r\n" + 
					"							<h4>Second Thumbnail label</h4>\r\n" + 
					"							<p>Cras justo odio, dapibus ac facilisis in, egestas eget\r\n" + 
					"								quam. Donec id elit non mi porta gravida at eget metus. Nullam\r\n" + 
					"								id dolor id nibh ultricies vehicula ut id elit.</p>\r\n" + 
					"						</div>\r\n" + 
					"					</div>\r\n" + 
					"				</div>\r\n" + 
					"			</div>\r\n" + 
					"			<a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">&lsaquo;</a>\r\n" + 
					"			<a class=\"right carousel-control\" href=\"#myCarousel\"\r\n" + 
					"				data-slide=\"next\">&rsaquo;</a>\r\n" + 
					"		</div>\r\n" + 
					"	</div>");
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
		return 0;
	}

}
