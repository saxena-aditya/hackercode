package com.web.hackercode.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.hackercode.dao.ArticleDAO;
import com.web.hackercode.mappers.ArticleMapper;
import com.web.hackercode.structures.Article;
import com.web.hackercode.structures.ArticleCategory;
import com.web.hackercode.structures.ArticleSubCategory;
import com.web.hackercode.structures.Program;
import com.web.hackercode.structures.User;
import com.web.hackercode.structures.Article;

@Component
public class ArticleDAOImpl implements ArticleDAO {

	@Autowired
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    public DataSource getDataSource() {
        return dataSource;
    }
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
	public List<ArticleCategory> getCategories() {
		 jdbcTemplate.setDataSource(getDataSource());

		 String GET_CATEGORIES = "SELECT id, name, name_ FROM hc_categories";
		 try {
            List<ArticleCategory> categories = jdbcTemplate.query(GET_CATEGORIES, new ResultSetExtractor < List < ArticleCategory >> () {
                public List < ArticleCategory > extractData(ResultSet rs) throws SQLException, DataAccessException {
                    List < ArticleCategory > list = new ArrayList < ArticleCategory > ();
                    while (rs.next()) {
                    	ArticleCategory cat = new ArticleCategory();
                    	cat.setId(rs.getInt("id"));
                    	cat.setName(rs.getString("name"));
                    	cat.setName_(rs.getString("name_"));
                    	list.add(cat);
                    }
                    return list;
                }
            });
            return categories;
		 
		 } catch (Exception e) {
            e.printStackTrace();
		 }
		 
		 return null;
    }
	
