package co.algorizo.erp.outbound;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class outboundServicelmpl implements outboundService{
	
	@Autowired
	private outboundDAO outbounddao;

	@Override
	public List<outboundDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return outbounddao.list() ;
	}

	@Override
	public List<outboundDTO> detail(int out_id) throws Exception {
		// TODO Auto-generated method stub
		return outbounddao.detail(out_id);
	}

	@Override
	public void register(outboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		outbounddao.register(dto);
	}

	@Override
	public void update(outboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		outbounddao.update(dto);
		System.out.println("수정 service" + dto);
	}

	@Override
	public int delete(int out_id) throws Exception {
		// TODO Auto-generated method stub
		return outbounddao.delete(out_id);
	}

}
