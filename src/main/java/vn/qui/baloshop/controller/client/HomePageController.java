package vn.qui.baloshop.controller.client;

import java.util.List;

import javax.naming.Binding;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.qui.baloshop.domain.Order;
import vn.qui.baloshop.domain.Product;
import vn.qui.baloshop.domain.User;
import vn.qui.baloshop.domain.dto.RegisterDTO;
import vn.qui.baloshop.service.OrderService;
import vn.qui.baloshop.service.ProductService;
import vn.qui.baloshop.service.UserService;

import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder, OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = productService.fetchProducts();
        model.addAttribute("products", products);

       
        
        return "client/homepage/show";
    }

    //register
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }
     @PostMapping("/register")
     public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
         User user = this.userService.registerDTOtoUser(registerDTO);

          
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

  
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));

        // save database
        this.userService.handelSaveUser(user);
      
         return "redirect:/login";
     }
     //login
    @GetMapping("/login")
    public String getLoginPage(Model model) {
       
        return "client/auth/login";
    }
    //access deny
     @GetMapping("/access-deny")
    public String getAccessDenyPage(Model model) {
       
        return "client/auth/access-deny";
    }

     @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);

        return "client/cart/order-history";
    }

}
