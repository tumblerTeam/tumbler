package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

//订单item商品
@Entity
@DiscriminatorValue("commodity")
@JsonIgnoreProperties(value = { "purchase", "storeRoom", "orderNumber", "imagePaths", })
public class Commodity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer commodityID;
	@ManyToOne
	@JoinColumn(name = "shopcommodity_id")
	private ShopCommodity shopCommodity;
	@Column
	private Integer quantity;// 数量
	@Column
	private Float weight;// 总重量
	@Column
	private Float price;// 价格
	@Column
	private Float fare;// 附加费
	@Column
	private Float money;// 总金额

	@OneToOne
	@JoinColumn(name = "currency_id")
	private Currency currency;// 币种

	@Column
	private String commSpec;// 规格【，颜色-红色，尺寸-12L,】

	@ManyToOne
	@JoinColumn(name = "shopcategory")
	private ShopCategory shopcategory;// 类别

	@ManyToOne
	@JoinColumn(name = "seller_name")
	private Shop seller;// 卖家

	@Column
	private String sellerDate;// zazatao付款日期
	@Column
	private String tradingCode;// 交易码

	@ManyToOne
	@JoinColumn(name = "orderform_id")
	private OrderForm orderNumber;

	@Column
	private String cellDate;// 入单元格时间
	@Column
	private String inStoreRoomDate;// 入库房时间

	@Column
	private String describes;// 描述

	@Column
	private String zazataoPayDate;// zazatao付款日期

	@Column
	private String zazataoPayTime;// zazatao付款时间

	@Column
	private String notes;

	public Float getFare() {
		return fare;
	}

	public void setFare(Float fare) {
		this.fare = fare;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getZazataoPayDate() {
		return zazataoPayDate;
	}

	public void setZazataoPayDate(String zazataoPayDate) {
		this.zazataoPayDate = zazataoPayDate;
	}

	public String getZazataoPayTime() {
		return zazataoPayTime;
	}

	public void setZazataoPayTime(String zazataoPayTime) {
		this.zazataoPayTime = zazataoPayTime;
	}

	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public String getCellDate() {
		return cellDate;
	}

	public void setCellDate(String cellDate) {
		this.cellDate = cellDate;
	}

	public String getInStoreRoomDate() {
		return inStoreRoomDate;
	}

	public void setInStoreRoomDate(String inStoreRoomDate) {
		this.inStoreRoomDate = inStoreRoomDate;
	}

	public Currency getCurrency() {
		return currency;
	}

	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

	public String getSellerDate() {
		return sellerDate;
	}

	public void setSellerDate(String sellerDate) {
		this.sellerDate = sellerDate;
	}

	public String getCommSpec() {
		return commSpec;
	}

	public void setCommSpec(String commSpec) {
		this.commSpec = commSpec;
	}

	public Shop getSeller() {
		return seller;
	}

	public void setSeller(Shop seller) {
		this.seller = seller;
	}

	public ShopCommodity getShopCommodity() {
		return shopCommodity;
	}

	public void setShopCommodity(ShopCommodity shopCommodity) {
		this.shopCommodity = shopCommodity;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getWeight() {
		return weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public Integer getCommodityID() {
		return commodityID;
	}

	public void setCommodityID(Integer commodityID) {
		this.commodityID = commodityID;
	}

	public OrderForm getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(OrderForm orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getTradingCode() {
		return tradingCode;
	}

	public void setTradingCode(String tradingCode) {
		this.tradingCode = tradingCode;
	}

	public ShopCategory getShopcategory() {
		return shopcategory;
	}

	public void setShopcategory(ShopCategory shopcategory) {
		this.shopcategory = shopcategory;
	}

}
