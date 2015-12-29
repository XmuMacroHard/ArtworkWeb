package cn.edu.xmu.artwork.interceptors;

import cn.edu.xmu.artwork.constants.IClientConstants;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckLoginInterceptor extends AbstractInterceptor 
{
	@Override
	public String intercept(ActionInvocation invoker) throws Exception {
		
		Object user = invoker.getInvocationContext().getSession().get(IClientConstants.SESSION_USER);
		
		if(user == null)
		{
			return Action.LOGIN;
		}
		
		return invoker.invoke();
	}
	

}
