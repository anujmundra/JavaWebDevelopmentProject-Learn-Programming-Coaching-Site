<%@page import="java.sql.*" %>
<%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache");//HTTP 1.0
            response.setHeader("Expires","0");//Proxies
            if(session.getAttribute("userid")==null || session.getAttribute("password")==null)
            {
                response.sendRedirect("index.jsp");
            }
        %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
    PreparedStatement ps=con.prepareStatement("select distinct plang from batch order by plang");
    ResultSet rs=ps.executeQuery();
%>
<html>
    <body bgcolor="LightGray">
        <h2>Learn Programming</h2>
        <h3>Batch Search Form</h3>
        <hr>
        <form action="ShowBatch">

            Title       <select name="cname">
<%
    while(rs.next()){
        String s=rs.getString(1);
%>
<option><%=s%></option>
<%
   }
    con.close();
%>
            
                        </select>
                        <input type="submit" value="SearchBatch"/>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
        <hr>
        <a href="userpage.jsp">User-Home</a>
    </body>
</html>