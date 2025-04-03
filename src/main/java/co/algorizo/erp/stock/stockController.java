package co.algorizo.erp.stock;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.algorizo.erp.inbound.inboundDTO;

@Controller
public class stockController {
	
	private static final Logger logger = LoggerFactory.getLogger(stockController.class);
	
	@Autowired
	private stockService stockservice;
	

	@GetMapping(value="stock/s_list")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		logger.info("재고 전체 목록 입니다.");
		List<stockDTO> list = stockservice.list();
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "s_list";
	}
	
	@GetMapping(value="stock/s_detail")
	public String detail(@RequestParam int s_id,Model model) throws Exception {
		logger.info("입고 상세 정보입니다.");
		System.out.println(s_id);
		List<stockDTO> dto = stockservice.detail(s_id);
		System.out.println("s_controller"+ dto);
		model.addAttribute("detail", dto);
		
		return"s_detail";
	}
	
	@GetMapping(value="stock/s_register")
	public String registerform(HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		logger.info("입고 작성 페이지로 이동.");
		return "s_register";
		
	}
	
	@PostMapping(value="stock/s_register")
	public String register(@ModelAttribute stockDTO stockdto, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		logger.info("입고 등록 입니다.");
		System.out.println(stockdto);
		stockservice.register(stockdto);
		return "redirect:/stock/s_list";
		
	}
	
	@GetMapping(value="stock/s_update")
	public String updateform(@RequestParam int s_id,Model model) throws Exception {
		logger.info("입고 수정 페이지로 이동.");
		List<stockDTO> update = stockservice.detail(s_id);
		System.out.println("수정form" + s_id);
		
		model.addAttribute("up", update);
		return "s_update";
	}
	
	@PostMapping(value="stock/s_update")
	public String update(@ModelAttribute stockDTO stockdto) throws Exception {
		logger.info("입고 수정 입니다.");
		System.out.println("수정" + stockdto);
		stockservice.update(stockdto);
		return "redirect:s_detail?s_id=" + stockdto.getS_id();
		//id에 맞는 상세 정보로 리다이렉트한다.
	}
	
	@PostMapping(value="stock/s_delete")
	public String delete(@RequestParam int s_id) throws Exception {
		logger.info("입고 삭제 입니다.");
		System.out.println("삭제" + s_id);
		int result = stockservice.delete(s_id);
		
		if(result > 0) {
			logger.info("삭제 완료!!");
			return"redirect:/stock/s_list";
		}
		logger.info("삭제 실패..");
		return"redirect:/stock/s_list";
	}
	/*
	 * @PostMapping(value="stock/s_inpro") public String
	 * handleIncomingStock(@ModelAttribute stockDTO stockdto) throws Exception {
	 * logger.info("입고 처리 시작"); stockservice.handleIncomingStock(stockdto);
	 * logger.info("입고 처리 완료");
	 * 
	 * return "redirect:/stock/s_list";
	 * 
	 * }
	 * 
	 * @PostMapping(value="stock/s_outpro") public String
	 * handleOutgoingStock(@ModelAttribute stockDTO stockdto) throws Exception{
	 * logger.info("출고 처리 시작"); stockservice.handleOutgoingStock(stockdto);
	 * logger.info("출고 처리 완료");
	 * 
	 * return "redirect:/stock/s_list"; }
	 */
}
