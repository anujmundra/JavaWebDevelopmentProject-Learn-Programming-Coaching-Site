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
        <h3>Course Entry Form</h3>
        <hr>
        <form action="SaveCourse">
            <pre>
            CourseId    <input type="text" name="courseid"/>
            Title       <input type="text" name="title"/>
            Descr       <input type="text" name="desc"/>
            Duratoin    <input type="text" name="dur"/>
            Fees        <input type="text" name="fees"/>
                        <input type="submit" value="SaveCourse"/>
            </pre>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
        <hr>
        <a href="adminpage.jsp">Home</a>
    </body>
</html>
