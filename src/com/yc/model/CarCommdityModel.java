package com.yc.model;

public class CarCommdityModel {

	private Integer id;
	
	private String commoidtyName;
	
	private Float unitPrice;
	
	private Integer amount;
	
	private Float price;
	
	private String imagePath;

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCommoidtyName() {
		return commoidtyName;
	}

	public void setCommoidtyName(String commoidtyName) {
		this.commoidtyName = commoidtyName;
	}

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

}
