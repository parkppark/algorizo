package co.algorizo.erp.procurement_plan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.algorizo.erp.procurement_plan.DTO.PlanDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanProductDTO;

@Repository
public class PlanDAOImpl implements PlanDAO {
	private static final String namespace = "co.algorizo.erp.PlanMapper";
	@Autowired
	private SqlSession sqlSession;
//	조달 계획 조회
	@Override
	public List<PlanDTO> list(int limit , int pageNum) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", (pageNum - 1) * limit);
		return sqlSession.selectList(namespace + ".list" , map);
	}
//	조달 계획 상세보기
	@Override
	public List<PlanDetailDTO> detail(int plan_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".detail", plan_id);
	}
//	조달 계획 등록
	@Override
	public int plan_Register(PlanDTO planDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".plan_register", planDTO);
	}
//	조달 계획 품목 등록
	@Override
	public int product_Register(PlanProductDTO planProductDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".product_register", planProductDTO);
	}
//	조달 계획 수정
	@Override
	public int update(PlanDetailDTO planDetailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".update", planDetailDTO);
	}
//	조달 계획 삭제
	@Override
	public int plan_Delete(int plan_id) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + ".delete", plan_id);
	}
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".count");
	}
	@Override
	public List<PlanDetailDTO> product_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".product_list");
	}
}
