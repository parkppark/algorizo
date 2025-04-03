package co.algorizo.erp.procurement_plan;

import java.util.List;

import co.algorizo.erp.procurement_plan.DTO.PlanDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanProductDTO;

public interface PlanDAO {
//	조달 계획 조회
	List<PlanDTO> list(int limit , int pageNum);
//	조달 계획 상세보기
	List<PlanDetailDTO> detail(int plan_id);
//	조달 계획 등록
	int plan_Register(PlanDTO planDTO);
//	조달 계획 품목 등록
	int product_Register(PlanProductDTO planProductDTO);
//	조달 계획 수정
	int update(PlanDetailDTO planDetailDTO);
//	조달 계획 삭제
	int plan_Delete(int plan_id);
//	계획 갯수
	int count();
//	품목 리스트 (나중에 다시 연동)
	List<PlanDetailDTO> product_list();
}
