<%-- Process, Instantiate the form validation bean and supply the error message map --%>
<!-- Property Of:BAFCONSULTING-->
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
//---------------------------------------set-up--------------------------------------------------//
	String jdbc_connection = "BAF_demo_fp";
	String platform1;
	String lineId1;
	String s;
	conn conn_BAFCONSULTING = null;
	//dateFormat
	SimpleDateFormat dateformat = new SimpleDateFormat("EEEE, MMMM, dd, yyyy - hh:mm aaa");
	Date newDate = new Date();
	String newdate = dateformat.format(newDate);
	
	// If process is true and a timestamp is present, attempt to validate and process the form
	String timestamp = request.getParameter("timestamp");
	if (request.getParameter("lineId")==null) {
		System.out.println("lineID is null" + form.getLineId());
		
	} else {
		form.setWorkArea(request.getParameter("lineId").toString());
		System.out.println("lineID is not null" + form.getLineId());
		session.setAttribute( "lineID", request.getParameter("lineId").toString());
	}
	if (request.getParameter("platform")==null) {
		System.out.println("platform is null" + form.getPlatform());
	} else {	
	     System.out.println("PlatformGood: " + request.getParameter("platform").toString());
		 %>
		 <jsp:setProperty name="form" property="platform" value='<%= request.getParameter("platform").toString() %>'/>
		 <%
		 platform1 = request.getParameter("platform");
		 System.out.println("platform1:" + platform1);
		 String platform2=(String)session.getAttribute("platform");
		 session.setAttribute( "platform", request.getParameter("platform").toString());
		 form.setPlatform(platform1);
		 System.out.println("platform is not null" + platform1);
	}
//------------------------------DATABASE-CONNECTION----------------------------------------------//
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
   response.sendRedirect("timeout.jsp");
}
//--------------------------------Process----------------------------------------------------------------//	
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
       System.out.println("PlatformGood1: " + request.getParameter("platform").toString());
       // Go to completion page

       response.sendRedirect("scrapReport.jsp");

       return;
   }
} else {
   timestamp = ""+System.currentTimeMillis();
   session.setAttribute("productionReport.ScrapReport.timestamp", timestamp);
	 }
} catch (Exception e) {
	//possible Long values not supported.
	System.out.println("Error, please contact your administrator." + e.getMessage());%>
<script>alert('Error, please contact your administrator.')</script>	
<%}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name='author' content='Bryn Flewelling' />
<meta name='copyright' content='2011 - BAFCONSULTING MFG' />
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
	/* ----------- stylized components ----------- */
	#stylized{
		/*border:solid 2px #b7ddf2;
		background:#ebf4fb;*/
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

	#replacement-1 {
	  width: 48px;
	  height: 48px;
	  padding: 55px 0 0;
	  margin: 0;
	  border: 0;
	  background: transparent url(Icon.png) no-repeat center top;
	  overflow: hidden;
	  cursor: pointer; /* hand-shaped cursor */
	  cursor: hand; /* for IE 5.x */
	}
	form>#replacement-1 { /* For non-IE browsers*/
	  height: 0px;
	}
	#replacement-2 {
	  width: 48px;
	  height: 48px;
	  padding: 55px 0 0;
	  margin: 0;
	  border: 0;
	  background: transparent url(http://testomni.BAFCONSULTINGmfg.com:8081/is/productionReport/images/XIcon.png) no-repeat center top;
	  overflow: hidden;
	  cursor: pointer; /* hand-shaped cursor */
	  cursor: hand; /* for IE 5.x */
	}
	form>#replacement-2 { /* For non-IE browsers*/
	  height: 0px;
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
<form id="form" name="form" action='<%= request.getRequestURI() %>' method="POST">
<div >
<div id="stylized" class="myform">
<%ScrapReport scrapReport = new ScrapReport();%>
<p style="float:left;">Date:<%=newdate %></p><p style="float:right;">User:</p>
<input type="text" name="revision" id="revision" readonly="readonly" maxlength="6" style="cursor:none;background-color:#F8F8F8;" value="<%=session.getAttribute("platform")%>"/><p>TEST:</p>
<!-- ~~~~~platform~~~~~ -->
<label><strong style="color:red;">*</strong>Platform
<span class="small" style="color:red;"><%= form.getErrorMessage("platform") %></span>
</label>
<%
String pForm =  (String)session.getAttribute("platform");
System.out.println("new var pForm: " + pForm);
%>
<select style="" name="platform" id="platform"  property="platform" param="platform">
	<option  name="platform" id="platform" property="platform" param="platform" value="<%=pForm%>"><%=pForm%></option>
	<%
	ArrayList platformCode = scrapReport.PlatformCode();
	Iterator it2 = platformCode.iterator();
	String platformCode1 = null;
	
	ArrayList platformDescription = scrapReport.PlatformDescription();
	Iterator it8 = platformDescription.iterator();
	String platformDescription1 = null;
	while(it2.hasNext()) { 
		platformCode1 = (String) it2.next();
		platformDescription1 = (String) it8.next();
		//System.out.println("platformCode: " + platformCode1);
	%>
	<option  name="platform" id="platform" property="platform" param="platform" value="<%=platformCode1%>"><%=platformDescription1%></option>
	<% } %>