	public List<ArticleSubCategory> getSubCategories(String categoryCode) {
		 jdbcTemplate.setDataSource(getDataSource());

		 String GET_SUB_CATEGORIES = "SELECT id, name, name_ FROM hc_sub_categories WHERE cat_id = ?";
		 final int catID = Integer.parseInt(categoryCode);
		 
		 try {
           List<ArticleSubCategory> categories = jdbcTemplate.query(
        		   GET_SUB_CATEGORIES, 
        		   new Object[] {catID}, 
        		   new ResultSetExtractor < List < ArticleSubCategory >> () {
		               public List < ArticleSubCategory > extractData(ResultSet rs) throws SQLException, DataAccessException {
		                   List < ArticleSubCategory > list = new ArrayList < ArticleSubCategory > ();
		                   while (rs.next()) {
		                   	ArticleSubCategory cat = new ArticleSubCategory();
		                   	cat.setCatId(catID);
		                   	cat.setId(rs.getInt("id"));
		                   	cat.setName_(rs.getString("name_"));
		                   	cat.setName(rs.getString("name"));
		                   	list.add(cat);
		                   }
		                   return list;
		               }
		           });
           return categories;
		 
		 } catch (Exception e) {
           e.printStackTrace();
		 }
		 
		 return null;
   }
	public boolean saveArticle(Article article, User user) {
		String SAVE_ARTICLE = "INSERT INTO hc_articles (name, tags, category, sub_category, content) VALUES (?,?,?,?,?)";
		String SAVE_USER_ARTICLE = "INSERT INTO hc_user_articles (user_name, article_id) VALUES (?,?)";
		if (isArticlePresent(article)) {
			return false;
		}
		else {
			try {
				// save article;
				jdbcTemplate.update(SAVE_ARTICLE, new Object[] {
						article.getTitle(),
						article.getTags(),
						article.getCategoryCode(),
						article.getSubCategoryCode(),
						article.getContent()
				});
				
				// for getting inserted article ID
				Article a = getArticle(article);
				jdbcTemplate.update(SAVE_USER_ARTICLE, new Object[] {
					user.getEmail(),
					a.getId()
				});
				
				return true;
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return false;
	}
	public boolean isArticlePresent(Article article) {
		
		jdbcTemplate.setDataSource(getDataSource());
		String IS_ARTICLE_PRESENT = "SELECT COUNT(*) FROM hc_articles WHERE name = ?";
		int count = jdbcTemplate.queryForObject(IS_ARTICLE_PRESENT, new Object[] {article.getTitle()}, Integer.class); 
		
		if (count != 0) {
			return true;
		}
		
		return false;
	}
	
	public boolean isArticlePresent(String id) {
		
		jdbcTemplate.setDataSource(getDataSource());
		String IS_ARTICLE_PRESENT = "SELECT COUNT(*) FROM hc_articles WHERE id = ?";
		int count = jdbcTemplate.queryForObject(IS_ARTICLE_PRESENT, new Object[] {id}, Integer.class); 
		
		if (count != 0) {
			return true;
		}
		
		return false;
	}
	
	public Article getArticle(String id) {
		jdbcTemplate.setDataSource(getDataSource());
		String GET_ARTICLE = "SELECT a.id, a.name, a.tags, a.content, c.name as cat, s.name as sub_cat FROM hc_articles as a JOIN hc_categories as"
				+ " c JOIN hc_sub_categories as s WHERE a.id = ? AND a.category = c.id AND a.sub_category = s.id";
		
		if (isArticlePresent(id)) {
			 try {
				 Article a =  jdbcTemplate.queryForObject(GET_ARTICLE, new ArticleMapper(), id);
				 System.out.print(a.toString());
				 return a;
			 }
			 catch (Exception e) {
				 e.printStackTrace();
			 }			 
		}
		
		System.out.println("No such article present");
		
		return null;
	}
	
	public Article getArticle(Article a) {
		jdbcTemplate.setDataSource(getDataSource());
		
		String GET_ARTICLE = "SELECT a.id, a.name, a.tags, a.content, c.name as cat, s.name as sub_cat FROM hc_articles as a JOIN hc_categories as"
				+ " c JOIN hc_sub_categories as s WHERE a.name = ? AND a.category = c.id AND a.sub_category = s.id";
		
		if (isArticlePresent(a)) {
			 try {
				 return jdbcTemplate.queryForObject(GET_ARTICLE, new ArticleMapper(), a.getTitle());
			 }
			 catch (Exception e) {
				 e.printStackTrace();
			 }	 
		}
		
		return null;
	}
	public List<Article> getAllApprovedArticles() {
		jdbcTemplate.setDataSource(getDataSource());

		String GET_ALL_NOT_APPROVED_ARTICLES = "SELECT a.name as title , a.tags, a.id, ud_email, concat(ud_firstname, ud_lastname) as name ,"+
				" c.name AS cat, s.name AS sub_cat, a_is_approved FROM hc_articles a JOIN hc_user_details ud JOIN hc_user_articles ua JOIN hc_categories c JOIN "+
				"hc_sub_categories s WHERE c.id = a.category AND s.id = a.sub_category AND ua.user_name = ud.ud_email AND a.id = ua.article_id and a_is_approved = 1";
			
		try {
           List<Article> articles = jdbcTemplate.query(
        		   GET_ALL_NOT_APPROVED_ARTICLES,  
        		   new ResultSetExtractor < List < Article >> () {
		               public List < Article > extractData(ResultSet rs) throws SQLException, DataAccessException {
		                   List < Article > list = new ArrayList < Article > ();
		                   while (rs.next()) {
		                	   Article a = new Article();
		                	   a.setId(rs.getInt("id"));
		                	   a.setName(rs.getString("name"));
		                	   a.setUserName(rs.getString("ud_email"));
		                	   a.setTitle(rs.getString("title"));
		                	   a.setTags(rs.getString("tags"));
		                	   a.setCategory(rs.getString("cat"));
		                	   a.setSubCategory(rs.getString("sub_cat"));
		                   	
		                	   list.add(a);
		                   }
		                   return list;
		               }
		           });
           return articles;
		 
		 } catch (Exception e) {
           e.printStackTrace();
		 }	
		
		return null;
	}
	public List<Article> getAllNotApprovedArticles() {
		jdbcTemplate.setDataSource(getDataSource());

		String GET_ALL_APPROVED_ARTICLES = "SELECT a.name as title , a.tags, a.id, ud_email, concat(ud_firstname, ud_lastname) as name ,"+
				" c.name AS cat, s.name AS sub_cat, a_is_approved FROM hc_articles a JOIN hc_user_details ud JOIN hc_user_articles ua JOIN hc_categories c JOIN "+
				"hc_sub_categories s WHERE c.id = a.category AND s.id = a.sub_category AND ua.user_name = ud.ud_email AND a.id = ua.article_id and a_is_approved = 0";
			
		try {
           List<Article> articles = jdbcTemplate.query(
        		   GET_ALL_APPROVED_ARTICLES,  
        		   new ResultSetExtractor < List < Article >> () {
		               public List < Article > extractData(ResultSet rs) throws SQLException, DataAccessException {
		                   List < Article > list = new ArrayList < Article > ();
		                   while (rs.next()) {
		                	   Article a = new Article();
		                	   a.setId(rs.getInt("id"));

		                	   a.setName(rs.getString("name"));
		                	   a.setUserName(rs.getString("ud_email"));
		                	   a.setTitle(rs.getString("title"));
		                	   a.setTags(rs.getString("tags"));
		                	   a.setCategory(rs.getString("cat"));
		                	   a.setSubCategory(rs.getString("sub_cat"));
		                   	
		                	   list.add(a);
		                   }
		                   return list;
		               }
		           });
           return articles;
		 
		 } catch (Exception e) {
           e.printStackTrace();
		 }		
		
		return null;
	}
	public boolean approveArticle(String id) {
		jdbcTemplate.setDataSource(getDataSource());

		String APPROVE_ARTICLE = "UPDATE hc_articles set a_is_approved = 1 WHERE id = ?";
		try {
			jdbcTemplate.update(APPROVE_ARTICLE, id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean disapproveArticle(String id) {
		jdbcTemplate.setDataSource(getDataSource());

		String DISAPPROVE_ARTICLE = "UPDATE hc_articles set a_is_approved = 0 WHERE id = ?";
		try {
			jdbcTemplate.update(DISAPPROVE_ARTICLE, id);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String getNavJSON() {
		
		 List<ArticleCategory> cat = getCategories();
		 JsonArray arr = new JsonArray();
		 
		 for(int i=0; i<cat.size(); i++) {
			 JsonObject obj1 = new JsonObject();
			obj1.addProperty("name", cat.get(i).getName());
			obj1.addProperty("value", cat.get(i).getName_());
			
			List<ArticleSubCategory> subCat = getSubCategories(Integer.toString(cat.get(i).getId()));
			JsonArray ar = new JsonArray();
			for(int j=0; j<subCat.size(); j++) {
				JsonObject oo = new JsonObject();
				oo.addProperty("name", subCat.get(j).getName());
				oo.addProperty("value", subCat.get(j).getName_());
				ar.add(oo);
			}
			obj1.add("sub_category", ar);
			arr.add(obj1);
		 }
		 
		 return arr.toString();
		 
	}
	public List<Article> getSimilarArticles(String id, String tagStr) {
		jdbcTemplate.setDataSource(getDataSource());

		String GET_SIMILAR_ARTICLES = "SELECT * FROM hc_articles WHERE tags REGEXP ? AND id != ? AND a_is_approved = 1 AND  a_is_active = 1";
		try {
            List<Article> articles = jdbcTemplate.query( GET_SIMILAR_ARTICLES, new Object[] {tagStr, id},new ResultSetExtractor < List < Article >> () {
                public List < Article > extractData(ResultSet rs) throws SQLException, DataAccessException {
                    List < Article > list = new ArrayList < Article > ();
                    while (rs.next()) {
                    	Article a = new Article();
                    	a.setId(rs.getInt("id"));
                    	a.setTitle(rs.getString("name"));
                    	a.setCreated_at(rs.getTimestamp("updated_at"));
                    	list.add(a);
                    }
                    return list;
                }
            });
            return articles;
		 
		 } catch (Exception e) {
            e.printStackTrace();
		 }
		return null;
	}
	public Article getCategoryArticle(String category, String subCategory) {
		jdbcTemplate.setDataSource(getDataSource());

		String GET_SPECIAL_ARTICLE = "SELECT a.id, c.name as cat, s.name as sub_cat, a.name, a.content, a.tags, a.updated_at FROM hc_articles a JOIN hc_categories c JOIN hc_sub_categories s where a.category = c.id AND a.sub_category = s.id AND c.name_ = ? AND s.name_ = ? and a.a_is_active = 1 AND a.is_special = 1 AND a.a_is_approved = 1";
		try {
			 Article a =  jdbcTemplate.queryForObject(GET_SPECIAL_ARTICLE, new ArticleMapper(), category, subCategory);
			 System.out.print(a.toString());
			 return a;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Article> getSameCatArticles(String category, String subCategory) {
		jdbcTemplate.setDataSource(getDataSource());

		String GET_SAME_CAT_ARTICLES = "SELECT a.id, a.name, a.updated_at FROM hc_articles a JOIN hc_categories c JOIN hc_sub_categories s where a.category = c.id AND a.sub_category = s.id AND c.name_ = ? AND s.name_ = ? and a.a_is_active = 1 AND a.is_special = 0 AND a.a_is_approved = 1";
		try {
            List<Article> articles = jdbcTemplate.query( GET_SAME_CAT_ARTICLES, new Object[] {category, subCategory},new ResultSetExtractor < List < Article >> () {
                public List < Article > extractData(ResultSet rs) throws SQLException, DataAccessException {
                    List < Article > list = new ArrayList < Article > ();
                    while (rs.next()) {
                    	Article a = new Article();
                    	a.setId(rs.getInt("id"));
                    	a.setTitle(rs.getString("name"));
                    	a.setCreated_at(rs.getTimestamp("updated_at"));
                    	list.add(a);
                    }
                    return list;
                }
            });
            return articles;
		 
		 } catch (Exception e) {
            e.printStackTrace();
		 }
		return null;
	}
    
}
