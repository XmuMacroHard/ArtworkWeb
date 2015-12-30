package cn.edu.xmu.artwork.utils.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import cn.edu.xmu.artwork.utils.IJsonUtils;

@Component
public class JsonUtils implements IJsonUtils
{
	/**
	 * list转换为jsonarray
	 * @param list list列表
	 * @return JSONArray
	 */
	public JSONArray List2JsonArray(List<?> list)
	{
		return JSONArray.fromObject(list);
	}
	
	/**
	 * list转换为jsonarray
	 * @param list list列表
	 * @param excludes 过滤字段 
	 */
	public JSONArray List2JsonArray(List<?> list, String[] excludes)
	{
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		return JSONArray.fromObject(list, jsonConfig);
	}
}
