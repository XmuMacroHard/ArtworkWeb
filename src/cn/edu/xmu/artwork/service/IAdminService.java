package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

/**
 * 后台管理的服务层接口
 * @author asus1
 *
 */
public interface IAdminService {
	
	public List ShowAllUserList() throws Exception;
	public String UserBanning(String userEmail) throws Exception;
	public String UserRelieve(String userEmail) throws Exception;
	
	public List<Information> ShowAllInfoList() throws Exception;
	public String InfoRetreat(long infoId) throws Exception;
	public String InfoPass(long infoId) throws Exception;
	
	public List<Artist> ShowAllArtistList() throws Exception;
	public String ArtistBanning(long artistId) throws Exception;
	public String ArtistRelieve(long artistId) throws Exception;
	public Artist ShowArtistDetails(long artistId) throws Exception; 

}
