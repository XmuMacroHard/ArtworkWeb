package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IAddressDao;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.ShippingAddress;

/**
 * 所有针对地址的持久化操作
 * @author asus1
 */
@Repository
public class AddressDao extends GenericDao implements IAddressDao {

	/**
	 * 新增地址
	 * @author asus1
	 */
	@Override
	public void insert(ShippingAddress address) throws Exception {

		getSession().save(address);
	}

	/**
	 * 删除地址
	 * @author asus1
	 */
	@Override
	public void delete(long id) throws Exception {
		Query query = getSession().getNamedQuery("ShippingAddress.deleteById").setParameter("id", id);
		query.executeUpdate();
	}

	/**
	 * 修改地址
	 * @author asus1
	 */
	@Override
	public void update(ShippingAddress address) throws Exception {
		getSession().update(address);
		
	}

	/**
	 * 通过id查找地址
	 * @author asus1
	 */
	@Override
	public ShippingAddress findById(long id) throws Exception {

		Query query = getSession().getNamedQuery("ShippingAddress.findById").setParameter("id", id);
		ShippingAddress address = (ShippingAddress)query.uniqueResult();
		return address;
	}

	/**
	 * 查找所有地址列表
	 * @author asus1
	 */
	@Override
	public List<ShippingAddress> findAllByUserId(long userId) throws Exception {

		Query query = getSession().getNamedQuery("ShippingAddress.findAllByUserId").setParameter("userid", userId);
		List<ShippingAddress> addressList = (List<ShippingAddress>)query.list();
		return addressList;
	}

	
}
