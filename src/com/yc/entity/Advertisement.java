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

@Entity
@DiscriminatorValue("advertisement")//广告
public class Advertisement {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String link;//链接
	
	@OneToOne(mappedBy = "advertisement" )
	private ShopCommodity commodity;;
	
	@Column
	private Float expenditure;//支出
	
	@Column
	private Float income;//收入
	
	@Column
	private String startDate;//开始日期
	
	@Column
	private int during;//持续时间
	
	@Column
	private String imagePath;
	
	@ManyToOne
	@JoinColumn( name = "adverDistribution_id" )
	private AdvertiseDistribution adverDistribution;//广告分布

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

	public ShopCommodity getCommodity() {
		return commodity;
	}

	public void setCommodity(ShopCommodity commodity) {
		this.commodity = commodity;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String chinaLink) {
		this.link = chinaLink;
	}
	
	public AdvertiseDistribution getAdverDistribution() {
		return adverDistribution;
	}

	public void setAdverDistribution(AdvertiseDistribution adverDistribution) {
		this.adverDistribution = adverDistribution;
	}

	public Float getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(Float expenditure) {
		this.expenditure = expenditure;
	}

	public Float getIncome() {
		return income;
	}

	public void setIncome(Float income) {
		this.income = income;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getDuring() {
		return during;
	}

	public void setDuring(int during) {
		this.during = during;
	}
}
