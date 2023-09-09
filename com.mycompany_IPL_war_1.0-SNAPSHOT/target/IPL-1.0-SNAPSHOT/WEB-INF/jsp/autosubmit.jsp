<%-- 
    Document   : autosubmit
    Created on : May 23, 2023, 5:45:22 PM
    Author     : Yash
--%>
<%
    String tn=(String)request.getAttribute("tn");
    int id=(int)request.getAttribute("id");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Auto Submit Form</title>
  <script>
    function submitForm() {
      document.getElementById('myForm').submit();
    }
  </script>
</head>
<body onload="submitForm()">
  <form id="myForm" action="dashboard" method="POST">
    <!-- Form fields go here -->
    <input type="hidden" name="id" value="<%=id%>">
    <input type="hidden" name="tn" value="<%=tn%>">
    <!-- ... -->
  </form>
</body>
</html>