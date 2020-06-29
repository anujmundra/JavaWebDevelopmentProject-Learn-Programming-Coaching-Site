import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VerifyUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache");//HTTP 1.0
            response.setHeader("Expires","0");//Proxies
        String s1=request.getParameter("userid");
        String s2=request.getParameter("password");
        String s3=request.getParameter("usertype");
        HttpSession session=request.getSession();
        session.setAttribute("userid",s1);
        session.setAttribute("password",s2);
        session.setAttribute("usertype",s3);
        if(session.getAttribute("userid")==null||session.getAttribute("password")==null)
            response.sendRedirect("index.jsp");
        if(s1.equalsIgnoreCase("")||s2.equalsIgnoreCase(""))
            response.sendRedirect("index.jsp");
        else if(s3.equals("admin")){
            //admin is trying to login
                if(s1.equals("admin") && s2.equals("indore")){
                    response.sendRedirect("adminpage.jsp");
                }
                else{
                    out.println("Invalid Admin Details");
                }
        }
        
        else{
            //user is trying to login
            String qr="select * from users where userid=? and password=?";
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssidata","root","root");
            PreparedStatement ps=con.prepareStatement(qr);
            ps.setString(1, s1);
            ps.setString(2, s2);
            ResultSet rs=ps.executeQuery();
            boolean b=rs.next();
            if(b==true){
                response.sendRedirect("userpage.jsp");
            }else{
                out.println("Invalid User Details");
            }
            
            }catch(Exception e){
                out.println(e);
            }
            
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
