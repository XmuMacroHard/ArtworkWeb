package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

/**
 * 后台管理的服务层接口
 * @author asus1
 *
 */
public interface IAdminService {
	
	public List<User> ShowAllUserList() throws Exception;
	public String UserBanning(long userId) throws Exception;
	public String UserRelieve(long userId) throws Exception;
	public User ShowUserDetails(long userId) throws Exception;
	
	public List<Information> ShowAllInfoList() throws Exception;
	public String InfoRetreat(long infoId) throws Exception;
	public String InfoPass(long infoId) throws Exception;
	public Information ShowInfoDetails(long informationId) throws Exception;
	
	public List<Artist> ShowAllArtistList() throws Exception;
	public String ArtistBanning(long artistId) throws Exception;
	public String ArtistRelieve(long artistId) throws Exception;
	public Artist ShowArtistDetails(long artistId) throws Exception;
	
	public List<Commodity> ShowAllItemList() throws Exception;
	public String ItemBanning(long itemId) throws Exception;
	public String ItemRelieve(long itemId) throws Exception;
	public Commodity ShowItemDetails(long itemId) throws Exception;

}
