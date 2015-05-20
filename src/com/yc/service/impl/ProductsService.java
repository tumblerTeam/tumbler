package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Products;
import com.yc.service.IProductsService;

@Component
public class ProductsService extends GenericService<Products> implements IProductsService {

	@Autowired
	GenericDao<Products> productsDao;
	
	@Override
	GenericDao<Products> getDao() {
		return productsDao;
	}

}
