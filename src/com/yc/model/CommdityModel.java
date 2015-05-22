package com.yc.model;

public class CommdityModel {
	
	private int sums;
	
	private int categoryID;
	
	private String category;
	
	private int transNumForTaobao;
	
	private String seller;
	
	private String nameOfGoods;
	
	private int shopcategory;
	
	private String path;

	public int getTransNumForTaobao() {
		return transNumForTaobao;
	}

	public void setTransNumForTaobao(int transNumForTaobao) {
		this.transNumForTaobao = transNumForTaobao;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getNameOfGoods() {
		return nameOfGoods;
	}

	public void setNameOfGoods(String nameOfGoods) {
		this.nameOfGoods = nameOfGoods;
	}

	public int getShopcategory() {
		return shopcategory;
	}

	public void setShopcategory(int shopcategory) {
		this.shopcategory = shopcategory;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getSums() {
		return sums;
	}

	public void setSums(int sums) {
		this.sums = sums;
	}

}
