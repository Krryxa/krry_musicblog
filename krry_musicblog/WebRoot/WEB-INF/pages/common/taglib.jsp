<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tld/krry.tld" prefix="krry"%>
<%
String path = request.getContextPath();
int port = request.getServerPort();
String basePath = null; 
if(port==80){
	basePath = request.getScheme()+"://"+request.getServerName()+path;
}else{
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
}
pageContext.setAttribute("basePath", basePath);

%>
