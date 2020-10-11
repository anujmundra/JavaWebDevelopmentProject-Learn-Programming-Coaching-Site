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
        <h2>Delete Course</h2>
        <hr>
        <%String qr="select * from courses";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
            PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs=ps.executeQuery();
            out.println("<html>");
            out.println("<body  bgcolor=LightGray>");
            out.println("<h3>Our Courses</h3>");
            out.println("<table border=2>");
            out.println("<tr>");
            out.println("<td>CourseId</td>");
            out.println("<td>Title</td>");
            out.println("<td>Desc</td>");
            out.println("<td>Dur</td>");
            out.println("<td>Fees</td>");
            out.println("</tr>");
            while(rs.next()){
                String s1=rs.getString(1);
                String s2=rs.getString(2);
                String s3=rs.getString(3);
                String s4=rs.getString(4);
                String s5=rs.getString(5);
                out.println("<tr>");
                out.println("<td>"+s1+"</td>");
                out.println("<td>"+s2+"</td>");
                out.println("<td>"+s3+"</td>");
                out.println("<td>"+s4+"</td>");
                out.println("<td>"+s5+"</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
            con.close();
        }catch(Exception e){
            out.println(e);
        }%>
        <h3>Select the Course to Delete</h3>
        <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
    PreparedStatement ps=con.prepareStatement("select distinct courseid from courses order by courseid");
    ResultSet rs=ps.executeQuery();
%>
        <form action="DeleteCourse">

            Title       <select name="courseid">
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
                        <input type="submit" value="DeleteCourse"/>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
</html>