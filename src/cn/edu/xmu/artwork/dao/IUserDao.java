package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.User;

public interface IUserDao {
	public void insert(User user);
	public User search(User user);
	public List findAll();
	public List findAllNormal();
	public User findById(long id);
	public boolean findByEmail(String email);
	public void update(User user);
	
	/**
	 * 更新用户状态
	 * @author asus1
	 * @param userId
	 * @param state
	 */
	public void updateUserState(long userId, String state);

	public List<Artist> getArtistList();
	public Artist getArtist(long id);
	public List<Artist> getArtistBySort(String identification);
	public List<Artist> getArtistByName(String name);
	public void submitArtist(Artist artist);
}
