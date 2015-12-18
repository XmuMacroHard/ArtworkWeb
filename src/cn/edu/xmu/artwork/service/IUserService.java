package cn.edu.xmu.artwork.service;

import java.io.File;
import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

public interface IUserService {
	public void addUser(User user);
	public void register(User user) throws Exception;
	public User login(User user);
	public List<Artist> getArtistList();
	public Artist getArtist(long id);
	public List<Artist> getArtistBySort(String identification);
	public List<Artist> getArtistByName(String name);
	public void submitArtist(Artist artist,List<File> pic, List<String> picFileName);//,List<File> data, List<String> dataFileName);
}
