package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Address;
import com.yc.service.IAddressService;
@Component
public class AddressService extends GenericService<Address> implements IAddressService {

	@Autowired
	GenericDao<Address> addressDao;
	
	@Override
	GenericDao<Address> getDao() {
		return addressDao;
	}
	@Override
	public List<Address> getAllByUser(Integer id) {
		return addressDao.getBy("user.id", id);
	}

}
