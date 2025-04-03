package co.algorizo.erp.outbound;

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
public class outboundController {
	
	private static final Logger logger = LoggerFactory.getLogger(outboundController.class);

	@Autowired
	private outboundService outboundservice;
	
	@GetMapping(value="outbound/o_list")
	public String list(Model model, HttpSession session) throws Exception {
		logger.info("출고 전체 조회입니다.");
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		List<outboundDTO> list = outboundservice.list();
		
		model.addAttribute("list", list);
		return "o_list";
		
	}
	
	@GetMapping(value="outbound/o_detail")
	public String detail(@RequestParam("out_id") int out_id,Model model) throws Exception {
		logger.info("출고 상세 조회입니다.");
		System.out.println(out_id);
		List<outboundDTO> read = outboundservice.detail(out_id);
		System.out.println(read);
		
		model.addAttribute("read", read);
		return "o_detail";
		
	}
	
	@GetMapping(value="outbound/o_register")
	public String registerform(HttpSession session) {
		logger.info("출고 작성페이지로 이동.");
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		return "o_register";
	}
	
	@PostMapping(value="outbound/o_register")
	public String register(@ModelAttribute outboundDTO outbounddto, HttpSession session) throws Exception {
		if (session.getAttribute("m_id") == null) { 
	        return "redirect:/";  // ✅ 세션 없으면 로그인 페이지로 리다이렉트
	    }
		logger.info("출고 등록입니다.");
		System.out.println(outbounddto);
		outboundservice.register(outbounddto);
		return "redirect:/outbound/o_list";
	}
	
	@GetMapping(value="outbound/o_update")
	public String updateform(@RequestParam int out_id,Model model) throws Exception {
		logger.info("출고 수정 페이지로 이동");
		List<outboundDTO> dto = outboundservice.detail(out_id);
		model.addAttribute("up", dto);
		return "o_update";
	}
	
	@PostMapping(value="outbound/o_update")
	public String update(@ModelAttribute outboundDTO outbounddto) throws Exception {
		logger.info("출고 수정 입니다.");
		outboundservice.update(outbounddto);
		
		return "redirect:/outbound/o_detail?out_id=" + outbounddto.getOut_id();
	}
	
	@PostMapping(value="outbound/o_delete")
	public String delete(@RequestParam int out_id) throws Exception {
		logger.info("출고 삭제 입니다.");
		int result = outboundservice.delete(out_id);
		if(result > 0) {
			logger.info("삭제 완료입니다!!");
			return "redirect:/outbound/o_list";
		}
		logger.info("삭제 실패입니다...");
		return "redirect:/outbound/o_list";
	}
}
