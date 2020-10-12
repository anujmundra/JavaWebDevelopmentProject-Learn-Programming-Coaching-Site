<%@page import="java.sql.*" %>
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
        <hr>
        <h2>Learn Programming</h2>
        <h2>Delete Batch</h2>
        <hr>
        <%String qr="select * from batch";
        try {
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
            PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs=ps.executeQuery();
            out.println("<html>");
            out.println("<body  bgcolor=LightGray>");
            out.println("<h2>Learn Programming</h2>");
            out.println("<h3>All Batches Details</h3>");
            out.println("<table border=2>");
            out.println("<tr>");
            out.println("<td>Batch Code</td>");
            out.println("<td>Programming Language</td>");
            out.println("<td>Faculty Name</td>");
            out.println("<td>Course Start Date</td>");
            out.println("<td>Duration</td>");
            out.println("<td>Course End Date</td>");
            out.println("</tr>");
            while(rs.next()){
                String s1=rs.getString(1);
                String s2=rs.getString(2);
                String s3=rs.getString(3);
                String s4=rs.getString(4);
                String s5=rs.getString(5);
                String s6=rs.getString(6);
                out.println("<tr>");
                out.println("<td>"+s1+"</td>");
                out.println("<td>"+s2+"</td>");
                out.println("<td>"+s3+"</td>");
                out.println("<td>"+s4+"</td>");
                out.println("<td>"+s5+"</td>");
                out.println("<td>"+s6+"</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("<h4><a href=adminpage.jsp>Home</a></h4>");
            out.println("</body>");
            out.println("</html>");
            con.close();
            
        } catch(Exception e) {
            out.println(e);
        }%>
        <h3>Select the Batch to Delete</h3>
        <%    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
    PreparedStatement ps=con.prepareStatement("select distinct bcode from batch order by bcode");
    ResultSet rs=ps.executeQuery();
%>
        <form action="DeleteBatch">

            Title       <select name="bcode">
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
                        <input type="submit" value="DeleteBatch"/>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
</body>
</html>