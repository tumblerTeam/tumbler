package com.yc.entity;

import java.util.List;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.user.AppUser;

@Entity
@DiscriminatorValue("shop")//商店
@JsonIgnoreProperties(value = { "shopCommoidties" })
public class Shop {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column
	private String shopName;//店名
	
	@ManyToOne
	@JoinColumn(name = "shopCategory_id")
	private ShopCategory shopCat;//店铺类型
	
	@Column
	private String comName;//企业名称
	
	@Column
	private String juridicalPerson;//法人
	
	@Column
	private String privatePerson;//个人
	
	@Column
	private String sex;//性别
	
	@Column
	private String birthday; //生日
	
	@Column
	private String idCard;//身份证
	
	@Column
	private String juridicalCard; //法人身份证

	@Column
	private String juridicalCardUrl; //法人身份证url
	
	@Column
	private String idCardUrl; //身份证url
	
	@Column
	private String foodCriLisUrl; //食品流通许可证url

	@Column
	private String taxRegUrl; //税务登记url
	
	@Column
	private String businesslisUrl; //营业执照url
	
	@Column
	private String authorizeUrl; //授权委托书url
	
	@Column
	private String proRunPermitCardUrl; //生产经营许可证Url
	
	@Column
	private String qsIdentityUrl; //QS认证Url
	
	@Column
	private String alcoholMultiPermitUrl; //自治区酒类批发许可证Url
	
	@Column
	private String alcoholSellContractUrl;//酒类经销合同Url
	
	@Column
	private String sellAuthorizeUrl;//经销授权书Url
	
	@Column
	private String alcoholRunPermitUrl;//酒类经营许可证url
	
	@Column
	private String RetailRecordRegUrl;//零售备案登记证Url
		
	@Column
	private String payPwd;//支付密码；
	
	@Column
	@Enumerated(EnumType.STRING)
	private ShopType shopType;//性质
	
	@Column
	private String address; //地区
	
	@Column
	@Enumerated(EnumType.STRING)
	private Possession possession;//所属地
	
	@Column
	private String blank;//银行
	
	@Column
	private String money;//钱
	
	@Column( unique = true, updatable = false)
	private String blankAccount;//公司账户
	
	@Column
	private String phone;
	
	@Column
	private String email;
	
	@Column
	private Boolean isPermit = false;//是否许可开店
	
	@Column
	private Ratings ratings;//店铺等级
	
	@Column
	private String createDate;//开店日期
	
	@OneToMany(mappedBy = "belongTo")
	private List<ShopCommodity> shopCommoidties;//店铺商品
	
	@OneToMany(mappedBy = "carbelongTo")
	private List<CarCommoidty> carCommoidties;//店铺商品
	
	@OneToOne(mappedBy = "shop")
	private AppUser user;
	
	@OneToOne
	@JoinColumn(name = "blacklist_id")
	private Blacklist blacklist;
	
	@Column
	private String russinaShopName ;

	@OneToMany(mappedBy = "shop")
	private List<FamousManorAndShop> manorAndShops;//名庄
	
	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getAuthorizeUrl() {
		return authorizeUrl;
	}

	public void setAuthorizeUrl(String authorizeUrl) {
		this.authorizeUrl = authorizeUrl;
	}

	public String getProRunPermitCardUrl() {
		return proRunPermitCardUrl;
	}

	public void setProRunPermitCardUrl(String proRunPermitCardUrl) {
		this.proRunPermitCardUrl = proRunPermitCardUrl;
	}

	public String getQsIdentityUrl() {
		return qsIdentityUrl;
	}

	public void setQsIdentityUrl(String qsIdentityUrl) {
		this.qsIdentityUrl = qsIdentityUrl;
	}

	public String getAlcoholMultiPermitUrl() {
		return alcoholMultiPermitUrl;
	}

	public void setAlcoholMultiPermitUrl(String alcoholMultiPermitUrl) {
		this.alcoholMultiPermitUrl = alcoholMultiPermitUrl;
	}

	public String getAlcoholSellContractUrl() {
		return alcoholSellContractUrl;
	}

	public void setAlcoholSellContractUrl(String alcoholSellContractUrl) {
		this.alcoholSellContractUrl = alcoholSellContractUrl;
	}

	public String getSellAuthorizeUrl() {
		return sellAuthorizeUrl;
	}

