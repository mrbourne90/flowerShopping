package com.flowershopping.tool;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 用于拦截未登录的管理员
 * 
 * @author mrbourne
 *
 */
public class AdminInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		@SuppressWarnings("rawtypes")
		Map session = invocation.getInvocationContext().getSession();
		if(session.get("admin") == null){
			return Action.LOGIN;
		}
		return invocation.invoke();
	}

}
