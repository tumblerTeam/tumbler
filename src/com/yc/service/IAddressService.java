package com.yc.service;

import java.util.List;

import com.yc.entity.Address;

public interface IAddressService extends IGenericService<Address> {
	
	List<Address> getAllByUser(Integer id);

}