	public void setSellAuthorizeUrl(String sellAuthorizeUrl) {
		this.sellAuthorizeUrl = sellAuthorizeUrl;
	}

	public String getAlcoholRunPermitUrl() {
		return alcoholRunPermitUrl;
	}

	public void setAlcoholRunPermitUrl(String alcoholRunPermitUrl) {
		this.alcoholRunPermitUrl = alcoholRunPermitUrl;
	}

	public String getRetailRecordRegUrl() {
		return RetailRecordRegUrl;
	}

	public void setRetailRecordRegUrl(String retailRecordRegUrl) {
		RetailRecordRegUrl = retailRecordRegUrl;
	}

	public String getFoodCriLisUrl() {
		return foodCriLisUrl;
	}

	public void setFoodCriLisUrl(String foodCriLisUrl) {
		this.foodCriLisUrl = foodCriLisUrl;
	}

	public String getJuridicalCardUrl() {
		return juridicalCardUrl;
	}

	public void setJuridicalCardUrl(String juridicalCardUrl) {
		this.juridicalCardUrl = juridicalCardUrl;
	}

	public String getIdCardUrl() {
		return idCardUrl;
	}

	public void setIdCardUrl(String idCardUrl) {
		this.idCardUrl = idCardUrl;
	}

	public String getBusinesslisUrl() {
		return businesslisUrl;
	}

	public void setBusinesslisUrl(String businesslisUrl) {
		this.businesslisUrl = businesslisUrl;
	}

	public String getTaxRegUrl() {
		return taxRegUrl;
	}

	public void setTaxRegUrl(String taxRegUrl) {
		this.taxRegUrl = taxRegUrl;
	}

	public String getJuridicalCard() {
		return juridicalCard;
	}

	public void setJuridicalCard(String juridicalCard) {
		this.juridicalCard = juridicalCard;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPrivatePerson() {
		return privatePerson;
	}

	public void setPrivatePerson(String privatePerson) {
		this.privatePerson = privatePerson;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public List<FamousManorAndShop> getManorAndShops() {
		return manorAndShops;
	}

	public void setManorAndShops(List<FamousManorAndShop> manorAndShops) {
		this.manorAndShops = manorAndShops;
	}

	public Ratings getRatings() {
		return ratings;
	}

	public void setRatings(Ratings ratings) {
		this.ratings = ratings;
	}

	public String getRussinaShopName() {
		return russinaShopName;
	}

	public void setRussinaShopName(String russinaShopName) {
		this.russinaShopName = russinaShopName;
	}

	public Blacklist getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(Blacklist blacklist) {
		this.blacklist = blacklist;
	}

	public List<CarCommoidty> getCarCommoidties() {
		return carCommoidties;
	}

	public void setCarCommoidties(List<CarCommoidty> carCommoidties) {
		this.carCommoidties = carCommoidties;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public ShopCategory getShopCat() {
		return shopCat;
	}

	public void setShopCat(ShopCategory shopCat) {
		this.shopCat = shopCat;
	}

	public AppUser getUser() {
		return user;
	}

	public void setUser(AppUser user) {
		this.user = user;
	}

	public String getPayPwd() {
		return payPwd;
	}

	public void setPayPwd(String payPwd) {
		this.payPwd = payPwd;
	}

	public String getJuridicalPerson() {
		return juridicalPerson;
	}

	public void setJuridicalPerson(String juridicalPerson) {
		this.juridicalPerson = juridicalPerson;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public Possession getPossession() {
		return possession;
	}

	public void setPossession(Possession possession) {
		this.possession = possession;
	}

	public ShopType getShopType() {
		return shopType;
	}

	public void setShopType(ShopType shopType) {
		this.shopType = shopType;
	}

	public List<ShopCommodity> getShopCommoidties() {
		return shopCommoidties;
	}

	public void setShopCommoidties(List<ShopCommodity> shopCommoidties) {
		this.shopCommoidties = shopCommoidties;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getBlank() {
		return blank;
	}

	public void setBlank(String blank) {
		this.blank = blank;
	}

	public String getBlankAccount() {
		return blankAccount;
	}

	public void setBlankAccount(String blankAccount) {
		this.blankAccount = blankAccount;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getIsPermit() {
		return isPermit;
	}

	public void setIsPermit(Boolean isPermit) {
		this.isPermit = isPermit;
	}

}
