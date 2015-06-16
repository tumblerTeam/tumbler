
package com.yc.dao.orm.commons;

import org.springframework.context.annotation.*;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.Advertisement;
import com.yc.entity.Blacklist;
import com.yc.entity.Brand;
import com.yc.entity.CarCommoidty;
import com.yc.entity.Collection;
import com.yc.entity.Commodity;
import com.yc.entity.Currency;
import com.yc.entity.Delivery;
import com.yc.entity.DeliveryAddress;
import com.yc.entity.FamousManor;
import com.yc.entity.FamousManorAndShop;
import com.yc.entity.ImagePath;
import com.yc.entity.News;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderGroup;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommodity;
import com.yc.entity.ShopCommoidtySpecs;
import com.yc.entity.ShopReviews;
import com.yc.entity.Specifications;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Department;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.entity.user.AppUser;

@Configuration
public class GenericDaoConfig {

    @Bean
    public GenericDao<AppUser> getUserDao() {
        return new GenericDaoSupport<AppUser>(AppUser.class);
    }
    @Bean
    public GenericDao<Blacklist> getBlacklistDao() {
    	return new GenericDaoSupport<Blacklist>(Blacklist.class);
    }
    @Bean
    public GenericDao<Brand> getBrandDao() {
    	return new GenericDaoSupport<Brand>(Brand.class);
    }
    @Bean
    public GenericDao<CarCommoidty> getCarCommoidtyDao() {
    	return new GenericDaoSupport<CarCommoidty>(CarCommoidty.class);
    }
    @Bean
    public GenericDao<Collection> getCollectionDao() {
    	return new GenericDaoSupport<Collection>(Collection.class);
    }
    @Bean
    public GenericDao<Commodity> getCommodityDao() {
    	return new GenericDaoSupport<Commodity>(Commodity.class);
    }
    @Bean
    public GenericDao<Currency> getCurrencyDao() {
    	return new GenericDaoSupport<Currency>(Currency.class);
    }
    @Bean
    public GenericDao<DeliveryAddress> getDeliveryAddressDao() {
    	return new GenericDaoSupport<DeliveryAddress>(DeliveryAddress.class);
    }
    @Bean
    public GenericDao<ImagePath> getImagePathDao() {
    	return new GenericDaoSupport<ImagePath>(ImagePath.class);
    }
    @Bean
    public GenericDao<OrderForm> getOrderFormDao() {
    	return new GenericDaoSupport<OrderForm>(OrderForm.class);
    }
    @Bean
    public GenericDao<Shop> getShopDao() {
    	return new GenericDaoSupport<Shop>(Shop.class);
    }
    @Bean
    public GenericDao<ShopCategory> getShopCategoryDao() {
    	return new GenericDaoSupport<ShopCategory>(ShopCategory.class);
    }
    @Bean
    public GenericDao<ShopCommImage> getShopCommImageDao() {
    	return new GenericDaoSupport<ShopCommImage>(ShopCommImage.class);
    }
    @Bean
    public GenericDao<ShopCommodity> getShopCommoidtyDao() {
    	return new GenericDaoSupport<ShopCommodity>(ShopCommodity.class);
    }
    @Bean
    public GenericDao<ShopCommoidtySpecs> getShopCommoidtySpecsDao() {
    	return new GenericDaoSupport<ShopCommoidtySpecs>(ShopCommoidtySpecs.class);
    }
    @Bean
    public GenericDao<ShopReviews> getShopReviewsDao() {
    	return new GenericDaoSupport<ShopReviews>(ShopReviews.class);
    }
    @Bean
    public GenericDao<Specifications> getSpecificationsDao() {
    	return new GenericDaoSupport<Specifications>(Specifications.class);
    }
    @Bean 
    public GenericDao<OrderGroup> getOrderGroupDao() {
    	return new GenericDaoSupport<OrderGroup>(OrderGroup.class);
    }
    @Bean 
    public GenericDao<DepartAndPositions> getDepartAndPositionsDao() {
    	return new GenericDaoSupport<DepartAndPositions>(DepartAndPositions.class);
    }
    @Bean 
    public GenericDao<Department> getDepartmentDao() {
    	return new GenericDaoSupport<Department>(Department.class);
    }
    @Bean 
    public GenericDao<Positions> getPositionsDao() {
    	return new GenericDaoSupport<Positions>(Positions.class);
    }
    @Bean 
    public GenericDao<Personnel> getPersonnelDao() {
    	return new GenericDaoSupport<Personnel>(Personnel.class);
    }
    @Bean 
    public GenericDao<Delivery> getDeliveryDao() {
    	return new GenericDaoSupport<Delivery>(Delivery.class);
    }
    @Bean
    public GenericDao<News> getNewsDao() {
    	return new GenericDaoSupport<News>(News.class);
    }
    @Bean
    public GenericDao<FamousManor> getFamousManorDao() {
    	return new GenericDaoSupport<FamousManor>(FamousManor.class);
    }
    @Bean
    public GenericDao<FamousManorAndShop> getFamousManorAndShopDao() {
    	return new GenericDaoSupport<FamousManorAndShop>(FamousManorAndShop.class);
    }
    @Bean
    public GenericDao<AdvertiseDistribution> getAdvertiseDistributionDao() {
    	return new GenericDaoSupport<AdvertiseDistribution>(AdvertiseDistribution.class);
    }
    @Bean
    public GenericDao<Advertisement> getAdvertisementDao() {
    	return new GenericDaoSupport<Advertisement>(Advertisement.class);
    }
}
