package com.yc.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("products")//产品
public class Products {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String productsName;
	
	@Column
	private String brand;//品牌照片
	
	@Column
	private String productsPhoto;//产品照片
	
	@Column
	private String effect;//作用
	
	@Column
	private String benefits;//功效
	
	@ElementCollection
    @Column(name = "recommend")
    @CollectionTable(name = "recommend_path")
	private List<String> recommends = new ArrayList<String>();//推荐照片
	
	@ManyToOne
	@JoinColumn(name = "agriculturalsSort_id")
	private AgriculturalsSort agriculturalsSort;

	@Column
	@Enumerated(EnumType.STRING)
	private Language language;
	
	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	public String getProductsName() {
		return productsName;
	}

	public void setProductsName(String productsName) {
		this.productsName = productsName;
	}

	public void addRecommends(String path) {
		recommends.add(path);
    }
	
	public List<String> getRecommends() {
		return recommends;
	}

	public void setRecommends(List<String> recommends) {
		this.recommends = recommends;
	}

	public AgriculturalsSort getAgriculturalsSort() {
		return agriculturalsSort;
	}

	public void setAgriculturalsSort(AgriculturalsSort agriculturalsSort) {
		this.agriculturalsSort = agriculturalsSort;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getProductsPhoto() {
		return productsPhoto;
	}

	public void setProductsPhoto(String productsPhoto) {
		this.productsPhoto = productsPhoto;
	}

	public String getEffect() {
		return effect;
	}

	public void setEffect(String effect) {
		this.effect = effect;
	}

	public String getBenefits() {
		return benefits;
	}

	public void setBenefits(String benefits) {
		this.benefits = benefits;
	}
	
}
