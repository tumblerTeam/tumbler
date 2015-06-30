package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.yc.entity.user.Personnel;

//任务计划
@Entity
@DiscriminatorValue("missionPlan")
public class MissionPlan {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String missionName;//名称
	
	@Column
	private String content;//内容
	
	@Column
	private String  from;//来自谁
	
//	@ManyToOne
//	@JoinColumn(name = "to_personnel")
//	private Personnel  toPer;//给谁
	
	
	@Column
	@Enumerated(EnumType.STRING)
	private AdvState advState;//状态
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMissionName() {
		return missionName;
	}

	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}

	public AdvState getAdvState() {
		return advState;
	}

	public void setAdvState(AdvState advState) {
		this.advState = advState;
	}
}
