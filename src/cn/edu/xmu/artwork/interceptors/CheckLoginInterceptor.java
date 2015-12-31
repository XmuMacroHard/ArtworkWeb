package cn.edu.xmu.artwork.interceptors;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.servlet.HttpServletBean;

import cn.edu.xmu.artwork.constants.IClientConstants;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckLoginInterceptor extends AbstractInterceptor 
{
	@Override
	public String intercept(ActionInvocation invoker) throws Exception {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		
		Object user = invoker.getInvocationContext().getSession().get(IClientConstants.SESSION_USER);
		
		String type = req.getHeader("X-Requested-With");
		
		if(user == null)
		{
			if("XMLHttpRequest".equalsIgnoreCase(type))
			{
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result", "notLogin"); 
                PrintWriter printWriter = ServletActionContext.getResponse().getWriter();  
                printWriter.print(jsonObject.toString());  
                printWriter.flush();  
                printWriter.close();  
                
                return null;
			}
			else
			{
				return Action.LOGIN;	
			}
			
		}
		
		return invoker.invoke();
	}
	

}
