package co.algorizo.erp.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class stockServicelmpl implements stockService{
	
	@Autowired
	private stockDAO stockdao;

	//재고 전체 조회
	@Override
	public List<stockDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return stockdao.list();
	}
	//재고 상세 정보
	@Override
	public List<stockDTO> detail(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return stockdao.detail(s_id);
	}
	//재고 등록
	@Override
	public void register(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		stockdao.register(dto);
	}
	//재고 수정
	@Override
	public void update(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		stockdao.update(dto);
	}
	//재고 삭제
	@Override
	public int delete(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return stockdao.delete(s_id);
	}
	/*
	 * @Override public void handleIncomingStock(stockDTO dto) throws Exception { //
	 * TODO Auto-generated method stub stockdao.insertinstock(dto);
	 * stockdao.updateintotal(dto.getP_id(),dto.getP_price(),dto.getS_quantity()); }
	 * 
	 * @Override public void handleOutgoingStock(stockDTO dto) throws Exception { //
	 * TODO Auto-generated method stub stockdao.insertoutstock(dto);
	 * stockdao.updateouttotal(dto.getP_id(),dto.getP_price(),dto.getS_quantity());
	 * }
	 */

}
