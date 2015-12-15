<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_list_test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<form action="UserBanning">
  		<s:textfield name="user.email"/>
  		<s:textfield name="user.password"/>
  		<s:submit value="提交"/>
  	</form>
  
    <%-- <div class="widget-body">
                                    <div class="table-toolbar">
                                        
                                    </div>
                                    <table class="table table-striped table-hover table-bordered" id="editabledatatable">
                                        <thead>
                                            <tr role="row">
                                                <th>
                                                   	 邮箱
                                                </th>
                                                <th>
                                                   	 昵称
                                                </th>
                                                <th>
                                                   	 余额
                                                </th>
                                                <th>
                              					               联系方式
                                                </th>
                                                <th>
                                                	状态
                                                </th>
                                                <th>
													   审核
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator id="user" value="#request.list">
                                            <tr>
                                                <td>
                                                	<a href="#"><s:property value="#user.email"/></a>
                                                </td>
                                                <td>
                                                    <s:property value="#user.nickname"/>
                                                </td>
                                                <td>
                                                    <s:property value="#user.balance"/>
                                                </td>
                                                <td>
                                                    <s:property value="#user.phone"/>
                                                </td>
                                                <td>
                                                    <s:property value="#user.isvalid"/>
                                                </td>
                                                <td>
                                                	<s:url id="#" action="#">
														<s:param name="email">
															<s:property value="user.email"/>
														</s:param>
													</s:url>
                                                    <s:a href="%{#}" cssClass="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> 解禁</s:a>
                                                    <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> 禁用</a>
                                                </td>
                                            </tr>
                                        </s:iterator>
                                        </tbody>
                                   </table>
                                </div> --%>
  </body>
</html>
