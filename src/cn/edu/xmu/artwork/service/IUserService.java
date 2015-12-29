package cn.edu.xmu.artwork.service;

import java.io.File;
import java.util.List;

import net.sf.json.JSONArray;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;

public interface IUserService {
	public void addUser(User user);
	public String register(User user);
	public String login(User user);
	public void logout();
	public List<Artist> getArtistList();
	public Artist getArtist(long id);
	public List<Artist> getArtistBySort(String identification);
	public List<Artist> getArtistByName(String name);
	public List<Commodity> showMyCommodity();
	public void submitArtist(Artist artist,List<File> pic,List<String> picFileName);	
	public ShippingAddress SelectAddress(long id);
	public List<ShippingAddress> ShowAllAddressList();
	public void AddNewAddress(ShippingAddress address);
	public void DeleteAddress(long id);
	public JSONArray getBriefArtistBySort(String identification);
	public void recharge(float balance);
	public List<Artist> getRecommendedArtists();
	public String alterpassword(User user,String newpassword);
	public String alterinfo(User user,Artist artist);
	public JSONArray getArtistFinishedOrder(String state);	
}
