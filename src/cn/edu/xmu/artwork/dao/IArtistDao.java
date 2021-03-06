package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.GenericDao;
import cn.edu.xmu.artwork.entity.Artist;

public interface IArtistDao{

	public List<Artist> getArtistList();
	public Artist findById(long id);
	public Artist getArtist(long id);
	public List<Artist> getArtistBySort(String identification);
	public List<Artist> getArtistByName(String name);
	public void submitArtist(Artist artist);
	public List<Artist> getRecommendedArtists(int num);	
	public void updateArtistStatus(long id, String status);
	public void update(Artist artist);
}
