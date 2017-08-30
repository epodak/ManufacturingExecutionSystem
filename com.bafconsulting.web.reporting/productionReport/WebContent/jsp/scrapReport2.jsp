<%-- Process, Instantiate the form validation bean and supply the error message map --%>
<!-- Property Of:BAFCONSULTING.-->
<!-- Author:Bryn Flewelling,Date: -->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.Date" %>
<%@ page import="productionReport.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="jdbc_connect.conn" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Set;"%>
<jsp:useBean id="form" class="productionReport.ScrapReport" scope="request"><jsp:setProperty name="form" property="errorMessages" value='<%= errorMap %>'/></jsp:useBean>
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
	if (!timestamp.equals(session.getAttribute("productionReport.ScrapReport.timestamp"))) {
       response.sendRedirect("jsp/timeout.jsp");
       return;
   }%>
   <jsp:setProperty name="form" property="*" />
	<%
	if (form.process()) {
       // Save a new timestamp in the session
       timestamp = ""+System.currentTimeMillis();
       session.setAttribute("productionReport.ScrapReport.timestamp", timestamp);          
       
       // Go to completion page
       response.sendRedirect("shiftReport.jsp");
       return;
   }
} else {
   timestamp = ""+System.currentTimeMillis();
   session.setAttribute("productionReport.ScrapReport.timestamp", timestamp);
	 }
} catch (Exception e) {
	System.out.println("Error, please contact your administrator. Long values not supported." + e.getMessage());%>
<script>alert('Error, please contact your administrator.')</script>	
<%}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name='author' content='Bryn Flewelling' />
<meta name='copyright' content='BAFCONSULTING' />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<meta name="ROBOTS" CONTENT="NOINDEX,NOFOLLOW">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>BAFCONSULTING Scrap Report</title>
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
	}
	#content {
		margin: 0 auto;  
 		text-align: left;
		width:800px;
		border: 1px solid black;
		clear: both;
		padding: 0 1em;
	}
	p, h1, form, button{border:0; margin:0; padding:0;}
	.spacer{clear:both; height:1px;}
	/* ----------- My Form ----------- */
	.myform{
	margin:0 auto;
	width:800px;
	padding:14px;
	}
	/* ----------- stylized ----------- */
	#stylized{
	border:solid 2px #b7ddf2;
	background:#ebf4fb;
	}
	#stylized h1 {
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
	#stylized label{
	display:block;
	font-weight:bold;
	text-align:right;
	width:140px;
	float:left;
	}
	#stylized .small{
	color:#666666;
	display:block;
	font-size:12px;
	font-weight:normal;
	text-align:right;
	width:140px;
	}
	#stylized input{
	float:left;
	font-size:15px;
	padding:4px 2px;
	border:solid 1px #aacfe4;
	width:200px;
	margin:2px 0 20px 10px;
	}
	#stylized select{
	float:left;
	font-size:15px;
	padding:4px 2px;
	border:solid 1px #aacfe4;
	width:200px;
	margin:2px 0 10px 10px;
	}
	#submit{
	clear:both;
	margin-left:150px;
	width:125px;
	height:31px;
	background:#666666 url(img/button.png) no-repeat;
	text-align:center;
	line-height:31px;
	color:#FFFFFF;
	font-size:11px;
	font-weight:bold;
	}
	#reset{
	clear:both;
	margin-left:230px;
	width:125px;
	height:31px;
	background:#666666 url(img/button.png) no-repeat;
	text-align:center;
	line-height:31px;
	color:#FFFFFF;
	font-size:11px;
	font-weight:bold;
	}
	</style>
</head>
<body style="background-color:white;color:#333;cursor:auto;" onload="">
	<%-- When form submits, resubmit to this page --%>
	<div id="container" style="">
		
<div id="header">
<h2><img alt="BAFCONSULTING&copy;" src="" style="width:18.5px;height:18.5px;">Scrap Report</h2>
<ul>
	<li><a href="../shiftReport.jsp">Shift</a></li>
	<li id="selected"><a href="scrapReport.jsp">Scrap</a></li>
	<li><a href="manpower.jsp">Manpower</a></li>
	<li><a href="productionReport.jsp">Summary</a></li>
</ul>
</div>
<div id="content"  style="width:800px;">
<div id="stylized" class="myform">
<form id="form" name="form" action='<%= request.getRequestURI() %>' method="POST">
<h1>Scrap Entry</h1>
<!-- ~~~~~HEADER~~~~~ -->
<p>User Name:<% %></p>
<p>Platform:</p>
<!-- ~~~~~lineId~~~~~ -->
<label><strong style="color:red;">*</strong>Line Id
<span class="small" style="color:red;"><%= form.getErrorMessage("lineId") %></span>
</label>
<select style="" name="lineId" id="lineId"  property="lineId" param="lineId">
	<option  name="lineId" id="lineId" property="lineId" param="lineId" value="test">test</option>
