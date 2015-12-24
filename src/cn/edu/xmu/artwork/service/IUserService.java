package cn.edu.xmu.artwork.service;

import java.io.File;
import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

public interface IUserService {
	public void addUser(User user);
	public void register(User user) throws Exception;
	public String login(User user);
	public void logout();
	public List<Artist> getArtistList();
	public Artist getArtist(long id);
	public List<Artist> getArtistBySort(String identification);
	public List<Artist> getArtistByName(String name);
	public List<Commodity> showMyCommodity();
	public void submitArtist(Artist artist,List<File> pic,List<String> picFileName);
	public void recharge(float balance);
}
