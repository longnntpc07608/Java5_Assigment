package demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.CategoryDAO;
import demo.dao.ProductDAO;
import demo.entity.Category;
import demo.entity.Product;

@Controller
@RequestMapping("/admin")
public class ProductsDetails {

    @Autowired
    ProductDAO daoProd;
    
    @Autowired
    CategoryDAO daoCate;
    
    @ModelAttribute("availables")
    public Map<Boolean, String> getAvailable(){
        Map<Boolean, String> map = new HashMap<>();
        map.put(true, " Available");
        map.put(false, " Not Available");
        return map;
    }
    
    @ModelAttribute("categories")
    public List<Category> getCategories(){
        List<Category> list = daoCate.findAll();
        return list;
    }

    @RequestMapping("/product")
    public String product(
            Model model,
            @RequestParam("p") Optional<Integer> p,
            @ModelAttribute("prod") Product product
            ) {
        model.addAttribute("TitlePage", "Products Page");
        model.addAttribute("views", "/views/admin/ProductsDetails.jsp");

        Sort sortCD = Sort.by(Direction.DESC,"createDate");
        Pageable pageable = PageRequest.of(p.orElse(0), 5, sortCD);
        Page<Product> page = daoProd.findAll(pageable);
        model.addAttribute("page", page);
        
        return "/admin/index";
    }

    @GetMapping("/product/edit/{id}")
    public String editProductForm(@PathVariable("id") Integer id, Model model) {
        Optional<Product> optionalProduct = daoProd.findById(id);
        if (optionalProduct.isPresent()) {
            model.addAttribute("prod", optionalProduct.get());
            model.addAttribute("categories", getCategories()); // Ensure categories are available for dropdown
            model.addAttribute("availables", getAvailable()); // Ensure availability options are available
            return "/admin/ProductsDetails"; // This is the edit product form view
        } else {
            // Handle case where product with given ID is not found
            return "redirect:/admin/product"; // Redirect to product listing page
        }
    }


    @RequestMapping("/product/delete/{id}")
    public String delete(Model model, @PathVariable("id") Integer id) {
        daoProd.deleteById(id);
        model.addAttribute("message", "Delete successfully");
        return "forward:/admin/product";
    }

    @PostMapping("/product/save")
    public String saveProduct(
            @Validated @ModelAttribute("prod") Product product,
            BindingResult result,
            Model model
    ) {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }
            model.addAttribute("views", "/views/admin/ProductsDetails.jsp");
            return "/admin/index";
        }

        daoProd.save(product);
        return "redirect:/admin/product";
    }

    @RequestMapping("/product/clear")
    public String clear(Model model, @ModelAttribute("prod") Product product) {
        product = new Product();
        return "forward:/admin/product";
    }
}
