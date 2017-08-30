<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
<select name="sel1" onChange="populateField(this.form)"  multiple="multiple">
    <option value="">---Select---</option>
    <option value="stop" >Stop</option>
    <option value="start">Start</option>
</select>
 
<input type="text" id="eStop" name="eStop" />
</form>
<script type="text/javascript">
function populateField(frm){
 var test = frm.sel1.value;
 alert('work '+ test);
 frm.eStop.value = test;
}
</script>
</body>
</html>