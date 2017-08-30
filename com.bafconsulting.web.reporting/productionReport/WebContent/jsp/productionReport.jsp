<%-- Process, Instantiate the form validation bean and supply the error message map --%>
<!-- Property Of:BAFCONSULTING-->
<!-- Author:Bryn Flewelling,Date:2011.2.08 -->
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
<jsp:useBean id="form" class="productionReport.ShiftReport" scope="request"><jsp:setProperty name="form" property="errorMessages" value='<%= errorMap %>'/></jsp:useBean>
<%
//-------------------------------------CONFIG----------------------------------------------------//
	String jdbc_connection = "BAF_demo_BF";
	conn conn_BAFCONSULTING = null;
	//dateFormat
	SimpleDateFormat dateformat = new SimpleDateFormat("EEEE, MMMM, dd, yyyy - hh:mm aaa");
	Date newDate = new Date();
	String newdate = dateformat.format(newDate);
	
	// If process is true and a timestamp is present, attempt to validate and process the form
	String timestamp = request.getParameter("timestamp");

//------------------------------DATABASE CONNECTIONS----------------------------------------------//
	ArrayList date = new ArrayList();
	boolean bln_result = true;
	conn_BAFCONSULTING = new conn();
	bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
	Connection curr_conn = conn_BAFCONSULTING.current_connection;
	//ArrayList date = new ArrayList();
	if (bln_result == false) {
		System.out.println("Connection_3 to BAF BAFCONSULTING schema failed. "+ new java.util.Date());
		%><script>alert('Error, please contact your administrator. Unable to connect to database.')</script><%
	} else {
		System.out.println("Connection_4 to BAF BAFCONSULTING succeded.");
		System.out.println("Adding ArrayList elements...");
	}
	//try{
		//select * from BAFCONSULTING.part_number
		//WHERE OBSOLETE = 0
		//String sql = "select * from BAFCONSULTING.part_number WHERE OBSOLETE = 0";
		//ResultSet rs = null;
		//rs = curr_conn.createStatement().executeQuery(sql);

		String sql = "SELECT A.PROD_WORKAREA, A.STATION , A.PART_NUMBER , A.REVISION , A.ERP_DESCRIPTION FROM BAFCONSULTING.PRODUCTION_REPORTS A";
		ResultSet rs = null;
		rs = curr_conn.createStatement().executeQuery(sql);
		
		//String sql1 = "SELECT A.STATION FROM BAFCONSULTING.PRODUCTION_REPORTS A";
		//ResultSet rs1 = null;
		//rs1 = curr_conn.createStatement().executeQuery(sql1);
		
		//String sql2 = "SELECT A.PART_NUMBER FROM BAFCONSULTING.PRODUCTION_REPORTS A";
		//ResultSet rs2 = null;
		//rs2 = curr_conn.createStatement().executeQuery(sql2);

		//String sql3 = "SELECT A.PART_NUMBER FROM BAFCONSULTING.PRODUCTION_REPORTS A";
		//ResultSet rs3 = null;
		//rs3 = curr_conn.createStatement().executeQuery(sql3);
		
		//rs = curr_conn.createStatement().executeQuery(sql);
		//String query = "begin ? := BAFCONSULTING.pkg_ts_estop.ts_estop_log_due(?); end;";
		//Connection curr_conn = conn_BAFCONSULTING.current_connection;
		//CallableStatement stmt = curr_conn.prepareCall(query);
		//String dateString = "03/23/2011";
		//register the type of the out param - an Oracle specific type
		//stmt.registerOutParameter(1, OracleTypes.CURSOR);
		//set the in param 'MM/DD/YYYY'
		//stmt.setString(2, dateString);
		//execute and retrieve the result set
		//stmt.execute();
		//ResultSet rs = (ResultSet)stmt.getObject(1);
	//}catch(Exception ex){
		
	//}

