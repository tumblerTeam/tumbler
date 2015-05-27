package com.yc.entity.user;

import java.beans.Transient;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.yc.entity.Shop;

@Entity
@DiscriminatorValue("user")//用户
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(length = 32, unique = true, updatable = false)
	private String mobile;

	@Column(length = 32)
	private String password;

	@Column(length = 32)
	private String userName;

	@Column
	private String email;
	
	@Column
	private String validateCode;//邮箱激活码
	
	@Column
	private Boolean  status;
	
	@Column
	private String emailBindTime;
	
	@Column
	@Enumerated(EnumType.STRING)
	private Sex sex;
	
	@OneToOne
	@JoinColumn(name = "shop_id")
	private Shop shop;
	
	@Column
	private String birthday;

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getEmailBindTime() {
		return emailBindTime;
	}

	public void setEmailBindTime(String emailBindTime) {
		this.emailBindTime = emailBindTime;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Sex getSex() {
		return sex;
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	@Transient
    public Date getLastActivateTime() throws ParseException {
        Calendar cl = Calendar.getInstance();
        cl.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(emailBindTime));
        cl.add(Calendar.DATE , 2);
        return cl.getTime();
    }
}
