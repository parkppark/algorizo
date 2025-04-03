package co.algorizo.erp.inbound;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class inboundDAOlmpl implements inboundDAO{

	
	@Autowired
	private SqlSession sqlsession;
	private static final String namespace = "co.algorizo.erp.inboundmapper";
	
	//전체 입고
	@Override
	public List<inboundDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".list");
	}

	//입고 상세 조회
	@Override
	public List<inboundDTO> detail(int in_id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(in_id);
		List<inboundDTO> S = sqlsession.selectList(namespace + ".detail",in_id); 
		System.out.println("dao"+S); 
		return S;
	}
	
	//입고 등록
	@Override
	public void register(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".register",dto);
		System.out.println("등록 dao"+dto);
		
	}
	
	//입고 수정
	@Override
	public void update(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("수정"+dto);
		sqlsession.update(namespace + ".update",dto);
	}

	//입고 삭제
	@Override
	public int delete(int in_id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("삭제"+in_id);
		return sqlsession.update(namespace + ".delete",in_id);
	}

	@Override
	public void autoinboundcencel() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void autoinboundcomplete() throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	
	
}
