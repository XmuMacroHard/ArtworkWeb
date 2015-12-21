package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Customization;

public interface ICustomizeService {
	public void addCustomization(Customization customization);
	public List<Customization> showCustomizationsList(long id);
	public List<Customization> getCustomizationsByUser(long id);
	public List<Customization> getCustomizationsByArtist(long id);
}