</select>
<!-- ~~~~~scrapCode~~~~~ -->
<label><strong style="color:red;">*</strong>Scrap Code
<span class="small" style="color:red;"><%= form.getErrorMessage("scrapCode") %></span>
</label>
<select style="" name="scrapCode" id="scrapCode" property="scrapCode" param="scrapCode">
	<%
	if ( pForm != "" ){ 
	ArrayList scrapCode = scrapReport.ScrapCode();
	Iterator it7 = scrapCode.iterator();
	String scrapCode1 = null;
	while(it7.hasNext()) { 
		scrapCode1 = (String) it7.next();
	%>
	<option name="scrapCode" id="scrapCode" property="scrapCode" param="scrapCode" value="<%=scrapCode1%>"><%=scrapCode1%></option>
	<% }} %>		
</select>
<!-- ~~~~~lineId~~~~~ -->
<label><strong style="color:red;">*</strong>Line Id
<span class="small" style="color:red;"><%= form.getErrorMessage("lineId") %></span>
</label>
<select style="" name="lineId" id="lineId"  property="lineId" param="lineId">
	<%
	if ( pForm != "" ){ 
		%><jsp:setProperty name="form" property="platform" value='<%= pForm %>'/><%
	ArrayList line = scrapReport.populateStation();
	Iterator it = line.iterator();
	String line1 = null;

	ArrayList lineDescription = scrapReport.populateStationDescription();
	Iterator it12 = lineDescription.iterator();
	String lineDescription1 = null;
	while(it.hasNext()) { 
		line1 = (String) it.next();
		lineDescription1 = (String) it12.next();
	%>
	<option  name="lineId" id="lineId" property="lineId" param="lineId" value="<%=line1%>"><%=lineDescription1%></option>
	<% }} %>
</select>
<!-- ~~~~~revision~~~~~ -->
<label><strong style="color:red;">*</strong>Revision
<span class="small" style="color:red;"><%= form.getErrorMessage("revision") %></span>
</label>
<input type="text" name="revision" id="revision" readonly="readonly" maxlength="6" style="cursor:none;background-color:#F8F8F8;"/>
<!-- ~~~~~partNumber~~~~~ -->
<label><strong style="color:red;">*</strong>Part Number
<span class="small" style="color:red;"><%= form.getErrorMessage("partNumber") %></span>
</label>
<select style="" name="partNumber" id="partNumber"  property="partNumber" param="partNumber">
	<%
	//partNumber
	ArrayList part = scrapReport.populatePartNumber();
	Iterator it3 = part.iterator();
	String part1 = null;
	//partDescription
	ArrayList partDesc = scrapReport.populatePartDescription();
	Iterator it4 = partDesc.iterator();
	String partDesc1 = null;
	while(it3.hasNext()) { 
		part1 = (String) it3.next();
		partDesc1 = (String) it4.next();
	%>
	<option name="partNumber" id="partNumber" property="partNumber" param="partNumber" value="<%=part1%>"><%=partDesc1%></option>
	<% } %>	
