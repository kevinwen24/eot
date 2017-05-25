package com.eot.service.impl;

import java.util.List;

import com.eot.dao.ICategoryItemDao;
import com.eot.model.CategoryItem;
import com.eot.service.ICategoryItemService;

public class CategoryItemServiceImpl implements ICategoryItemService{

	private ICategoryItemDao iCategoryItemDao;
	public void setCategoryItemDao(ICategoryItemDao iCategoryItemDao){
		this.iCategoryItemDao = iCategoryItemDao;
	}
	
	@Override
	public void addCategory(String categoryName) {
		// TODO Auto-generated method stub
		iCategoryItemDao.addCategory(categoryName);
	}

	@Override
	public void addItem(int categoryNo, String itemName) {
		// TODO Auto-generated method stub
		iCategoryItemDao.addItem(categoryNo, itemName);
	}

	@Override
	public List<CategoryItem> findAllCategory() {
		// TODO Auto-generated method stub
		return iCategoryItemDao.findAllCategory();
	}

	@Override
	public List<CategoryItem> findAllItem() {
		// TODO Auto-generated method stub
		return iCategoryItemDao.findAllItem();
	}

	@Override
	public void updateCategoryName(int categoryNo, String categoryName) {
		// TODO Auto-generated method stub
		iCategoryItemDao.updateCategoryName(categoryNo, categoryName);
	}

	@Override
	public void updateItem(int itemNo, int categoryNo, String itemName) {
		// TODO Auto-generated method stub
		iCategoryItemDao.updateItem(itemNo, categoryNo, itemName);
	}

	@Override
	public void deleteItem(int itemNo) {
		// TODO Auto-generated method stub
		iCategoryItemDao.deleteItem(itemNo);
	}

	@Override
	public void deleteCategory(int categoryNo) {
		// TODO Auto-generated method stub
		iCategoryItemDao.deleteCategory(categoryNo);
	}

}
