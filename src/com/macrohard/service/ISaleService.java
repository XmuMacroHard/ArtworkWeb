package com.macrohard.service;

import java.util.List;

import com.macrohard.entity.Commodity;


public interface ISaleService {
	List<Commodity> getCommodityListByType(String commoType);
}
