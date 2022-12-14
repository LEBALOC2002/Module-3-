import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Nguyễn Văn A", LocalDate.parse("2000-12-02"),"Huế","https://i.pinimg.com/originals/6f/77/b6/6f77b6c81527519552033c1f492820a0.jpg"));
        customers.add(new Customer("Nguyễn Văn B", LocalDate.parse("2000-12-02"),"Đà Nẵng","https://i.pinimg.com/originals/6f/77/b6/6f77b6c81527519552033c1f492820a0.jpg"));
        customers.add(new Customer("Nguyễn Văn C", LocalDate.parse("2000-12-02"),"Hà Nội","https://i.pinimg.com/originals/6f/77/b6/6f77b6c81527519552033c1f492820a0.jpg"));
        customers.add(new Customer("Nguyễn Văn D", LocalDate.parse("2000-01-02"),"Sài Gòn","https://i.pinimg.com/originals/6f/77/b6/6f77b6c81527519552033c1f492820a0.jpg"));

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        req.setAttribute("customers",customers);
        requestDispatcher.forward(req,resp);
    }
}