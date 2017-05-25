package com.eot.dao;

import java.util.List;

import com.eot.model.CategoryItem;

public interface ICategoryItemDao {
	
	public void addCategory(String categoryName);
	
	public void addItem(int categoryNo, String itemName);

	public List<CategoryItem> findAllCategory();
	
	public List<CategoryItem> findAllItem();
	
	public void updateCategoryName(int categoryNo, String categoryName);
	
	public void updateItem(int itemNo, int categoryNo, String itemName);
	
	public void deleteItem(int itemNo);
	
	public void deleteCategory(int categoryNo);

}