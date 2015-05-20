package com.yc.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("agriculturalsSort")//分类
public class AgriculturalsSort {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(length = 32)
	private String departmentname;// 名称

	@Column
	private String describes; // 图片路径
	
	@Column
	@Enumerated(EnumType.STRING)
	private Language language;
	
	@OneToMany(mappedBy = "agriculturalsSort",fetch=FetchType.EAGER)
	private Set<Products> products;
	
	@ManyToOne(cascade = {CascadeType.MERGE,CascadeType.DETACH,CascadeType.PERSIST,CascadeType.REFRESH}, fetch = FetchType.EAGER)
	@JoinColumn(name = "parentLevel")
	private AgriculturalsSort parentLevel;//父节点；
	
	@OneToMany(mappedBy = "parentLevel",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private Set<AgriculturalsSort> children = new HashSet<AgriculturalsSort>();

	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	public Set<Products> getProducts() {
		return products;
	}

	public void setProducts(Set<Products> products) {
		this.products = products;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public AgriculturalsSort getParentLevel() {
		return parentLevel;
	}

	public void setParentLevel(AgriculturalsSort parentLevel) {
		this.parentLevel = parentLevel;
	}

	public Set<AgriculturalsSort> getChildren() {
		return children;
	}

	public void setChildren(Set<AgriculturalsSort> children) {
		this.children = children;
	}
	
}