</select>
<!-- ~~~~~costCenter~~~~~ -->
<label>Cost Center
<span class="small" style="color:red;"><%= form.getErrorMessage("costCenter") %></span>
</label>
<input type="text" name="costCenter" id="costCenter" />
<!-- ~~~~~platform~~~~~ -->
<label>Platform
<span class="small" style="color:red;"><%= form.getErrorMessage("platform") %></span>
</label>
<input type="text" name="platform" id="platform" />
<!-- ~~~~~partNumber~~~~~ -->
<label><strong style="color:red;">*</strong>Part Number
<span class="small" style="color:red;"><%= form.getErrorMessage("partNumber") %></span>
</label>
<input type="text" name="partNumber" id="partNumber" />
<!-- ~~~~~revision~~~~~ -->
<label>Revision
<span class="small" style="color:red;"><%= form.getErrorMessage("revision") %></span>
</label>
<input type="text" name="revision" id="revision" />
<!-- ~~~~~partDescription~~~~~ -->
<label>Part Description
<span class="small" style="color:red;"><%= form.getErrorMessage("partDescription") %></span>
</label>
<input type="text" name="partDescription" id="partDescription" />
<!-- ~~~~~cost~~~~~ -->
<label>Cost
<span class="small" style="color:red;"><%= form.getErrorMessage("cost") %></span>
</label>
<input type="text" name="cost" id="cost" />
<!-- ~~~~~commonCode~~~~~ -->
<label><strong style="color:red;">*</strong>Common Code
<span class="small" style="color:red;"><%= form.getErrorMessage("commonCode") %></span>
</label>
<input type="text" name="commonCode" id="commonCode" />
<!-- ~~~~~uniqueCode~~~~~ -->
<label>Unique Code
<span class="small" style="color:red;"><%= form.getErrorMessage("uniqueCode") %></span>
</label>
<select style="" name="lineId" id="lineId"  property="lineId" param="lineId">
	<option  name="lineId" id="lineId" property="lineId" param="lineId" value="test">test</option>
</select>
<!-- ~~~~~quantity~~~~~ -->
<label><strong style="color:red;">*</strong>Quantity
<span class="small" style="color:red;"><%= form.getErrorMessage("quantity") %></span>
</label>
<input type="text" name="quantity" id="quantity" />
<!-- ~~~~~comments~~~~~ -->
<label>Comments
<span class="small" style="color:red;"><%= form.getErrorMessage("comments") %></span>
</label>
<input type="text" name="comments" id="comments" />
<!-- ~~~~~batchDate~~~~~ -->
<label>Batch Date
<span class="small" style="color:red;"><%= form.getErrorMessage("batchDate") %></span>
</label>
<input type="text" name="batchDate" id="batchDate" />
<!-- ~~~~~backFlush~~~~~ -->
<label>Back Flush
<span class="small" style="color:red;"><%= form.getErrorMessage("backFlush") %></span>
</label>
<select style="" name="lineId" id="lineId"  property="lineId" param="lineId">
	<option  name="lineId" id="lineId" property="lineId" param="lineId" value="test">test</option>
</select>
<!-- ~~~~~chargebackCode~~~~~ -->
<label>Chargeback Code
<span class="small" style="color:red;"><%= form.getErrorMessage("chargebackCode") %></span>
</label>
<input type="text" name="chargebackCode" id="chargebackCode" />
<!-- ~~~~~scrapCode~~~~~ -->
<label>Scrap Code
<span class="small" style="color:red;"><%= form.getErrorMessage("scrapCode") %></span>
</label>
<select style="" name="lineId" id="lineId"  property="lineId" param="lineId">
	<option  name="lineId" id="lineId" property="lineId" param="lineId" value="test">test</option>
</select>
<button type="submit" id="submit" name="submit" value="Process" style="">Add Record</button><button type="reset" id="reset" name="reset" onclick="document.location = 'scrapReport.jsp';" style="">Reset</button>
<div class="spacer"></div>
			<div id="footer">
			    <input type="HIDDEN" name="process" value="true">
			    <%-- Save the timestamp in the form --%>
			    <input type="HIDDEN" name="timestamp" value="<%= timestamp %>">
			</div>
	</form>
</div>
<p style="float:left;"><a href="http://www.helpdesk.com">Help Desk</a></p><p style="float:right;"><%=newdate%></p>
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
     	 errorMap.put(ScrapReport.ERR_LINEID, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_COSTCENTER, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_PLATFORM, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_PARTNUMBER, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_REVISION, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_DESCRIPTION, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_COST, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_COMMONCODE, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_UNIQUECODE, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_QUANTITY, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_COMMENTS, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_BATCHDATE, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_BACKFLUSH, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_CHANGEBACKCODE, "must be entered.");
    	 errorMap.put(ScrapReport.ERR_SCRAPCODE, "must be entered.");
    }%>