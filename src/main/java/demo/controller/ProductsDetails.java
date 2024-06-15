package demo.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
import org.springframework.util.StringUtils;
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
import org.springframework.web.multipart.MultipartFile;

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
            Model model,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile
    ) {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }
            model.addAttribute("views", "/views/admin/ProductsDetails.jsp");
            return "/admin/index";
        }

        // Xử lý lưu trữ hình ảnh nếu người dùng đã chọn file mới
        if (imageFile != null && !imageFile.isEmpty()) {
            String fileName = StringUtils.cleanPath(imageFile.getOriginalFilename());
            product.setImage(fileName); // Cập nhật đường dẫn hình ảnh mới vào đối tượng sản phẩm
            
            try {
                // Lưu file ảnh vào thư mục trên server
                String uploadDir = "C:\\Users\\Asus\\WebJava5\\Project\\Java5_Assigment\\src\\main\\webapp\\image";
                Path uploadPath = Paths.get(uploadDir);
                
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                
                try (InputStream inputStream = imageFile.getInputStream()) {
                    Path filePath = uploadPath.resolve(fileName);
                    Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                } catch (IOException e) {
                    e.printStackTrace();
                    // Xử lý lỗi khi sao chép file
                }
            } catch (IOException e) {
                e.printStackTrace();
                // Xử lý lỗi khi tạo thư mục lưu trữ
            }
        } else {
            // Nếu người dùng không chọn file mới, giữ nguyên đường dẫn hình ảnh cũ
            Product existingProduct = daoProd.findById(product.getId()).orElse(null);
            if (existingProduct != null) {
                product.setImage(existingProduct.getImage());
            }
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
