<html>
    <body bgcolor="LightGray">
        <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache");//HTTP 1.0
            response.setHeader("Expires","0");//Proxies
            if(session.getAttribute("userid")==null || session.getAttribute("password")==null)
            {
                response.sendRedirect("index.jsp");
            }
        %>
        <h2>Learn Programming</h2>
        <h2>Delete Batch/Delete Course</h2>
        <hr>
        <h2><a href="deletebatch.jsp">Delete Batch</a></h2>
        <h2><a href="deletecourse.jsp">Delete Course</a></h2>
        
        <a href="adminpage.jsp">Home</a>
    </body>
</html>