package co.algorizo.erp.inbound;

import java.util.List;

public interface inboundService {
	
	//전체 입고
	List<inboundDTO> list() throws Exception;
	
	//입고 상세 조회
	List<inboundDTO> detail(int in_id) throws Exception;
	
	//입고 등록
	void register(inboundDTO dto)throws Exception; 
	
	//입고 수정
	void update(inboundDTO dto)throws Exception;
	
	//입고 삭제
	int delete(int in_id) throws Exception;
	
	void autoinboundcencel() throws Exception; 

	void autoinboundcomplete() throws Exception; 
}
