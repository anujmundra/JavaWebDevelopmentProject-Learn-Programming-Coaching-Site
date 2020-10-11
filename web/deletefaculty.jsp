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
        <h2>Delete Faculty</h2>
        <hr>
        <%    String qr="select * from faculty";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
            PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs=ps.executeQuery();
            out.println("<html>");
            out.println("<body  bgcolor=LightGray>");
            out.println("<h2>Learn Programming</h2>");
            out.println("<h3>Our Experienced Faculties</h3>");
            out.println("<table border=2>");
            out.println("<tr>");
            out.println("<td>Faculty Name</td>");
            out.println("<td>Specialization</td>");
            out.println("<td>Experience</td>");
            out.println("</tr>");
            while(rs.next()){
                String s1=rs.getString(1);
                String s2=rs.getString(2);
                String s3=rs.getString(3);
                out.println("<tr>");
                out.println("<td>"+s1+"</td>");
                out.println("<td>"+s2+"</td>");
                out.println("<td>"+s3+"</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
            con.close();
        } catch(Exception e) {
            out.println(e);
        }%>
        <h2>Select the Faculty Name to Delete</h2>
         <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
    PreparedStatement ps=con.prepareStatement("select distinct name from faculty order by name");
    ResultSet rs=ps.executeQuery();
%>
        <form action="DeleteFaculty">

            Title       <select name="name">
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
                        <input type="submit" value="DeleteFaculty"/>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
</html>
        