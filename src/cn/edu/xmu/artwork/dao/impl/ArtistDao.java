package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IArtistDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.User;

@Repository
public class ArtistDao extends GenericDao implements IArtistDao{
	
	/**
	 * 根据艺术家id获取艺术家
	 */
	@Override
	public Artist findById(long id)
	{
		Artist  user = null;
		try {
			Query query = getSession().getNamedQuery("Artist.getById");
			query.setParameter("Id", id);
			user = (Artist) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * 获得所有艺术家列表
	 */
	public List<Artist> getArtistList()
	{
		List<Artist> list=null;
		try {
			Query query = getSession().getNamedQuery("Artist.getArtistList");
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 获得一个艺术家资料
	 */
	public Artist getArtist(long id)
	{
		Artist artist=null;
		try {
			Query query = getSession().getNamedQuery("Artist.getById").setParameter("Id", id);
			artist = (Artist) query.uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return artist;
	}
	
	/**
	 * 按类别查找艺术家
	 */
	public List<Artist> getArtistBySort(String identification)
	{
		List<Artist> list=null;
		try {
			Query query = getSession().getNamedQuery("Artist.getArtistBySort");
			query.setParameter("Search", identification);
			query.setParameter("isBanned", ITableConstants.USER_IS_BANNED_FALSE);
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 按名字查找艺术家
	 */
	public List<Artist> getArtistByName(String name)
	{
		List<Artist> list=null;
		try {
			Query query = getSession().getNamedQuery("Artist.getArtistByName").setParameter("Search", name);
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 艺术家认证资料提交
	 * @author sheng
	 */
	public void submitArtist(Artist artist)
	{
		try {
			Query queryupdate = getSession().getNamedQuery("Artist.submit")
					.setParameter(0, artist.getIdentification())
					.setParameter(1, artist.getRealName())
					.setParameter(2, artist.getIntroduction())
					.setParameter(3, artist.getFileurl())
					.setParameter(4, artist.getPortrait())
					.setParameter(5, artist.getId());
			
			queryupdate.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取推荐的艺术家
	 * @param num 艺术家个数
	 * @return 艺术家列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Artist> getRecommendedArtists(int num)
	{
		Query query = getSession().getNamedQuery("Artist.getRecommendedArtists");
		query.setMaxResults(num);
		query.setParameter("isBanned", ITableConstants.USER_IS_BANNED_FALSE);
		query.setParameter("isApproved", ITableConstants.USER_IS_APPROVED_APPROVE);
		return (List<Artist>)query.list();
	}
	/**
	 * 更新艺术家审核状态
	 * @author asus1
	 * @param id
	 * @param status
	 */
	public void updateArtistStatus(long id, String status)
	{
		String hql=String.format("update Artist artist set artist.isapprove = %s where artist.id = %d", status, id);
		Query queryupdate= getSession().createQuery(hql);
		int ret=queryupdate.executeUpdate();
	}
	
	public void update(Artist artist)
	{
		getSession().update(artist);
	}
}
