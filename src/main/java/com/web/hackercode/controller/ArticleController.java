package com.web.hackercode.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.hackercode.dao.ArticleDAO;
import com.web.hackercode.dao.CourseDAO;
import com.web.hackercode.structures.Article;
import com.web.hackercode.structures.ArticleCategory;
import com.web.hackercode.structures.ArticleSubCategory;
import com.web.hackercode.structures.User;
import com.web.hackercode.utility.Utility;

@Controller
public class ArticleController {
	 ApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
	 Utility utils = new Utility();
	 
	 @RequestMapping(value = "/articles/{category}/{subCategory}")
	 public ModelAndView showArticles(@PathVariable String category, 
			 @PathVariable String subCategory) {
		 
		 ArticleDAO adao = ctx.getBean(ArticleDAO.class);
		 CourseDAO cdao = ctx.getBean(CourseDAO.class);
		
		 return new ModelAndView("articles/article")
				 .addObject("article", adao.getCategoryArticle(category, subCategory))
				 .addObject("similarArticles", adao.getSameCatArticles(category, subCategory))
				 .addObject("courses", cdao.getSimilarCourse("algorithm|development"))
				 .addObject("nav", adao.getNavJSON());
	 }
	 
	 @RequestMapping(value = "/article/{articleIDHash}/{articleName}")
	 public ModelAndView article(HttpServletRequest req, 
			 @PathVariable String articleIDHash, @PathVariable String articleName ) {
		 
		 ArticleDAO adao = ctx.getBean(ArticleDAO.class);
		 CourseDAO cdao = ctx.getBean(CourseDAO.class);
		 Article article = adao.getArticle(articleIDHash);
		 
		 String tagStr = article.getTags().replaceAll(",", "|");
		 adao.incrementViewCount(articleIDHash);
		 return new ModelAndView("articles/article")
				 .addObject("article", article)
				 .addObject("similarArticles", adao.getSimilarArticles(articleIDHash, tagStr))
				 .addObject("courses", cdao.getSimilarCourse(tagStr))
				 .addObject("nav", adao.getNavJSON());
	 }
	 
	 @RequestMapping(value = "/admin/articles", method = RequestMethod.GET)
	 public ModelAndView articles(HttpServletRequest req) {
		 
		 if (utils.isUserAuthenticated(req)) {
			 User  user = (User) req.getSession().getAttribute("user");
			 ArticleDAO adao = ctx.getBean(ArticleDAO.class);
			 return new ModelAndView("test-admin-dashboard-articles")
					 .addObject("approvedArticles", adao.getAllApprovedArticles())
					 .addObject("notApprovedArticles", adao.getAllNotApprovedArticles());
		 }
		 else {
			 RedirectView view = new RedirectView("/");
			 return new ModelAndView(view);
		 }
		 
	 }
	 
	 @RequestMapping( value = "/admin/articles/review/{id}", method = RequestMethod.GET)
	 public ModelAndView reviewArticle(@PathVariable String id) {
		 ArticleDAO adao = ctx.getBean(ArticleDAO.class);
		 Article a = adao.getArticle(id);
		 if (a != null) {
			 return new ModelAndView("test-admin-dashboard-review-article")
					 .addObject("article", a);
		 }
		 
		return null;
		 
	 }
	 
	 @RequestMapping(value = "/admin/categories", method = RequestMethod.GET)
	 public ModelAndView showEditCategory() {
		ArticleDAO adao = ctx.getBean(ArticleDAO.class); 
		 return new ModelAndView("test-admin-dashboard-add-categories")
				 .addObject("nav", adao.getNavJSON());
	 }
	 
	 @RequestMapping(value = "/admin/articles/api/approve")
	 @ResponseBody
	 public boolean approve(HttpServletRequest req, @RequestParam String id) {
		 return ctx.getBean(ArticleDAO.class).approveArticle(id);
	 }
	 
	 @RequestMapping(value = "/admin/articles/api/disapprove")
	 @ResponseBody
	 public boolean disapprove(HttpServletRequest req, @RequestParam String id) {
		 return ctx.getBean(ArticleDAO.class).disapproveArticle(id);
	 }
	 
	 @RequestMapping(value = "/user/drafter", method = RequestMethod.GET)
	 public ModelAndView sendDrafterView(HttpServletRequest req) {
		 Utility utils = new Utility();
		 ArticleDAO adao = ctx.getBean(ArticleDAO.class);
		 
		 if (utils.isUserAuthenticated(req)) {
			 User user = (User) req.getSession().getAttribute("user");
	    		return new ModelAndView("drafter-home")
	    				.addObject("categories", adao.getCategories())
	    				.addObject("articles", adao.getUserArticles(user));
		 }
		 
		 
		 return new ModelAndView(new RedirectView("/"));
	 }
	 
	 @RequestMapping(value = "/user/drafter/api/get-sub-category", method = RequestMethod.POST)
	 @ResponseBody
	 public String getSubCategories(@RequestParam String categoryCode) {
		 
		 ArticleDAO adao = ctx.getBean(ArticleDAO.class);
		 
		 if (categoryCode.length() > 0) {
			 List<ArticleSubCategory> subCat = adao.getSubCategories(categoryCode);
			 
			 JsonArray obj = new JsonArray();
			 for(int i=0; i<subCat.size(); i++) {
				 JsonObject x = new JsonObject();
				 x.addProperty("cat_id", subCat.get(i).getCatId());
				 x.addProperty("id", subCat.get(i).getId());
				 x.addProperty("name", subCat.get(i).getName());
				 obj.add(x);
			 }
			 
			 return obj.toString();
		 }
		 
		 return null;
	 }
	 
	 @RequestMapping(value = "/user/drafter/api/save-article", method = RequestMethod.POST)
	 @ResponseBody
	 public String saveArticle(HttpServletRequest req, @ModelAttribute("Article") Article article) {
		JsonObject obj = new JsonObject();
		obj.addProperty("error", false);
		System.out.println(article.toString());
		if (utils.isUserAuthenticated(req)) {
			User user = (User) req.getSession().getAttribute("user");
			ArticleDAO adao = ctx.getBean(ArticleDAO.class);
			if (adao.saveArticle(article, user)) {
				obj.addProperty("msg", "Article Drafted");
				return obj.toString();
			}
			else {
				obj.addProperty("error", true);
				obj.addProperty("error_text", "Seems like we already have a article by this title. Please Try another title.");
			}
		}
		else{
			obj.addProperty("error", true);
			obj.addProperty("error_text", "Session Over. Please Login Again.");
		}
		 
		return obj.toString();
	 }

}
