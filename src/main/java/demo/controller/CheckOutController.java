package demo.controller;

import java.io.File;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.CategoryDAO;
import demo.dao.OrderDAO;
import demo.dao.OrderDetailDAO;
import demo.dao.ProductDAO;
import demo.entity.Account;
import demo.entity.CartItem;
import demo.entity.Category;
import demo.entity.MailModel;
import demo.entity.Order;
import demo.entity.OrderDetail;
import demo.entity.Product;
import demo.service.MailerServiceImpl;
import demo.service.SessionService;
import demo.service.ShoppingCartService;

@Controller
public class CheckOutController {
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	OrderDAO daoOrder;
	
	@Autowired
	OrderDetailDAO daoOrderDetail;
	
	@Autowired
	CategoryDAO daoCategory;
	
	@Autowired
	ProductDAO daoProduct;

	@Autowired
	ShoppingCartService cart;

	@Autowired
	SessionService session;
	
	@Autowired 
	MailerServiceImpl mailer;
	
	@GetMapping("/cart/checkout")
	public String checkout(
			Model model
			) {
		model.addAttribute("TitlePage", "CheckOut Details");
		model.addAttribute("view", "/views/user/checkoutDetails.jsp");
		
		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);
		
		model.addAttribute("cartItems", cart.getItems());
		model.addAttribute("Count", cart.getCount());
		model.addAttribute("Amount", cart.getAmount());
		
		Order order = new Order();
		model.addAttribute("order", order);
		
		return "index";
	}
	
	@PostMapping("/cart/checkout")
	public String postCheckOut(
			Model model,
			@Validated @ModelAttribute("order") Order order, 
			BindingResult result
			) {
		model.addAttribute("TitlePage", "CheckOut Details");
		model.addAttribute("view", "/views/user/checkoutDetails.jsp");
		
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			model.addAttribute("errors", errors);

			return "redirect:/cart/checkout";
		}else {
			try {
				//tao order moi
				daoOrder.save(order);
				
				//luu du lieu order detail

				for (CartItem item : cart.getItems()) {
//					System.out.println("Save orderDtails: " + item);
					Order o = daoOrder.getById(order.getId());
					Product product = daoProduct.getById(item.getProductId());

					daoOrderDetail.save(new OrderDetail(item.getPrice(), item.getQuantity(), product, o));
				}
				
				//gui mail cho nguoi dat
				mailer.send(
						"ngthn2001@gmail.com", 
						"Thông báo đặt hàng Thành Công từ ASS_SOF3021", 
						"<h3>Chúc mừng bạn đã đặt hàng thành công từ ABC Shop ASS_SOF3021</h3> <br>"
						+ "Xem chi tiết Order: "
						+ "<a href='http://localhost:6901/myAcc/historyOrder/"+ order.getAccount().getUsername() +"'>tại đây</a>" );
				
				//xoa tat ca san pham trong gio hang
				cart.getItems().clear();
				return "redirect:/";
			} catch (Exception e) {
				// TODO: handle exception
				return "redirect:/cart/checkout";
			}
				
							
		}
		
	}

}
