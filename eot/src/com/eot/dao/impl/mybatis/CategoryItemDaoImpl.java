package com.eot.dao.impl.mybatis;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.ICategoryItemDao;
import com.eot.model.CategoryItem;
import com.eot.model.Evaluation;

public class CategoryItemDaoImpl extends SqlSessionDaoSupport implements ICategoryItemDao{

	private static final String CLASS_NAME = CategoryItem.class.getName();
	private static final String SQL_ID_addCategory = ".addCategory";
	private static final String SQL_ID_addItem = ".addItem";
	private static final String SQL_ID_findAllCategory = ".findAllCategory";
	private static final String SQL_ID_findAllItem = ".findAllItem";
	private static final String SQL_ID_updateCategoryName = ".updateCategoryName";
	private static final String SQL_ID_updateItem = ".updateItem";
	private static final String SQL_ID_deleteItem = ".deleteItem";
	private static final String SQL_ID_deleteCategory = ".deleteCategory";
	@Override
	public void addCategory(String categoryName) {
		
		getSqlSession().insert(CLASS_NAME + SQL_ID_addCategory, categoryName);
	}
	@Override
	public void addItem(int categoryNo, String itemName) {
		Map<String, Object> params = new HashMap<>();
		params.put("categoryNo", categoryNo);
		params.put("itemName", itemName);
		getSqlSession().insert(CLASS_NAME + SQL_ID_addItem, params);
	}
	@Override
	public List<CategoryItem> findAllCategory() {
		
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_findAllCategory);
	}
	@Override
	public List<CategoryItem> findAllItem() {
		
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_findAllItem);
	}
	@Override
	public void updateCategoryName(int categoryNo, String categoryName) {
		Map<String, Object> params = new HashMap<>();
		params.put("categoryNo", categoryNo);
		params.put("categoryName", categoryName);
		getSqlSession().update(CLASS_NAME + SQL_ID_updateCategoryName, params);
	}
	@Override
	public void updateItem(int itemNo, int categoryNo, String itemName) {
		Map<String, Object> params = new HashMap<>();
		params.put("itemNo", itemNo);
		params.put("categoryNo", categoryNo);
		params.put("itemName", itemName);
		getSqlSession().update(CLASS_NAME + SQL_ID_updateItem, params);
		
	}
	@Override
	public void deleteItem(int itemNo) {
		
		getSqlSession().delete(CLASS_NAME + SQL_ID_deleteItem, itemNo);
	}
	@Override
	public void deleteCategory(int categoryNo) {
		
		getSqlSession().delete(CLASS_NAME + SQL_ID_deleteCategory, categoryNo);
	}
	
	
}
