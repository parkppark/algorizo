package co.algorizo.erp.procurement_plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.algorizo.erp.procurement_plan.DTO.PlanDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanProductDTO;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	private PlanDAO planDAO;
//	조달 계획 조회
	@Override
	public List<PlanDTO> list(int limit, int pageNum) {
		// TODO Auto-generated method stub
		return planDAO.list(limit , pageNum);
	}
//	조달 계획 상세보기
	@Override
	public List<PlanDetailDTO> detail(int plan_id) {
		// TODO Auto-generated method stub
		return planDAO.detail(plan_id);
	}
//	조달 계획 등록
	@Override
	public boolean plan_Register(PlanDTO planDTO) {
		// TODO Auto-generated method stub
		int success = planDAO.plan_Register(planDTO);
		
		if(success == 0) {
			return false;
		} else {
			return true;
		}
	}
//	조달 계획 품목 등록
	@Override
	public boolean product_Register(PlanProductDTO planProductDTO) {
		// TODO Auto-generated method stub
		int success = planDAO.product_Register(planProductDTO);
		
		if(success == 0) {
			return false;
		} else {
			return true;
		}
	}
//	조달 계획 수정
	@Override
	public boolean update(PlanDetailDTO planDetailDTO) {
		// TODO Auto-generated method stub
		int success = planDAO.update(planDetailDTO);
		
		if(success == 0) {
			return false;
		} else {
			return true;
		}
	}
//	조달 계획 삭제
	@Override
	public boolean plan_Delete(int plan_id) {
		// TODO Auto-generated method stub
		int success = planDAO.plan_Delete(plan_id);
		
		if(success == 0) {
			return false;
		} else {
			return true;
		}
	}
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return planDAO.count();
	}
	@Override
	public List<PlanDetailDTO> product_list() {
		// TODO Auto-generated method stub
		return planDAO.product_list();
	}

}
