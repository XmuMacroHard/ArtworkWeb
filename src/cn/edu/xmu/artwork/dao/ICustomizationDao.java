package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizationDao {
	public List<Customization> getCustomizationsByUser(long id);
	public List<Customization> getCustomizationsByArtist(long id);
	public Customization findInfoById(long id);
	public void save(Customization customization);
}
