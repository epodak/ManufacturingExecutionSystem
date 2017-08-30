<%-- Process, Instantiate the form validation bean and supply the error message map --%>
<!-- Property Of:BAF CONSULTING INC.-->
<!-- Author:Bryn Flewelling,Date:2011.2.08 -->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html"%>
<%@ page import="java.util.*" %>
<%@ page import="productionReport.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="form" class="productionReport.ShiftReport" scope="request"><jsp:setProperty name="form" property="errorMessages" value='<%= errorMap %>'/></jsp:useBean>
<%
	//dateFormat
	SimpleDateFormat dateformat = new SimpleDateFormat("EEEE, MMMM, dd, yyyy - hh:mm aaa");
	Date newDate = new Date();
	String newdate = dateformat.format(newDate);
	
    // If process is true and a timestamp is present, attempt to validate and process the form
    String timestamp = request.getParameter("timestamp");
    try{
		if ("true".equals(request.getParameter("process")) && timestamp != null) {
      	  	// Check timestamp
		if (!timestamp.equals(session.getAttribute("productionReport.ShiftReport.timestamp"))) {
            response.sendRedirect("jsp/timeout.jsp");
            return;
        }%>
        <jsp:setProperty name="form" property="*" />
		<%
		if (form.process()) {
            // Save a new timestamp in the session
            timestamp = ""+System.currentTimeMillis();
            session.setAttribute("productionReport.ShiftReport.timestamp", timestamp);
            // Go to completion page
            response.sendRedirect("shiftReport.jsp");
            return;
        }
    } else {
        timestamp = ""+System.currentTimeMillis();
        session.setAttribute("productionReport.ShiftReport.timestamp", timestamp);
   	 }
    } catch (Exception e) {
		System.out.println("Error, please contact your administrator. Long values not supported." + e.getMessage());%>
	<script>alert('Error, please contact your administrator. Long values not supported.')</script>	
<%}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name='author' content='Bryn Flewelling' />
<meta name='copyright' content=' BAF CONSULTING' />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<meta name="ROBOTS" CONTENT="NOINDEX,NOFOLLOW">
<link rel="icon" media="all" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" media="all" href="/images/favicon.ico" type="image/x-icon"> 
<title>BAFCONSULTING Manpower Report</title>
<style type="text/css" media="all">
	body {
		font-family:"Lucida Grande", "Lucida Sans Unicode", Verdana, Arial, Helvetica, sans-serif;
		font-size:12px;
		margin: 0; 
 		padding: 0; 
 		text-align: center; 
	}
    #header ul {
		list-style: none;
		padding: 0;
		margin: 0;
    }
	#header li {
		float: left;
		border: 1px solid #bbb;
		border-bottom-width: 0;
		margin: 0;
    }
	#header a {
	margin: 0 auto;  
 		text-align: left;

		text-decoration: none;
		display: block;
		background: #eee;
		padding: 0.24em 1em;
		color: #00c;
		width: 8em;
		text-align: center;
    }
	#header a:hover {
		background: #ddf;
	}
	#header #selected {
		border-color: black;
	}
	#header #selected a {
		position: relative;
		top: 1px;
		background: white;
		color: black;
		font-weight: bold;
	}
	#container{
		margin: 0px auto;  
 		text-align: left;
		width:800px;
		display:table; 
	}
	#content {
		margin: 0 auto;  
 		text-align: left;
		width:800px;
		border: 1px solid black;
		clear: both;
		padding: 0 1em;
	}
	h1 {
		margin: 0;
		padding: 0 0 1em 0;
	}
	input {
		text-align:center;
	}
	input:hover {

	}
	table{
		border-collapse:separate;
		border-style:none;
		empty-cells:hide;
	}
		/* ----------- stylized ----------- */
	#stylized{
	border:solid 2px #b7ddf2;
	background:#ebf4fb;
	}
	#stylized h1 h2{
	font-size:14px;
	font-weight:bold;
	margin-bottom:8px;
	}
	#stylized p{
	font-size:15px;
	color:#666666;
	margin-bottom:20px;
	border-bottom:solid 1px #b7ddf2;
	padding-bottom:10px;
	}
	</style>
