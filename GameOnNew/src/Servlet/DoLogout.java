package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DoLogout")
public class DoLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DoLogout() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String logmessage="See you soon!";
		String logadminmessage="Admin logged out.";
		String fatalerr="FATAL ERROR: User & Admin flag is both set.";
		
		
		if (request.getSession(false)==null) { // Debug purposes
			
			String allog="You are not logged in.";
			request.setAttribute("alreadylog", allog);
    		String dest = "index.jsp";
    		if (dest == null || dest.contains("/DoLogout") || dest.trim().isEmpty()) {
    			dest = ".";
    		}
    		response.sendRedirect(dest);
    	}
		
		
		if (request.getSession().getAttribute("admin") == null) { //User session
			
				
				request.getSession().invalidate();
				request.setAttribute("logoutmessage", logmessage);
	    		String dest = "index.jsp";
	    		if (dest == null || dest.contains("/DoLogout") || dest.trim().isEmpty()) {
	    			dest = ".";
	    		}
	    		response.sendRedirect(dest);
	    		return;
			
		} else if ( request.getSession().getAttribute("user")== null)  { //Admin session
			
			 
				
				request.getSession().invalidate();
				request.setAttribute("logadminmessage", logadminmessage);
	    		String dest = "index.jsp";
	    		if (dest == null || dest.contains("/DoLogout") || dest.trim().isEmpty()) {
	    			dest = ".";
	    		}
	    		
	    		response.sendRedirect(dest);
	    		
			
		} else { // Admin flag== true AND User flag == true, should never occur
			
			
			System.out.println("This is some fucked up shit. You can't be both admin and user at the same time. Call DevOps ASAP.");
			request.setAttribute("fatalerr", fatalerr);
    		String dest = "index.jsp";
    		if (dest == null || dest.contains("/DoLogout") || dest.trim().isEmpty()) {
    			dest = ".";
    		}
    		response.sendRedirect(dest);
    		return;
    	}
			
			
	}
	    	
}
	


