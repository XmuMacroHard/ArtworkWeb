package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.IArtistDao;
import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.dao.IInformationDao;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IAdminService;

/**
 * 后台管理的服务层实现
 * @author asus1
 *
 */
@Service
@Transactional
public class AdminService implements IAdminService {
	
	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private IInformationDao informationDao;
	
	@Autowired
	private IArtistDao artistDao;
	
	@Autowired
	private ICommodityDao commodityDao;

	
	/**
	 * 显示所有用户列表
	 * @author asus1
	 * @return 用户列表
	 */
	@Override
	public List<User> ShowAllUserList()
	{
		System.out.println("userlistService");
		List<User> userList = userDao.findAllNormal();
		return userList;
	}
	
	/**
	 * 禁用用户
	 * @author asus1
	 * @param 用户email
	 * @return 结果
	 */
	@Override
	public String UserBanning(long userId) throws Exception {
		
		System.out.println("in banning service");
		userDao.updateUserState(userId, "1");
		
		return null;
	}
	
	/**
	 * 启用用户
	 * @author asus1
	 * @param 用户email
	 * @return 结果
	 */
	@Override
	public String UserRelieve(long userId) throws Exception {
		
		System.out.println("in relieve service");
		userDao.updateUserState(userId, "0");
		
		return null;
	}
	
	/**
	 * 查看用户详情
	 * @author asus1
	 * @param userId
	 * @return user
	 * @throws Exception
	 */
	@Override
	public User ShowUserDetails(long userId) throws Exception {
		
		User user = userDao.findById(userId);
		
		return user;
	}

	/**
	 * 显示所有资讯列表
	 * @author asus1
	 */
	@Override
	public List<Information> ShowAllInfoList() throws Exception {
		
		List<Information> infoList = informationDao.getAll();
		
		return infoList;
	}

	/**
	 * 退回资讯
	 * @author asus1
	 * @param 资讯id
	 */
	@Override
	public String InfoRetreat(long infoId) throws Exception {
		
		informationDao.updateInfoStatus(infoId, "0");
		
		return null;
	}

	/**
	 * 通过资讯
	 * @author asus1
	 * @param 资讯id
	 */
	@Override
	public String InfoPass(long infoId) throws Exception {

		informationDao.updateInfoStatus(infoId, "1");
		
		return null;
	}
	
	/**
	 * 查看资讯详情
	 * @author asus1
	 * @param informationId
	 * @return information
	 * @throws Exception
	 */
	@Override
	public Information ShowInfoDetails(long informationId) throws Exception {
		
		Information information = informationDao.findInfoById(informationId);
		
		return information;
	}

	/**
	 * 显示所有艺术家列表
	 * @author asus1
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Artist> ShowAllArtistList() throws Exception {
		
		List<Artist> artistList = artistDao.getArtistList();
		return artistList;

	}

	/**
	 * 驳回艺术家认证
	 * @author asus1
	 * @param artistId
	 * @return
	 * @throws Exception
	 */
	@Override
	public String ArtistBanning(long artistId) throws Exception {

		artistDao.updateArtistStatus(artistId, "0");
		
		return null;
	}

	/**
	 * 通过艺术家认证
	 * @author asus1
	 * @param artistId
	 * @return
	 * @throws Exception
	 */
	@Override
	public String ArtistRelieve(long artistId) throws Exception {

		artistDao.updateArtistStatus(artistId, "1");
		
		return null;
	}

	/**
	 * 查看艺术家详情
	 * @author asus1
	 * @param artistId
	 * @return artist
	 * @throws Exception
	 */
	@Override
	public Artist ShowArtistDetails(long artistId) throws Exception {
		
		Artist artist = artistDao.getArtist(artistId);
		
		return artist;
	}

	/**
	 * 显示所有商品列表
	 * @author asus1
	 */
	@Override
	public List<Commodity> ShowAllItemList() throws Exception {
		List<Commodity> itemList = commodityDao.getCommodityList();
		return itemList;
	}

	/**
	 * 商品下架
	 * @author asus1
	 */
	@Override
	public String ItemBanning(long itemId) throws Exception {
		commodityDao.updateStatus(itemId, "0");
		
		return null;
	}

	/**
	 * 商品上架
	 * @author asus1
	 */
	@Override
	public String ItemRelieve(long itemId) throws Exception {
		commodityDao.updateStatus(itemId, "1");
		return null;
	}
	
	/**
	 * 查看商品详情
	 * @author asus1
	 * @param itemId
	 * @return item
	 * @throws Exception
	 */
	@Override
	public Commodity ShowItemDetails(long itemId) throws Exception {
		
		Commodity item = commodityDao.getCommodityById(itemId);
		
		return item;
	}

}
