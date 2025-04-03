package co.algorizo.erp.procurement_plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.algorizo.erp.procurement_plan.DTO.PlanDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;

@Controller
@RequestMapping(value = "/plans")
public class PlanController {
	private static final int limit = 10;
	@Autowired
	private PlanService planService;
	
//	조달 계획 조회 페이지로 이동 
	@GetMapping(value = "/list")
	public ModelAndView pagesize(){
		
		ModelAndView mav = new ModelAndView();
		int count = planService.count();
		int pagesize = (count + 9) / limit;
		
		mav.addObject("pagesize", pagesize);
		mav.setViewName("list");
		return mav;
	}
	
//	조달 계획 조회 데이터 가져오기
	@GetMapping(value = "/listData")
	public ResponseEntity<List<PlanDTO>> list(@RequestParam int pageNum) {
		
		List<PlanDTO> list = planService.list(limit , pageNum);
		return ResponseEntity.ok(list);
	}
	
//	조달 계획 상세보기
	@GetMapping(value = "/detail")
	public ResponseEntity<List<PlanDetailDTO>> detail(@RequestParam int plan_id) { //@RequestParam int plan_id
		return ResponseEntity.ok(planService.detail(plan_id));
	}

//	조달 계획 등록
	@PostMapping(value = "/register")
	public ResponseEntity<String> plan_register(@RequestBody PlanDTO planDTO) {
		
		planService.plan_Register(planDTO);
		
		planDTO.getProducts().forEach(product -> product.setPlan_id(planDTO.getPlan_id()));
		planDTO.getProducts().forEach(product -> planService.product_Register(product));
		
		return ResponseEntity.ok("등록 완료!");
	}
//	조달 계획 수정 폼 이동
	@GetMapping(value = "/update")
	public String updateForm() {
		
		return "update";
	}
//	조달 계획 수정
	@PostMapping(value = "/update")
	public String update() {
		
		return "redirect:list";
	}
//	조달 계획 삭제
	@PostMapping(value = "/delete")
	public ResponseEntity<String> delete(@RequestParam int plan_id) {
		planService.plan_Delete(plan_id);
		return ResponseEntity.ok("삭제 완료!");
	}
	
//	품목 리스트 (임시)
	@GetMapping(value = "/product_list")
	public ResponseEntity<List<PlanDetailDTO>> product_list(){
		
		return ResponseEntity.ok(planService.product_list());
	}
}
