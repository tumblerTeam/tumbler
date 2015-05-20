
package com.yc.dao.orm.commons;

import org.springframework.context.annotation.*;

import com.yc.entity.AgriculturalsSort;
import com.yc.entity.News;
import com.yc.entity.Products;
import com.yc.entity.user.User;

@Configuration
public class GenericDaoConfig {

    @Bean
    public GenericDao<User> getUserDao() {
        return new GenericDaoSupport<User>(User.class);
    }
    @Bean
    public GenericDao<AgriculturalsSort> getAgriculturalsSortDao() {
    	return new GenericDaoSupport<AgriculturalsSort>(AgriculturalsSort.class);
    }
    @Bean
    public GenericDao<Products> getProductsDao() {
    	return new GenericDaoSupport<Products>(Products.class);
    }
    @Bean
    public GenericDao<News> getNewsDao() {
    	return new GenericDaoSupport<News>(News.class);
    }

}