</head>
<body style="background-color:white;color:#333;cursor:auto;" onload="document.forms[0].eStop.focus();">
	<%-- When form submits, resubmit to this page --%>
	<div id="container" style="">
		<form id="inputData" style="" action='<%= request.getRequestURI() %>' method="POST">
<div id="header">
<h2><img alt="BAFCONSULTING&copy;" src="/images/logo.png" style="width:18.5px;height:18.5px;">Manpower Report</h2>
<ul>
	<li><a href="../shiftReport.jsp">Shift</a></li>
	<li><a href="scrapReport.jsp">Scrap</a></li>
	<li id="selected"><a href="manpower.jsp">Manpower</a></li>
	<li><a href="productionReport.jsp">Summary</a></li>
</ul>
</div>
<div id="content" style="width:800px;">
<div style="float:left;">
<p>Date:<%=newdate%></p>
<p>Week Starting:</p>
</div>
<div style="float:right">
<p>UserName:</p>
</div>
<div>
<table id="dataTable" cellspacing="0" cellpadding="0" border="1" width="800px" style="text-align:center;">
<caption><span class="tableTitle"></span></caption>
<thead>
<%-- ~~titles~~ --%>
<tr>
	<th colspan="1" style="width:10%;"></th>
    <th colspan="1" style="width:10%;">Line</th>
    <th colspan="1" style="width:20%;">Associate Name</th>
    <th colspan="1" style="width:10%;">Reason</th>
    <th colspan="1" style="width:40%;">Comments</th>
</tr>
<%-- ~~subtitles~~ --%>

</thead>
<tbody>
<%-- ~~tableData~~ --%>

<tr>
    <th rowspan="10"><p class="sub0" style="font-size:80%;">Manpower<br>Vacations<br>Call-ins</p></th>
    <%
int b=0;
int c=0;
while(b!=10){
	b++;
	c++;
%>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;"/></p></td>
    <td><p class="dataCell" ><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;"/></p></td>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;"/></p></td>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;"/></p></td>
</tr>
<% } %>
</tbody>
</table>
</div>
<p style=""><input type="submit" value="Process" /><input type="reset" value="Reset" onclick="document.location = 'manpower.jsp';"  /></p>
</div>
			<div id="footer">
			    <input type="HIDDEN" name="process" value="true">
			    <%-- Save the timestamp in the form --%>
			    <input type="HIDDEN" name="timestamp" value="<%= timestamp %>">
			</div>
	</form>
</div>
</body>
<head>
<meta HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
</head>
</html>
<%!
    // Define error messages
    java.util.Map errorMap = new java.util.HashMap();
    public void jspInit() {
    	 errorMap.put(ShiftReport.ERR_STATION, "Line must be entered.");
    	 errorMap.put(ShiftReport.ERR_WORKAREA, "Work area must be entered.");
    	 errorMap.put(ShiftReport.ERR_PARTNUMBER, "Code must be entered.");
    	 errorMap.put(ShiftReport.ERR_PLN, "PLN must be entered.");
    	 errorMap.put(ShiftReport.ERR_ACT, "ACT must be entered.");
    	 errorMap.put(ShiftReport.ERR_VAR, "VAR must be entered.");
    	 errorMap.put(ShiftReport.ERR_DOWNTIME, "Downtime must be entered.");
    	 errorMap.put(ShiftReport.ERR_OVERTIME, "Overtime must be entered.");
    	 errorMap.put(ShiftReport.ERR_SUMMARY, "Summary must be entered.");
    	 errorMap.put(ShiftReport.ERR_SAFETY, "Safety must be entered.");
    	 errorMap.put(ShiftReport.ERR_QUALITY, "Quality must be entered.");
    }%>