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
        <h3>New Batch Form</h3>
        <hr>
        <form action="SaveBatch">
            <pre>
            Batch-Code             <input type="text" name="bcode"/>
            Programming Language   <input type="text" name="plang"/>
            Faculty-Name           <input type="text" name="fname"/>
            Start-Date             <input type="date" name="sdate"/>
            Duration               <input type="text" name="duration"/>
            End-Date               <input type="date" name="edate"/>
                                   <input type="submit" value="SaveBatch"/>
            </pre>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
        <hr>
        <a href="adminpage.jsp">Home</a>
    </body>
</html>
