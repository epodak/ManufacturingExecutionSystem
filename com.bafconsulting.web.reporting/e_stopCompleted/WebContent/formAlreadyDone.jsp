<%-- FormAlreadyDone --%>
<%-- Instantiate the form validation bean and supply the error message map --%>
<!-- Property Of:BAF CONSULTING-->
<!-- Author:Bryn Flewelling,Date: -->
<%@ page language="java" contentType="text/html"%>
<%@page contentType="text/html" import="java.util.*" %>
<%@ page import="e_stop.*" %>
<jsp:useBean id="user" class="e_stop.UserData" scope="session"></jsp:useBean>
<jsp:useBean id="form" class="e_stop.MyForm" scope="request"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>Cannot Process</title>
</head>
<body style="width:auto;height:auto;background-color:white;color:#333;text-align:center;font:90%">
<form id="2" method="post" style="width:auto;height:auto;">
<fieldset>
<legend style="border-style:solid;text-align:center;border-color:#333;">&nbsp;Error&nbsp;|&nbsp;<jsp:getProperty property="strResult" name="user"/>&nbsp;<br>&nbsp;<%= form.date() %>&nbsp;</legend>
<div style="width:auto;height:auto;margin-left:auto;margin-right:auto;">
 <p style="text-align:center;font:95%;font-weight:bold;">We cannot process your request at this time, please try again....</p><br>
  <%-- submit and reset--%>
      <%if(user.getStrResult() == ""){
%><p style="text-align:center;font:95%;font-weight:bold;"><font color=red>You must be logged in to use this page.</font></p><%
 }%>
<%if(user.getStrResult() == ""){
%><input type="button" value="Log-in" onclick="document.location = 'login.jsp';"/><input type="button" value="Exit" onclick="window.close()"/>
<%}else{%> 
<p  style="text-align:center;font:95%;margin-top:-10px;"><input type="button" value="New Report" onclick="document.location = 'process.jsp';"/><input type="button" value="Log-out"  onclick="document.location = 'logout.jsp';"/>
<%}%></p></div></fieldset>
</body>
</html>