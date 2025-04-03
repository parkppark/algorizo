package co.algorizo.erp.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	
	
	
	@Autowired
	private ProductService productservice;
	
	@RequestMapping(value = "/product/productinsert", method = RequestMethod.GET)
	public String productinsert(Model model) {
		String nextProductCode = productservice.generateNextProductCode();
		model.addAttribute("nextProductCode", nextProductCode);
		return "product/productinsert";
	}
	
	@RequestMapping(value = "/product/productinsert", method = RequestMethod.POST)
	public String productinsert(HttpServletRequest request, @ModelAttribute ProductDTO productDTO, HttpSession session) {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
	    productservice.productinsert(productDTO);
	    return "redirect:/product/productlist";
	}
	
	@RequestMapping(value= "/product/productlist", method = RequestMethod.GET)
	public String productlist(Model model, HttpSession session) {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		List<ProductDTO> productlist = productservice.productlist();
		model.addAttribute("productlist", productlist);
		return "product/productlist";
	}
	
	@RequestMapping(value = "/product/productdetail", method = RequestMethod.GET)
	public String productdetail(@RequestParam("p_code") String p_code, Model model) {
		ProductDTO product = productservice.getProductCode(p_code);
		model.addAttribute("product", product);
		return "product/productdetail";
	}
	
	@RequestMapping(value = "/product/productupdate", method = RequestMethod.GET)
	public String productupdate(@RequestParam("p_code") String p_code, Model model) {
		ProductDTO product = productservice.getProductCode(p_code);
		model.addAttribute("product", product);
		return "product/productupdate";
	}
	
	@RequestMapping(value = "/product/productupdate", method = RequestMethod.POST)
	public String productupdate(ProductDTO product) {
	    productservice.productupdate(product);
	    return "redirect:/product/productlist"; 
	}
	
	@RequestMapping(value = "/product/productdelete", method = RequestMethod.GET)
	public String productdelete(@RequestParam("p_id") int p_id) {
		productservice.productdelete(p_id);
		return "redirect:/product/productlist";
	}
	
	

}
