package demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.AccountDAO;
import demo.entity.Account;
import demo.service.MailerServiceImpl;
import demo.service.SessionService;

@Controller
public class LoginController {

    @Autowired
    SessionService session;

    @Autowired
    AccountDAO dao;

    @Autowired
    JavaMailSender sender;

    @Autowired
    MailerServiceImpl mailer;

    @GetMapping("/login")
    public String getFormLogin(Model model) {
        model.addAttribute("TitlePage", "Đăng Nhập");
        model.addAttribute("view", "/views/SignIn.jsp");
        session.remove("User");
        return "index";
    }

    @PostMapping("/login")
    public String login(HttpSession sess, @ModelAttribute("acc") Account account, @RequestParam("username") String un,
                        @RequestParam("password") String pw, BindingResult result) {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            sess.setAttribute("errors", errors);
            return "redirect:/login";
        } else {
            account = dao.findByUsernameAndPassword(un, pw);
            if (account != null) {
                if (account.isActivated()) {
                    session.set("User", account);
                    if (account.isRole()) {
                        sess.setAttribute("errorMessage", "");
                        return "redirect:/admin";
                    } else {
                        sess.setAttribute("errorMessage", "");
                        return "redirect:/";
                    }
                } else {
                    sess.setAttribute("errorMessage", "Bạn không được đăng nhập với tài khoản này!");
                    return "redirect:/login";
                }
            } else {
                if (un.length() == 0 || pw.length() == 0) {
                    sess.setAttribute("errorMessage", "Bạn vui lòng nhập tài khoản và mật khẩu!");
                } else {
                    sess.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu nhập không đúng!");
                }
                return "redirect:/login";
            }
        }
    }

    @GetMapping("/SignUp")
    public String getFormSignUp(Model model, @ModelAttribute("user") Account user, HttpSession sess) {
        model.addAttribute("TitlePage", "Đăng Ký");
        model.addAttribute("view", "/views/SignUp.jsp");
        sess.setAttribute("errorMessageSignUp", "");
        return "index";
    }

    @PostMapping("/SignUp")
    public String signUp(Model model, HttpSession sess, @ModelAttribute("user") Account user,
                         @RequestParam("username") String un, @RequestParam("fullname") String fn,
                         @RequestParam("email") String email, @RequestParam("password") String pwd,
                         @RequestParam("cfpwd") String cfpwd, BindingResult result) {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            model.addAttribute("errors", errors);
            return "redirect:/SignUp";
        } else {
            Account newAcc = dao.findByUsername(un);
            if (newAcc == null) {
                if (un.length() == 0) {
                    sess.setAttribute("errorMessageSignUp", "Không được để trống Username");
                } else if (fn.length() == 0) {
                    sess.setAttribute("errorMessageSignUp", "Không được để trống Fullname");
                } else if (email.length() == 0) {
                    sess.setAttribute("errorMessageSignUp", "Không được để trống Email");
                } else if (pwd.length() == 0) {
                    sess.setAttribute("errorMessageSignUp", "Không được để trống Password");
                } else if (cfpwd.length() == 0) {
                    sess.setAttribute("errorMessageSignUp", "Không được để trống Confirm Password");
                } else if (!pwd.equalsIgnoreCase(cfpwd)) {
                    sess.setAttribute("errorMessageSignUp", "Confirm Password không giống với password");
                } else {
                    if (!dao.existsById(un)) {
                        sess.setAttribute("errorMessageSignUp", "");
                        sess.setAttribute("errorMessage", "");
                        dao.save(user);
                        return "redirect:/login";
                    }
                    throw new RuntimeException("Ma tai khoan da ton tai!");
                }
                return "redirect:/SignUp";
            } else {
                sess.setAttribute("errorMessageSignUp", "Username này đã tồn tại, vui lòng chọn username khác!");
                return "redirect:/SignUp";
            }
        }
    }
    
    @GetMapping("/ForgotPassword")
    public String getForgotPasswordForm(Model model) {
        model.addAttribute("TitlePage", "Quên Mật Khẩu");
        model.addAttribute("view", "/views/ForgotPassword.jsp");
        return "index";
    }



    @PostMapping("/forgot-password")
    public String forgotPassword(HttpSession sess, @RequestParam("usernameF") String un, @RequestParam("emailF") String em, Model model) {
        Account acc = dao.findByUsername(un);
        if (acc == null || !acc.getEmail().equals(em)) {
            sess.setAttribute("errorMessageForgotPassword", "Username hoặc Email không đúng!");
            return "redirect:/forgot-password";
        }

        try {
            // Đây chỉ là một ví dụ, trong thực tế bạn không nên gửi mật khẩu gốc của người dùng qua email.
            mailer.send(
                    em,
                    "Mail Quên Mật Khẩu từ HP Store",
                    "<h3>" +
                            "Username: " + un + "<br>" +
                            "Password: " + acc.getPassword() +  // Trong thực tế, bạn nên tạo một link reset mật khẩu thay vì gửi mật khẩu trực tiếp
                            "</h3>");
            sess.setAttribute("successMessageForgotPassword", "Mật khẩu đã được gửi tới email của bạn!");
        } catch (Exception e) {
            sess.setAttribute("errorMessageForgotPassword", "Gửi email thất bại. Vui lòng thử lại sau.");
        }

        return "redirect:/login";
    }


    
    @GetMapping("/ResetPassword")
    public String getResetPasswordForm(@RequestParam(name = "username", required = false) String username, Model model, HttpSession sess) {
       
        model.addAttribute("username", username);
        model.addAttribute("TitlePage", "Đặt Lại Mật Khẩu");
        model.addAttribute("view", "/views/user/ResetPassword.jsp");
        return "index";
    }


    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam("username") String username, @RequestParam("password") String pwd, @RequestParam("cfpwd") String cfpwd, HttpSession sess) {
        Account acc = dao.findByUsername(username);
        if (acc == null) {
            sess.setAttribute("errorMessageResetPassword", "Username không hợp lệ!");
            return "redirect:/login";
        }

        if (!pwd.equalsIgnoreCase(cfpwd)) {
            sess.setAttribute("errorMessageResetPassword", "Confirm Password không giống với password");
            return "redirect:/reset-password?username=" + username;
        }

        // Hash the new password before saving
        acc.setPassword(pwd); // Replace this with proper password hashing
        dao.save(acc);

        sess.setAttribute("successMessageResetPassword", "Mật khẩu của bạn đã được đặt lại thành công!");
        return "redirect:/login";
    }
}