//--------------------------------FORM PROCESSING-----------------------------------------------//
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
       
       //set all variables 
       String counter = request.getParameter( "counter" );
       session.setAttribute( "counter", counter ); 
       int count = Integer.parseInt(counter.trim());
       int a = 0;
       while(a <= count){
       	a++;
       String mon = request.getParameter( "mon" );
       session.setAttribute( "mon", mon );
       
       String tue = request.getParameter( "tue" );
       session.setAttribute( "tue", tue );
		
       String wed = request.getParameter( "wed" );
       session.setAttribute( "wed", wed );
       
       String thu = request.getParameter( "thu" );
       session.setAttribute( "thu", thu );
       
       String fri = request.getParameter( "fri" );
       session.setAttribute( "fri", fri );
       
       String sat = request.getParameter( "sat" );
       session.setAttribute( "sat", sat );
       
       String sun = request.getParameter( "sun" );
       session.setAttribute( "sun", sun );
       
       String station = request.getParameter( "station" );
       session.setAttribute( "station", station );
       
       String workArea = request.getParameter( "workArea" );
       session.setAttribute( "workArea", workArea );
       
       String partNumber = request.getParameter( "partNumber" );
       session.setAttribute( "partNumber", partNumber );
       
       String pln = request.getParameter( "pln" );
       session.setAttribute( "pln", pln );
       
       String act = request.getParameter( "act" );
       session.setAttribute( "act", act );
		
       String var = request.getParameter( "var" );
       session.setAttribute( "var", var );
       
       String downtime = request.getParameter( "downtime" );
       session.setAttribute( "downtime", downtime );
       
       String overtime = request.getParameter( "overtime" );
       session.setAttribute( "overtime", overtime );
       
       String summary = request.getParameter( "summary" );
       session.setAttribute( "summary", summary );  
       }
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
<link rel="icon" media="all" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" media="all" href="favicon.ico" type="image/x-icon"> 
<title>BAFCONSULTING Combined Weekly Summary</title>
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
<body style="background-color:white;color:#333;cursor:auto;" onload="">
	<%-- When form submits, resubmit to this page --%>
	<div id="container" style="">
		<form id="inputData" style="" action='<%= request.getRequestURI() %>' method="POST">
<div id="header">
<h2><img alt="BAFCONSULTING&copy;" src="images/logo.png" style="width:18.5px;height:18.5px;">Combined Shift Weekly Summary</h2>

<ul>
	<li><a href="../shiftReport.jsp">Shift</a></li>
	<li><a href="scrapReport.jsp">Scrap</a></li>
	<li><a href="manpower.jsp">Manpower</a></li>
	<li id="selected"><a href="productionReport.jsp">Summary</a></li>
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
<div >
<%-- errorMessages --%>
<p style="text-align:center;color:red;font-weight:bold;"><%= form.getErrorMessage("generic") %></p>
<table id="dataTable" cellspacing="0" cellpadding="0" border="1" width="800px" style="text-align:center;">
<caption><span class="tableTitle"></span></caption>
<thead>
<%-- ~~titles~~ --%>
<tr>
    <th colspan="3" style="background-color:#E00000;width:30%;">Production</th>
    <th colspan="2" style="">MON</th>
    <th colspan="2" style="">TUE</th>
    <th colspan="2" style="">WED</th>
    <th colspan="2" style="">THU</th>
    <th colspan="2" style="">FRI</th>
    <th colspan="2" style="">SAT</th>
    <th colspan="2" style="">SUN</th>
    <th colspan="3" style="">WEEK</th>
    <th colspan="2" style=""></th>
       
</tr>
<%-- ~~subtitles~~ --%>
<tr>
	<th colspan="1" style="">Work Area</th>
    <th colspan="1" style="">Station</th>
    <th colspan="1" style="">Part Number</th>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
  	<th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">VAR</th>
    <th colspan="1" style="font-size:80%">QOEE</th>
    <th colspan="1" style="font-size:80%">OT(HRS)</th>
</tr>
</thead>
<tbody>
<%-- ~~tableData~~ --%>
<%
int b=0;
int c=0;
while(rs.next()){
	b++;
	c++;
%>
<tr>
    <th rowspan="1.5"><p class="sub0" style=""><input type="text" id="workArea" name="workArea" property="workArea" value="<%=rs.getString(1) %>" autofocus="true" readonly="true" style="width:100%;border-style:none;border-color:white;"/></p></th>
    <td><p class="dataCell"><input type="text" id="station" name="station" property="station" value="<%=rs.getString(2) %>" readonly="true" style="width:100%;border-style:none;border-color:white;"/></p></td>
    <td><p class="dataCell"><input type="text" id="partNumber" name="partNumber" property="partNumber" value="<%=rs.getString(3) %>"  style="width:100%;border-style:none;border-color:white;"/></p></td>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;"/></p></td>
	<td><p class="dataCell"><input type="text" id="workArea" name="workArea" property="workArea" value="" style="width:100%;border-style:none;border-color:white;"/></p></td>
</tr>
<% } %>
</tbody>
</table>
</div>
<p style=""><input type="submit" value="Process" /><input type="reset" value="Reset" onclick="document.location = 'productionReport.jsp';"  /></p>
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