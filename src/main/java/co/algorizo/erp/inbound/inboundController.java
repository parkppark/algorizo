package co.algorizo.erp.inbound;

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

@Controller
public class inboundController {
	
	private static final Logger logger = LoggerFactory.getLogger(inboundController.class);
	@Autowired
	private inboundService service;
	
	@GetMapping(value="inbound/i_list")
	public String list(Model model, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		logger.info("입고 전체 목록 입니다.");
		List<inboundDTO> list = service.list();
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "i_list";
	}
	
	@GetMapping(value="inbound/i_detail")
	public String detail(@RequestParam int in_id,Model model) throws Exception {
		logger.info("입고 상세 정보입니다.");
		System.out.println(in_id);
		List<inboundDTO> dto = service.detail(in_id);
		System.out.println("controller"+ dto);
		model.addAttribute("detail", dto);
		
		return"i_detail";
	}
	
	@GetMapping(value="inbound/i_register")
	public String registerform(HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		logger.info("입고 작성 페이지로 이동.");
		return "i_register";
		
	}
	
	@PostMapping(value="inbound/i_register")
	public String register(@ModelAttribute inboundDTO inbounddto, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		logger.info("입고 등록 입니다.");
		System.out.println(inbounddto);
		service.register(inbounddto);
		return "redirect:/inbound/i_list";
		
	}
	
	@GetMapping(value="inbound/i_update")
	public String updateform(@RequestParam int in_id,Model model) throws Exception {
		logger.info("입고 수정 페이지로 이동.");
		List<inboundDTO> update = service.detail(in_id);
		System.out.println("수정form" + in_id);
		
		model.addAttribute("up", update);
		return "i_update";
	}
	
	@PostMapping(value="inbound/i_update")
	public String update(@ModelAttribute inboundDTO inbounddto) throws Exception {
		logger.info("입고 수정 입니다.");
		System.out.println("수정" + inbounddto);
		service.update(inbounddto);
		return "redirect:i_detail?in_id=" + inbounddto.getIn_id();
		//id에 맞는 상세 정보로 리다이렉트한다.
	}
	
	@PostMapping(value="inbound/i_delete")
	public String delete(@RequestParam int in_id,Model model) throws Exception {
		logger.info("입고 삭제 입니다.");
		System.out.println("삭제" + in_id);
		int result = service.delete(in_id);
		
		if(result > 0) {
			logger.info("입고 삭제 완료!!");
			return"redirect:/inbound/i_list";
		}
		return"redirect:/inbound/i_list";
	}
	
}
