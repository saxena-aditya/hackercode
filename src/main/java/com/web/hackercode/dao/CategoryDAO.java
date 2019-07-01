package com.web.hackercode.dao;

import java.util.List;

import com.web.hackercode.structures.ArticleCategory;
import com.web.hackercode.structures.ArticleSubCategory;

public interface CategoryDAO {
	public List<ArticleSubCategory> getSubCategories(String categoryCode);

	public List<ArticleCategory> getCategories();

	public String getNavJSON();

}
