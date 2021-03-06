package cn.edu.xmu.artwork.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

import org.hibernate.*;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.Admin;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.Editor;
import cn.edu.xmu.artwork.entity.User;

@Repository
public class UserDao extends GenericDao implements IUserDao 
{
	
	public void insert(User user) 
	{		
		System.out.println("in user dao" + user.getEmail() + user.getPassword());
		getSession().save(user);
		System.out.println("success");
	} 
	
	/**
	 * search user by the email and password
	 */
	public User search(User user)
	{
		System.out.println("search in dao："+ user.getEmail() + "  " + user.getPassword());
		Query query = getSession().getNamedQuery("getUserByEmailPassword");
		query.setParameter("email", user.getEmail());
		query.setParameter("password", user.getPassword());
		return  (User)query.uniqueResult();
	}
	
	@SuppressWarnings("rawtypes")
	public List findAll() {
		
		try {
			String queryString = "from User";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public User findById(long id)
	{
		System.out.println("search id "+ id);
		User  user = null;
		try {
			Query query = getSession().getNamedQuery("User.getById");
			query.setParameter("id", id);
			user = (User) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * 根据email查看用户是否存在
	 */
	public boolean findByEmail(String email)
	{
		try {
			Query query = getSession().getNamedQuery("getUsersbyEmail").setParameter("email", email);
			if(query.list().size()==0)
				return true;
			else
				return false;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 获取所有普通用户
	 * @author asus1
	 */
	@Override
	public List findAllNormal() {
		List userList = findAll();
		List normalUserList = new ArrayList();
		
		for(int i = 0; i < userList.size(); i++)
		{
			Object object = userList.get(i);
			if(object instanceof Artist) continue;
			else if(object instanceof Admin) continue;
			else if(object instanceof Editor) continue;
			else
				normalUserList.add(object);
		}
		
		return normalUserList;
	}
	
	/**
	 * 更新用户状态
	 * @author asus1
	 * @param userEmail
	 * @param state
	 */
	public void updateUserState(long userId, String status)
	{
		Query queryupdate= getSession().getNamedQuery("User.updateStatus").setParameter("isBanned", status).setParameter("id", userId);
		int ret=queryupdate.executeUpdate();
	}

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
			
			Transaction trans = getSession().beginTransaction();
			String hql=String.format("update User set type='artist',isapprove='pending',identification='%s',realName='%s',introduction='%s' where id=5",
					artist.getIdentification(),artist.getRealName(),artist.getIntroduction());
			Query queryupdate=getSession().createQuery(hql);
			queryupdate.executeUpdate();
			trans.commit();
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void update(User user)
	{
		getSession().update(user);
	}

}
