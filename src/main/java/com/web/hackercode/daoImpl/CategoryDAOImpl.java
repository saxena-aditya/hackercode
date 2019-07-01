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
import com.web.hackercode.dao.CategoryDAO;
import com.web.hackercode.structures.ArticleCategory;
import com.web.hackercode.structures.ArticleSubCategory;
import com.web.hackercode.utility.Utility;

@Component
public class CategoryDAOImpl implements CategoryDAO{
	Utility utils = new Utility();

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
}
