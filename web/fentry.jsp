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
        <h3>Faculty Entry Form</h3>
        <hr>
        <form action="SaveFaculty">
            <pre>
            Name            <input type="text" name="name"/>
            Specialization  <input type="text" name="cname"/>
            Experience      <input type="text" name="experience"/>
                            <input type="submit" value="SaveFaculty"/>
            </pre>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
        <hr>
        <a href="adminpage.jsp">Home</a>
    </body>
</html>
