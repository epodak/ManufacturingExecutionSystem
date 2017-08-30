<%-- Process, Instantiate the form validation bean and supply the error message map --%>
<!-- Property Of:BAF CONSULTING INC.-->
<!-- Author:Bryn Flewelling,Date: -->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
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
//------------------------------DATABASE-CONNECTIONS----------------------------------------------//
	 ArrayList date = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		Connection curr_conn = conn_BAFCONSULTING.current_connection;
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAF BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_4 to BAF BAFCONSULTING succeded.");
			//System.out.println("Adding ArrayList elements...");
		}
	   try{
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
 } catch (Exception e) {
		//System.out.println("Database connection error, please contact your administrator." + e.getMessage());
		String errorMessage = "Database connection error, please contact your administrator.";
		String errorCode = e.getMessage();
	%>
	<script>alert('Database connection error, please contact your administrator.'<%=e.getMessage()%>)</script>			
	<%
	session.setAttribute( "errorMessage", errorMessage );
    session.setAttribute( "errorCode", errorCode );
	//Go to error page
    response.sendRedirect("jsp/timeout.jsp");
}
//--------------------------------FORM-PROCESSING-----------------------------------------------//
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
            while(a != count){
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
    	//if error thrown here, possible long values not supported
		//System.out.println("Something went wrong, please contact your administrator." + e.getMessage());
		String errorCode = "Something went wrong, please contact your administrator.";
		String errorMessage = e.getMessage();
	%>
	<script>alert('Something went wrong, please contact your administrator.'<%=e.getMessage()%>)</script>			
	<%
	session.setAttribute( "errorCode", errorCode );
    session.setAttribute( "errorMessage", errorMessage );
	//Go to error page
    response.sendRedirect("jsp/timeout.jsp");
}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name='author' content='Bryn Flewelling' />
<meta name='copyright' content='BAFCONSULTING ' />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<meta name="ROBOTS" CONTENT="NOINDEX,NOFOLLOW">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>BAFCONSULTING Shift Report</title>
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
	<div id="container" style="">
		<div id="header">
		<h2><img alt="BAFCONSULTING&copy;" src="http://testomni.BAFCONSULTINGmfg.com:8081/is/productionReport/images/logo.png" style="width:18.5px;height:18.5px;">Platform Shift Report</h2>
			<ul>
				<li id="selected"><a href="shiftReport.jsp">Shift</a></li>
				<li><a href="jsp/scrapReport.jsp">Scrap</a></li>
				<li><a href="jsp/manpower.jsp">Manpower</a></li>
				<li><a href="jsp/productionReport.jsp">Summary</a></li>
			</ul>
		</div>
		<%-- When form submits, resubmit to this page --%>
		<form id="inputData" style="" action='<%= request.getRequestURI() %>' method="POST">
<div id="content"  style="width:800px;">
<div style="float:left;">
<p>Date:&nbsp;<%=newdate %></p>
<p>Shift:</p>
</div>
<div style="float:right">
<p>UserName:</p>
<input type="radio" id="mon" name="weekDays" value="Monday" checked="checked" />Mon<input type="radio" id="tue" name="weekDays" value="Tuesday"/>Tue<input type="radio" id="wed" name="weekDays" value="Wensday"/>Wed<input type="radio" id="thu" name="weekDays" value="Thursday"/>Thu<input type="radio" id="fri" name="weekDays" value="Friday"/>Fri<input type="radio" id="sat" name="weekDays" value="Saterday"/>Sat<input type="radio" id="sun" name="weekDays" value="Sunday"/>Sun
</div>
<div >
<%-- errorMessages --%>
<p style="text-align:center;color:red;font-weight:bold;"><%= form.getErrorMessage("generic") %></p>
<table id="dataTable" cellspacing="0" cellpadding="0" border="1" style="text-align:center;width:auto;">
<caption><span class="tableTitle"></span></caption>
<thead>
<%-- ~~titles~~ --%>
<tr>
	<th rowspan="3">Work Area</th> 
	<th rowspan="3">Station</th>  
    <th rowspan="3">Part Number</th>
    <th colspan="5" style="background-color:#E00000;width:30%;">Production</th>
    <th rowspan="3">Downtime Summary</th>
    <th rowspan="3">Safety</th>
    <th rowspan="3">Quality</th>
</tr>
<%-- ~~subtitles~~ --%>
<tr>
    <th colspan="1" style="font-size:80%">PLN</th>
    <th colspan="1" style="font-size:80%">ACT</th>
    <th colspan="1" style="font-size:80%">VAR</th>
    <th colspan="1" style="font-size:80%">D/T<br>Min</th>
    <th colspan="1" style="font-size:80%">O/T<br>Hr</th>