</select>
<!-- ~~~~~quantity~~~~~ -->
<label><strong style="color:red;">*</strong>Quantity
<span class="small" style="color:red;"><%= form.getErrorMessage("quantity") %></span>
</label>
<input type="text" name="quantity" id="quantity" maxlength="6" />
<!-- ~~~~~commonCode~~~~~ -->
<label><strong style="color:red;">*</strong>Common Code
<span class="small" style="color:red;"><%= form.getErrorMessage("commonCode") %></span>
</label>
<select style="" name="commonCode" id="commonCode" property="commonCode" param="commonCode">
	<%
	ArrayList commonCode = scrapReport.ScrapReasonCode();
	Iterator it5 = commonCode.iterator();
	String commonCode1 = null;
	
	ArrayList commonDescription = scrapReport.ScrapReasonDescription();
	Iterator it9 = commonDescription.iterator();
	String commonDescription1 = null;
	while(it5.hasNext()) { 
		commonCode1 = (String) it5.next();
		commonDescription1 = (String) it9.next();
		//System.out.println("commonDescription: " + commonDescription1);
	%>
	<option name="commonCode" id="commonCode" property="commonCode" param="commonCode" value="<%=commonCode1%>"><%=commonDescription1%></option>
	<% } %>		
</select>
<!-- ~~~~~comments~~~~~ -->
<label><strong style="color:red;">*</strong>Comment
<span class="small" style="color:red;"></span>
</label>
<input type="text" name="comments" id="comments" property="comments"/>
<!-- ~~~~~chargeback~~~~~ -->
<label><strong style="color:red;">*</strong>Chargeback
<span class="small" style="color:red;"><%= form.getErrorMessage("chargeback") %></span>
</label>
<select style="" name="chargebackCode" id="chargebackCode" property="chargebackCode" param="chargebackCode">
	<%
	ArrayList chargebackCode = scrapReport.ChargebackCode();
	Iterator it6 = chargebackCode.iterator();
	String chargebackCode1 = null;
	
	ArrayList chargebackDescription = scrapReport.ChargebackDescription();
	Iterator it10 = chargebackDescription.iterator();
	String chargebackDescription1 = null;
	while(it6.hasNext()) { 
		chargebackCode1 = (String) it6.next();
		chargebackDescription1 = (String) it10.next();
		//System.out.println("chargebackCode: " + chargebackCode1);
	%>
	<option name="chargebackCode" id="chargebackCode" property="chargebackCode" param="chargebackCode" value="<%=chargebackCode1%>"><%=chargebackCode1%></option>
	<% } %>		
</select>
<!-- ~~~~~example~~~~~ -->
<label><strong style="color:red;">*</strong>Example
<span class="small" style="color:red;"><%= form.getErrorMessage("chargeback") %></span>
</label>
<select id="om_partInfo" name="om_partInfo" onChange='populateRevision()'>
              <option class="select" value="select">Select Part Number</option>
              <c:forEach var="partInfo" items="${partInfo}">
                <option class=${partInfo.lineId} value="${partInfo.part_rev}">${partInfo.part_number} </option>
              </c:forEach>
            </select>
<button type="submit" id="submit" name="submit" value="Process" style="">Add Record</button><button type="reset" id="reset" name="reset" onclick="document.location = 'scrapReport.jsp';" style="">Reset</button>
</div>
<div class="spacer"></div>		
			<div id="footer">
			    <input type="HIDDEN" name="process" value="true">
			    <%-- Save the timestamp in the form --%>
			    <input type="HIDDEN" name="timestamp" value="<%= timestamp %>">
			</div>
	</form>
</div>
</div>
<br>
<div id="table" style="width:830px;">
<table id="dataTable" cellspacing="0" cellpadding="0" border="1" style="text-align:center;width:100%">
<caption><span class="tableTitle"></span></caption>
<thead>
<%-- ~~titles~~ --%>
<tr>
	<th rowspan="1" style="">Work Area</th> 
	<th rowspan="1" style="">Station</th>  
    <th rowspan="1" style="">Part Number</th>
    <th rowspan="1" style="width:5%">Delete</th>
    <th rowspan="1" style="width:5%">Copy</th>
</tr>
<%-- ~~subtitles~~ --%>
<tr>

</tr>
</thead>
<tbody>
<%-- ~~dataTable~~ --%>
<%-- ~~col-1~~ --%>
<tr align="center">
    <td rowspan=""><p class="sub" style="">gdfg</p></td>
    <td rowspan=""><p class="dataCell">gdfg</p></td>
    <td rowspan=""><p class="dataCell">gdfg</p></td>
    <td rowspan=""><p class="dataCell"><button id="replacement-2" type="button">Delete</button></p></td>
    <td rowspan=""><p class="dataCell"><button id="replacement-1" type="button">Copy</button></p></td>
</tr>
</tbody>
</table>
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