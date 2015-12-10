package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Commodity;


public interface ISaleService {
	List<Commodity> getCommodityListByType(String commoType);
}
