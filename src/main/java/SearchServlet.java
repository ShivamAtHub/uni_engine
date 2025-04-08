import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String state = request.getParameter("state");
        String course = request.getParameter("course");

        UniversityDAO dao = new UniversityDAO();
        List<University> universities = dao.searchUniversities(name, state, course);

        request.setAttribute("universities", universities);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/viewUniversity.jsp");
        dispatcher.forward(request, response);
    }
}
