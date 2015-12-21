package cn.edu.xmu.artwork.utils;

import java.util.List;

import net.sf.json.JSONArray;

public interface IJsonUtils
{
	public JSONArray List2JsonArray(List<?> list);
	public JSONArray List2JsonArray(List<?> list, String[] excludes);
}
