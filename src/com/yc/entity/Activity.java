package com.yc.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

//活动列表
@Entity
@DiscriminatorValue("activity")
@JsonIgnoreProperties(value={"commodities"})
public class Activity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer activityId;
	
	@Column
	private String startDate;//开始日期
	
	@Column
	private String endDate;//截止日期
	
	@Column
	private String activityName;//活动名称
	
	@Column
	private Boolean isOpenOrClose = false;
	
	@ManyToOne
	@JoinColumn(name="activityStyle_id")
	private ActivityStyle activityStyle;//活动类型
	
	@OneToMany(mappedBy="activity",cascade = {CascadeType.REFRESH},fetch=FetchType.EAGER)
	private List<ShopCommodity> commodities;//商品
	
	public Boolean getIsOpenOrClose() {
		return isOpenOrClose;
	}

	public void setIsOpenOrClose(Boolean isOpenOrClose) {
		this.isOpenOrClose = isOpenOrClose;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public ActivityStyle getActivityStyle() {
		return activityStyle;
	}

	public void setActivityStyle(ActivityStyle activityStyle) {
		this.activityStyle = activityStyle;
	}

	public List<ShopCommodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<ShopCommodity> commodities) {
		this.commodities = commodities;
	}

	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}
	
}
