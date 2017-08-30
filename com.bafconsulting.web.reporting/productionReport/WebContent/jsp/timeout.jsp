<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%
//get errorCode and errorMessage
String errorCode = (String)session.getAttribute("errorCode");	
String errorMessage = (String)session.getAttribute("errorMessage");	
//detect browser
String ua = request.getHeader( "User-Agent" );
System.out.println("ua" + ua);
boolean isFirefox = ( ua != null && ua.indexOf( "Firefox/" ) != -1 );
boolean isMSIE = ( ua != null && ua.indexOf( "MSIE" ) != -1 );
response.setHeader( "Vary", "User-Agent" );
%>
<html>
<head>
<style>
a:link			{font:8pt/11pt verdana; color:red}
a:visited		{font:8pt/11pt verdana; color:#4e4e4e}
</style>
<meta HTTP-EQUIV="Content-Type" Content="text-html; charset=Windows-1252">
<meta name='author' content='Bryn Flewelling' />
<meta name='copyright' content='BAFCONSULTING' />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<meta name="ROBOTS" CONTENT="NOINDEX,NOFOLLOW">
<link rel="icon" media="all" href="" type="image/x-icon">
<link rel="shortcut icon" media="all" href="" type="image/x-icon"> 
<title>Error</title>
</head>
<body bgcolor="white" onload="initPage()">
<table width="400" cellpadding="3" cellspacing="5">
  <tr>
    <td id="tableProps" valign="top" align="left"><img id="pagerrorImg" SRC="../images/pageerror.gif" width="25" height="33"></td>
    <td id="tableProps2" align="left" valign="middle" width="360"><h1 id="errortype" style="COLOR: black; FONT: 13pt/15pt verdana"><span id="errorText">An error has occured.</span></h1>
    </td>
  </tr>
  <tr>
    <td id="tablePropsWidth" width="400" colspan="2"><font
    style="COLOR: black; FONT: 8pt/11pt verdana">Possible causes:</font></td>
  </tr>
  <tr>
    <td id="tablePropsWidth2" width="400" colspan="2"><font id="LID1" style="COLOR: black; FONT: 8pt/11pt verdana"> 
      <hr color="#C0C0C0" noshade>
      <ul>
        <li id="list1"><span class="infotext"><strong>Explanation: </strong><% %><%=errorMessage %><br>
          </span></li>
      </ul>
      <p><br>
      </p>
      <h2 id="ietext" style="font:8pt/11pt verdana; color:black"><img src="../images/search.gif" width="16" height="16" align="top"> 
      <% if( isFirefox ){ %>
 		Error - <%=errorCode %> - Firefox <BR>
	<% } %>
       <% if( isMSIE ){ %>
		Error - <%=errorCode %> - Internet Explorer <BR>
	<% }else{%>
		Error - <%=errorCode%> - Browser <BR>
	<%}%>
      </h2>
      </font></td>
  </tr>
</table>
</body>
<head>
<meta HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
</head>
</html>