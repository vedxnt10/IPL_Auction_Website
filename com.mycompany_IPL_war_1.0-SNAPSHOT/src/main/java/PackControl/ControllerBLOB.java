package PackControl;

import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServlet;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ControllerBLOB extends HttpServlet {

    @RequestMapping(value = "/restaurantform", method = RequestMethod.GET)
    public String Loadinsgpage() {
        return "BLOB/AddRestaurant";
    }

    @RequestMapping(value = "/displayblob", method = RequestMethod.GET)
    public String Loadinsgspage() {
        return "BLOB/displayblob";
    }
    
    @RequestMapping(value = "/restaurantform1", method = RequestMethod.POST)
    public String submitresForm(HttpServletRequest request, HttpServletResponse response, @RequestParam("k") CommonsMultipartFile file) {

        try {
            HttpSession session = request.getSession();

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/image?characterEncoding=utf8", "root", "root");
            PreparedStatement statement = con.prepareStatement("INSERT INTO image (image) values (?)");

            InputStream inputStream = null;

            if (file != null) {
                inputStream = file.getInputStream();
            }
            
            if (inputStream != null) {
               statement.setBlob(1, inputStream);
            }
            int row = statement.executeUpdate();
            if (row > 0) {
                return "BLOB/ResFormSubmit";
            }
            return "main";
        } catch (SQLException | ClassNotFoundException | IOException ex) {
            throw new RuntimeException(ex);
        }
    }
}
