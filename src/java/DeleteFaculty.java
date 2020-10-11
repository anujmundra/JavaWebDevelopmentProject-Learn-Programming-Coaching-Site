import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteFaculty extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache");//HTTP 1.0
            response.setHeader("Expires","0");//Proxies
        HttpSession session=request.getSession();
        if(session.getAttribute("userid")==null||session.getAttribute("password")==null)
            response.sendRedirect("index.jsp");
        String title=request.getParameter("name");
        String qr="delete from faculty where name=?";
        String qr1="delete from batch where fname=?";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
            PreparedStatement ps=con.prepareStatement(qr);
            PreparedStatement ps1=con.prepareStatement(qr1);
            ps.setString(1, title);
            ps1.setString(1, title);
            ps.execute();
            ps1.execute();
            out.println("<html>");
            out.println("<body  bgcolor=LightGray>");
            out.println("<h2>Learn Programming</h2>");
            out.println("<h1>Faculty deleted successfully and all the batch associated with the faculty too deleted!");
            out.println("<h4><a href=deletefaculty.jsp>Delete-More</a></h4>");
            out.println("<h4><a href=adminpage.jsp>Home</a></h4>");
            out.println("</body>");
            out.println("</html>");
            con.close();
        }catch(Exception e){
            out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
