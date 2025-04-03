package co.algorizo.erp.inbound;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class inboundServicelmpl implements inboundService{
	
	@Autowired
	private inboundDAO inbounddao;

	//전체 입고
	@Override
	public List<inboundDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return inbounddao.list();
	}

	//입고 상세 조회
	@Override
	public List<inboundDTO> detail(int in_id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(in_id);
		List<inboundDTO> dto = inbounddao.detail(in_id);
		System.out.println("service"+ dto);
		return dto;
	}
	
	//입고 등록
	@Override
	public void register(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		inbounddao.register(dto);
		System.out.println("등록service"+dto);
	}

	//입고 수정
	@Override
	public void update(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("수정" + dto);
		inbounddao.update(dto);
	}

	//입고 삭제
	@Override
	public int delete(int in_id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("삭제" + in_id);
	return inbounddao.delete(in_id);
	}

	@Override
	@Scheduled(cron = "0 30 9 * * ?")
	public void autoinboundcencel() throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void autoinboundcomplete() throws Exception {
		// TODO Auto-generated method stub
		
	}


}
