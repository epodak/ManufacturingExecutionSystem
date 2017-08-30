<%-- Process, Instantiate the form validation bean and supply the error message map --%>
<!-- Property Of:BAFCONSULTING.-->
<!-- Author:Bryn Flewelling,Date: -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html"%>
<%@ page import="e_stop.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="user" class="e_stop.UserData" scope="session"></jsp:useBean>
<jsp:useBean id="form" class="e_stop.MyForm" scope="request"><jsp:setProperty name="form" property="errorMessages" value='<%= errorMap %>'></jsp:setProperty><jsp:setProperty property="realName" name="form" value='<%= user.getUserName() %>' ></jsp:setProperty></jsp:useBean>
<%
    // Ask the browser not to cache the page
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache");

    if(user.getStrResult() == ""){
    	response.sendRedirect("formAlreadyDone.jsp");
    }
    // If process is true and a timestamp is present, attempt to validate and process the form
    String timestamp = request.getParameter("timestamp");
    try{
		if ("true".equals(request.getParameter("process")) && timestamp != null) {
      	  	// Check timestamp
		if (!timestamp.equals(session.getAttribute("e_stop.MyForm.timestamp"))) {
            response.sendRedirect("formAlreadyDone.jsp");
            return;
        }%>
        <jsp:setProperty name="form" property="*" />
		<%
		if (form.process()) {
            // Save a new timestamp in the session
            timestamp = ""+System.currentTimeMillis();
            session.setAttribute("e_stop.MyForm.timestamp", timestamp);
            // Go to completion page
            response.sendRedirect("formComplete.jsp");
            return;
        }
    } else {
        timestamp = ""+System.currentTimeMillis();
        session.setAttribute("e_stop.MyForm.timestamp", timestamp);
   	 }
    } catch (Exception e) {
		System.out.println("Error, please contact your administrator. Long values not supported." + e.getMessage());%>
	<script>alert('Error, please contact your administrator. Long values not supported.')</script>	
<%}%>
<html>
<head>
<script type="text/javascript">
//auto select from selectbox
function populateField(frm){
 var test = frm.stop.value;
 frm.eStop.value = test;
}
//On scrolling of DIV tag.
function OnDivScroll()
{
    var lstCollegeNames = document.getElementById("lstCollegeNames");

    if (lstCollegeNames.options.length > 8)
    {
        lstCollegeNames.size=lstCollegeNames.options.length;
    }
    else
    {
        lstCollegeNames.size=8;
    }
}
//On focus of Selectbox
function OnSelectFocus()
{
    if (document.getElementById("divCollegeNames").scrollLeft != 0)
    {
        document.getElementById("divCollegeNames").scrollLeft = 0;
    }
    var lstCollegeNames = document.getElementById('lstCollegeNames');
    if( lstCollegeNames.options.length > 8)
    {
        lstCollegeNames.focus();
        lstCollegeNames.size=8;
    }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>E-Stop Scanner</title>
</head>
<body style="width:auto;height:auto;background-color:white;color:#333;font-size:80%;cursor:auto;" onload="document.forms[0].eStop.focus();">
<%-- When form submits, resubmit to this page --%>
<div id="container"><form id="inputData" style="width:auto;height:auto;" action='<%= request.getRequestURI() %>' method="POST">
 <p style="text-align:center;border-color:#333;font-size:xx-small;">E-Stop&nbsp;|&nbsp;<jsp:getProperty property="strResult" name="user"/>&nbsp;|&nbsp;<%= form.date() %></p>
    <div id="content" style="width:auto;height:auto;text-align:center;margin-left:auto;margin-right:auto;">
<div id="left" style="width: 85px; height:150px; float: left;">
   		 <%-- eStop input--%>
   		<p style="text-align:center;"><font color=red><strong><%= form.getErrorMessage("eStop") %></strong></font></p>
		<p style="text-align:left"><input type="text" id="eStop" name="eStop" property="eStop" size="10" value='<%= form.geteStop() %>' style="overflow:hidden;maxheight:10px;"/>
	<%-- check values --%>
	<p style="text-align:center;">Yes<input type="radio" name="check" value="true"<jsp:getProperty name="form" property="check" />/>No<input type="radio" checked="true" name="check" value="false" <jsp:getProperty name="form" property="check" />/></p>
	      <%-- submit and reset--%>
      <%if(user.getStrResult() == ""){
%><p><font color=red>You must be logged in to use this page.</font></p><%
 }%>
<p style="text-align:center;"><input type="submit" value="Process" /><input type="reset" value="Reset" onclick="document.location = 'process.jsp';"/> 
<%if(user.getStrResult() == ""){
%><input type="button" value="Log-in" onclick="document.location = 'login.jsp';"/></p>
<%}%>
	</div>
	<%-- eStop unchecked values --%>
<div id="right" style="width: 80px; height: 150px; float: left;">
	<div id='divCollegeNames' 
  style="OVERFLOW: auto;WIDTH: 120px;HEIGHT: 150px" 
  onscroll="OnDivScroll();" >
	<p><select style="width:100px;text-align:center;cursor:auto;font-size:5px;" onClick="populateField(this.form)" name="stop" id="stop"  property="stop" param="stop" size="72">

			<%
				MyForm formData = new MyForm();
				ArrayList e_Stop = formData.populateText();
				Iterator it = e_Stop.iterator();
				String xx = null;
				while(it.hasNext()) { 
				 xx = (String) it.next();
			%>
			<option  name="stop" id="stop" property="stop" param="stop" value="<%=xx%>"><%=xx%></option>
			<% } %>
			</select></p></div>
			<div id="footer">
			<%-- check errorMessages --%>
			<p><font style="" color=red><strong><%= form.getErrorMessage("check") %></strong></font></p></div>
</div>
	<div id="foot">	
    <input type="HIDDEN" name="process" value="true">
    <%-- Save the timestamp in the form --%>
    <input type="HIDDEN" name="timestamp" value="<%= timestamp %>"></div>
</form></div>
</body>
</html>
<%!
    // Define error messages
    java.util.Map errorMap = new java.util.HashMap();
    public void jspInit() {
        errorMap.put(MyForm.ERR_SWIPE_CARD, "A e-stop value must be entered.");
        errorMap.put(MyForm.ERR_E_STOP_NOT_FOUND, "A valid e-stop value was not found.");
        errorMap.put(MyForm.ERR_CHECK, "Something went wrong with the radio buttons. Please try again.");
        errorMap.put(MyForm.ERR_REAL_NAME, "Could not find the users real name, try logging back in.");
    }%>