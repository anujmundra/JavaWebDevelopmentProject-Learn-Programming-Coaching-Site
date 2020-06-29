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
        <h3>Welcome User</h3>
        <hr>
        <pre>
        <a href="ShowAllCourses">View-All-Courses</a>
        <a href="csearch.jsp">Search-Course</a>
        <a href="ShowAllFaculty">View-Faculty-Details</a>
        <a href="bsearch.jsp">Search-Batch</a>
        <a href="ShowAllBatches">View-All-Batches</a>
        <a href="Logout">Logout</a>
        </pre>
        <hr>
    </body>
</html>
