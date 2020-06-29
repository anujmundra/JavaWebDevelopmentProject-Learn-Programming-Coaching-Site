import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class SaveBatch extends HttpServlet {
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
        try {
                String s1=request.getParameter("bcode");
                String s2=request.getParameter("plang");
                String s3=request.getParameter("fname");
                String s4=request.getParameter("sdate");
                String s5=request.getParameter("duration");
                String s6=request.getParameter("edate");
                String qr="insert into batch values(?,?,?,?,?,?)";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
                PreparedStatement ps=con.prepareStatement(qr);
                ps.setString(1,s1);
                ps.setString(2,s2);
                ps.setString(3,s3);
                ps.setString(4,s4);
                ps.setString(5,s5);
                ps.setString(6, s6);
                ps.executeUpdate();
                con.close();
                out.println("<html>");
                out.println("<body bgcolor=LightGray>");
                out.println("<h3>BATCH DETAILS ADDED</h3>");
                out.println("<h4><a href=batch.jsp>ADD-MORE</a></h4>");
                out.println("<h4><a href=adminpage.jsp>ADMIN-HOME</a></h4>");
                out.println("</body>");
                out.println("</html>");
            
        } catch(Exception e) {
            out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