</tr>
</thead>
<tbody>
<%-- ~~dataTable~~ --%>
<%
ShiftReport shiftReport = new ShiftReport();
ArrayList work = shiftReport.populateWorkArea();
ArrayList station = shiftReport.populateStation();
ArrayList partNumber = shiftReport.populatePartNumber();
Iterator it = work.iterator();
Iterator it1 = station.iterator();
Iterator it2 = partNumber.iterator();
String work1 = null;
String station1 = null;
String partNumber1 = null;
//counters
int a = 0;
int b = 3;
int c = 2;
while(it.hasNext() || it1.hasNext()) { 
	a++;
	b++;
	//c++;
	work1 = (String) it.next();
	station1 = (String) it1.next();
	partNumber1 = (String) it2.next();
	
	//while(it2.hasNext()) {
	//if(partNumber1.equals(partNumber)){
	//partNumber1 = (String) it2.next();
//	}
%>
<%-- ~~col-1~~ --%>
<tr align="center">
    <th rowspan="<%=c%>"><p class="sub<%=a%>" style=""><input type="text" id="workArea<%=a%>" name="workArea<%=a%>" readonly="true" property="workArea<%=a%>" value="<%=work1%>"style="width:100%;border-style:none;border-color:white;"/></p></th>
    <td rowspan="<%=c%>"><p class="dataCell"><input type="text" id="station<%=a%>" name="station<%=a%>" readonly="true" property="station<%=a%>" value="<%=station1%>" autofocus="true" style="width:100%;border-style:none;border-color:white;"/></p></td>

    <td ><p class="dataCell"><input type="text" id="partNumber<%=a%>" name="partNumber<%=a%>" readonly="true" property="partNumber<%=a%>" value="<%=partNumber1%>" style="width:100%;border-style:none;border-color:white;"/></p></td>
    <td ><p class="dataCell"><input type="text" id="pln<%=a%>" name="pln<%=a%>" property="pln<%=a%>" value="9999" style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td ><p class="dataCell"><input type="text" id="act<%=a%>" name="act<%=a%>" property="act<%=a%>" value="8888"style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td ><p class="dataCell"><input type="text" id="var<%=a%>" name="var<%=a%>" property="var<%=a%>" value="7777"style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>

    <td rowspan="<%=c%>"><p class="dataCell"><input type="text" id="downtime<%=a%>" name="downtime<%=a%>" property="downtime<%=a%>" value="<% form.getDowntime(); %>"style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td rowspan="<%=c%>"><p class="dataCell"><input type="text" id="overtime<%=a%>" name="overtime<%=a%>" property="overtime<%=a%>" value="<% form.getOvertime(); %>"style="width:100%;border-style:none;border-color:white;" maxlength="4"/></p></td>
    <td rowspan="<%=c%>"><p class="dataCell"><input type="text" id="summary<%=a%>" name="summary<%=a%>" property="summary<%=a%>" value="<% form.getSummary(); %>"style="width:100%;border-style:none;border-color:white;"/></p></td>
    <td rowspan="<%=c%>"><p class="dataCell"><input type="text" id="safety<%=a%>" name="safety<%=a%>" property="safety<%=a%>" value="<% form.getSafety(); %>"style="width:100%;border-style:none;border-color:white;"/></p></td>
	<td rowspan="<%=c%>"><p class="dataCell"><input type="text" id="quality<%=a%>" name="quality<%=a%>" property="quality<%=a%>" value="<% form.getQuality(); %>"style="width:100%;border-style:none;border-color:white;"/></p></td>
</tr>
<% //} %>
<%-- ~~split rows~~ --%>

<%
//while(it2.hasNext()) { 
	//partNumber1 = (String) it2.next();

%>
<%-- ~~col-2~~ --%>
<%-- ~~row1~~ --%>
<tr>
    <td rowspan="1" nowrap ><p class="dataCell"><input type="text" id="partNumber<%=a%>" name="partNumber<%=a%>" property="partNumber<%=a%>" readonly="true" value="<%=partNumber1%>" style="width:100%;border-color:white;border-style:none;"/></p></td>
    <td rowspan="1" nowrap ><p class="dataCell"><input type="text" id="pln<%=a%>" name="pln<%=a%>" property="pln<%=a%>" value="6666" style="width:100%;border-color:white;border-style:none;" maxlength="4"/></p></td>
    <td rowspan="1" nowrap ><p class="dataCell"><input type="text" id="act<%=a%>" name="act<%=a%>" property="act<%=a%>" value="5555" style="width:100%;border-color:white;border-style:none;" maxlength="4"/></p></td>
    <td rowspan="1" nowrap ><p class="dataCell"><input type="text" id="var<%=a%>" name="var<%=a%>" property="var<%=a%>" value="4444" style="width:100%;border-color:white;border-style:none;" maxlength="4"/></p></td>
</tr>
<% //} %>
<% } %>
</tbody>
</table>
</div>
<p style=""><input id=button" type="submit" value="Process" /><input id=button" type="reset" value="Reset" onclick="document.location = 'shiftReport.jsp';"  /></p>
</div>
			<div id="footer">
			    <input type="HIDDEN" name="process" value="true">
			    <%-- Save the timestamp in the form --%>
			    <input type="HIDDEN" name="timestamp" value="<%= timestamp %>">
			    <input type="HIDDEN" name="counter" value=<%=b%>>
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