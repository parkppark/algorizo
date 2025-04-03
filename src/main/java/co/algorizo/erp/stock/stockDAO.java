package co.algorizo.erp.stock;

import java.util.List;

public interface stockDAO {
	
	//재고 전체 목록
	List<stockDTO> list() throws Exception;
					
	//재고 상세 조회
	List<stockDTO> detail(int s_id) throws Exception;
					
	//재고 등록
	void register(stockDTO dto)throws Exception; 
					
	//재고 수정
	void update(stockDTO dto)throws Exception;
					
	//재고 삭제
	int delete(int s_id) throws Exception;
	
	//입고 처리
	void insertinstock(stockDTO stockdto) throws Exception;
	
	//출고 처리
	void insertoutstock(stockDTO stockdto) throws Exception;
	
	/*
	 * //입고 처리후 총합 업데이트 void updateintotal(int p_id, int p_price, int p_quantity)
	 * throws Exception; //출고 처리후 총합 업데이트 void updateouttotal(int p_id, int p_price,
	 * int p_quantity) throws Exception;
	 */
}
