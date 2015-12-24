package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IArtistDao;
import cn.edu.xmu.artwork.entity.Artist;

@Repository
public class ArtistDao extends UserDao implements IArtistDao{
	public List<Artist> getArtistList()//获得所有艺术家列表
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
	
	public Artist getArtist(long id)//获得一个艺术家资料
	{
		Artist artist=null;
		try {
			Query query = getSession().getNamedQuery("Artist.getArtist").setParameter("Id", id);
			artist = (Artist) query.uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return artist;
	}
	
	public List<Artist> getArtistBySort(String identification)//按类别查找艺术家
	{
		List<Artist> list=null;
		try {
			Query query = getSession().getNamedQuery("Artist.getArtistBySort").setParameter("Search", identification);
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Artist> getArtistByName(String name)//按名字查找艺术家
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
					.setParameter(5, 4L);
			
			queryupdate.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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
}
