package com.yc.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.yc.entity.user.AppUser;
//收藏
@Entity
@DiscriminatorValue("collection")
public class Collection {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@OneToOne
	@JoinColumn(name = "shopComm_commCode")
	private ShopCommodity shopCommoidty;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private AppUser user;

	public AppUser getUser() {
		return user;
	}

	public void setUser(AppUser user) {
		this.user = user;
	}

	public ShopCommodity getShopCommoidty() {
		return shopCommoidty;
	}

	public void setShopCommoidty(ShopCommodity shopCommoidty) {
		this.shopCommoidty = shopCommoidty;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
