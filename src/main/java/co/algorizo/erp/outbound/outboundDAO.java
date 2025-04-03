package co.algorizo.erp.outbound;

import java.util.List;

import co.algorizo.erp.outbound.outboundDTO;

public interface outboundDAO {
	
		//전체 출고
		List<outboundDTO> list() throws Exception;
		
		//출고 상세 조회
		List<outboundDTO> detail(int out_id) throws Exception;
		
		//출고 등록
		void register(outboundDTO dto)throws Exception; 
		
		//출고 수정
		void update(outboundDTO dto)throws Exception;
		
		//출고 삭제
		int delete(int out_id) throws Exception;


}
