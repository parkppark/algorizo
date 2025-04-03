package co.algorizo.erp.stock;

import java.util.List;

import co.algorizo.erp.stock.stockDTO;

public interface stockService {
	
		//전체 재고
		List<stockDTO> list() throws Exception;
				
		//재고 상세 조회
		List<stockDTO> detail(int s_id) throws Exception;
				
		//재고 등록
		void register(stockDTO dto)throws Exception; 
				
		//재고 수정
		void update(stockDTO dto)throws Exception;
				
		//재고 삭제
		int delete(int s_id) throws Exception;
		
		/*
		 * // 입고 처리 void handleIncomingStock(stockDTO dto) throws Exception;
		 * 
		 * // 출고 처리 void handleOutgoingStock(stockDTO dto) throws Exception;
		 */
}
