<%-- FormComplete --%>
<!-- Property Of:BAFCONSULTING-->
<!-- Author:Bryn Flewelling,Date:2011.2.08 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="user" class="e_stop.UserData" scope="session"></jsp:useBean>
<jsp:useBean id="form" class="e_stop.MyForm" scope="request"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>Logout</title>
</head>
<body style="width:auto;height:auto;background-color:white;color:#333;text-align:center;font:90%">
<form id="2" method="post" style="width:auto;height:auto;">
  <%--logout(reset values)--%>
<% if(user.getStrResult() != ""){
	user.setUserName(""); user.setPassword(""); form.seteStop(""); form.setCheck("");user.setStrResult("");
	response.sendRedirect("login.jsp");
}else{%>
<fieldset>
<legend style="border-style:solid;text-align:center;border-color:#333;">&nbsp;Logout&nbsp;|&nbsp;<jsp:getProperty property="strResult" name="user"/>&nbsp;<br>&nbsp;<%= form.date() %>&nbsp;</legend>
<div style="width:auto;height:auto;margin-left:auto;margin-right:auto;">
	<p>You are already logged out, please log in.</p>
	<p><input type="button" value="Log-in" onclick="document.location = 'login.jsp';"/></p></div></fieldset></form><%}%>
</body>
</html>