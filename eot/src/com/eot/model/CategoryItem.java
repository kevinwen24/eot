package com.eot.model;

public class CategoryItem {

	private int categoryNo;
	private int itemNo;

	private String categoryName;
	private String itemName;

	private int categoryActive;
	private int itemActive;
	
	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getCategoryActive() {
		return categoryActive;
	}

	public void setCategoryActive(int categoryActive) {
		this.categoryActive = categoryActive;
	}

	public int getItemActive() {
		return itemActive;
	}

	public void setItemActive(int itemActive) {
		this.itemActive = itemActive;
	}

}
