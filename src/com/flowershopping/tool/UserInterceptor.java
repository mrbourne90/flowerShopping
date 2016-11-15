package com.flowershopping.tool;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 用于拦截未登录的操作
 * 
 * @author mrbourne
 *
 */
public class UserInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("rawtypes")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map session = invocation.getInvocationContext().getSession();
		if (session.get("user") == null) {
			return Action.LOGIN;
		}
		return invocation.invoke();
	}

}
