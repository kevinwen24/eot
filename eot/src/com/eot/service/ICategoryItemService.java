package com.eot.service;

import java.util.List;

import com.eot.model.CategoryItem;

public interface ICategoryItemService {

	public void addCategory(String categoryName);
	
	public void addItem(int categoryNo, String itemName);

	public List<CategoryItem> findAllCategory();
	
	public List<CategoryItem> findAllItem();
	
	public List<CategoryItem> findAllCategoryIsActive();
	
	public List<CategoryItem> findAllItemIsActive();
	
	public void updateCategoryName(int categoryNo, String categoryName);
	
	public void updateItem(int itemNo, Integer categoryNo, String itemName);
	
	public void deleteItem(int itemNo);
	
	public void deleteCategory(int categoryNo);
}
