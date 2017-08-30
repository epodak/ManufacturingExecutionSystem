<%-- FormComplete --%>
<!-- Property Of:BAFCONSULTING.-->
<!-- Author:Bryn Flewelling,Date:2011.2.08 -->
<%@ page language="java" contentType="text/html"%>
<%@ page import="e_stop.*" %>
<jsp:useBean id="user" class="e_stop.UserData" scope="session"></jsp:useBean>
<jsp:useBean id="form" class="e_stop.MyForm" scope="request"></jsp:useBean>
  <% if(user.getStrResult() == ""){
    	response.sendRedirect("formAlreadyDone.jsp");
    } %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>Processed</title>
</head>
<body style="width:auto;height:auto;background-color:white;color:#333;text-align:center;font:90%">
<form id="2" method="post" style="width:auto;height:auto;">
<fieldset>
<legend style="border-style:solid;text-align:center;border-color:#333;">&nbsp;E-Stop&nbsp;|&nbsp;<jsp:getProperty property="strResult" name="user"/>&nbsp;<br>&nbsp;<%= form.date() %>&nbsp;</legend>
<div style="width:auto;height:auto;margin-left:auto;margin-right:auto;">
<p  style="text-align:center;font:95%;font-weight:bold;">Thank you for your submission....</p><br>
  <%-- submit and reset--%>
<p  style="text-align:center;font:95%;margin-top:-10px;"><input type="button" value="New Report" onclick="document.location = 'process.jsp';"/>
<% if(user.getStrResult() != "") {
	%><input type="button" value="Log-out"  onclick="document.location = 'logout.jsp';"/>
<%}%>
</p></div></fieldset></form>
</body>
</html>