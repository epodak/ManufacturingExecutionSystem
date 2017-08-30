<%-- Login --%>
<!-- Property Of:BAFCONSULTING-->
<!-- Author:Bryn Flewelling,Date:2011.2.08 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html"%>
<%@ page import="e_stop.*" %>
<jsp:useBean id="user" class="e_stop.UserData" scope="session"><jsp:setProperty name="user" property="errorMessages" value='<%= errorMap %>'/></jsp:useBean>
<jsp:useBean id="form" class="e_stop.MyForm" scope="request"></jsp:useBean>
<%
    //Ask the browser not to cache the page
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache");

   // if(user.getUserName() != ""){
    //	response.sendRedirect("formAlreadyDone.jsp");
   // }
    
    // If process is true and a timestamp is present, attempt to validate and process the form
    String timestamp = request.getParameter("timestamp");
    try{
		if ("true".equals(request.getParameter("process")) && timestamp != null) {
      	  	// Check timestamp
		if (!timestamp.equals(session.getAttribute("e_stop.UserData.timestamp"))) {
            response.sendRedirect("formAlreadyDone.jsp");
            return;
       }%>
		<jsp:setProperty name="user" property="*" />
		<%
		if (user.process()) {
            // Save a new timestamp in the session
            timestamp = ""+System.currentTimeMillis();
            session.setAttribute("e_stop.UserData.timestamp", timestamp);
            // Go to completion page
            response.sendRedirect("process.jsp");
            return;
        }
    } else {
        timestamp = ""+System.currentTimeMillis();
        session.setAttribute("e_stop.UserData.timestamp", timestamp);
    }
    } catch (Exception e) {
		System.out.println("Error, please contact your administrator. Long values not supported." + e.getMessage());%>
	<script>alert('Error, please contact your administrator. Long values not supported.')</script>	
<%}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>Login</title></head>
<body style="width:auto;height:auto;background-color:white;color:#333;text-align:center;font:90%;cursor:auto;" onload="document.forms[0].userName.focus();">
<%-- When submitting the form, resubmit to this page --%>
<div id="container"><form id="login" style="width:auto;height:auto;text-align:center;" action='<%= request.getRequestURI() %>' method="POST">
<fieldset>
<legend style="text-align:center;border-style:solid;border-color:#333;margin-left:auto;margin-right:auto;">&nbsp;Login&nbsp;|&nbsp;<%= form.date() %>&nbsp;</legend>
		<p style="margin-top:5px;">User name: <font style="text-align:left;" color=red><strong><%= user.getErrorMessage("userName") %></strong></font></p>
		<p style="margin-top:-10px;"><input style="width:auto;height:auto;" type="text" id="userName" name="userName" property="userName" value="<% user.getUserName(); %>"/></p>
		<p style="margin-top:-10px;">Password: <font style="text-align:left;" color=red><strong><%= user.getErrorMessage("password") %></strong></font></p>
		<p style="margin-top:-10px;"><input style="width:auto;height:auto;" type="password" id="password" name="password" property="password" value="<% user.getPassword(); %>"/></p>
        <p style="margin-top:-10px;"><input type="submit" value="Process" /><input type="reset" value="Reset" onclick="document.location = 'login.jsp';"/></p>
    <input type="HIDDEN" name="process" value="true">
    <%-- Save the timestamp in the form --%>
    <input type="HIDDEN" name="timestamp" value="<%= timestamp %>">
    <input type="HIDDEN" name="strResult" property="strResult" value=" "></fieldset>
</form>
</body>
</html>
<%!
    // Define error messages
    java.util.Map errorMap = new java.util.HashMap();
    public void jspInit() {
        errorMap.put(UserData.ERR_USER_NAME, "A user name must be entered.");
        errorMap.put(UserData.ERR_USER_NAME_NOT_FOUND, "The user name was not found.");
        errorMap.put(UserData.ERR_PASSWORD, "A password must be entered.");
        errorMap.put(UserData.ERR_PASSWORD_NOT_FOUND, "The password was not found.");
        errorMap.put(UserData.ERR_PASSWORD_LENGTH, "The password is too long");
        errorMap.put(UserData.ERR_USER_REALNAME_NOT_FOUND, "The user real name was not found.");
    }%>