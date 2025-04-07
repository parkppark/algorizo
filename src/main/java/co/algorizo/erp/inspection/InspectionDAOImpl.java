package co.algorizo.erp.inspection;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InspectionDAOImpl implements InspectionDAO{
	private static final String namespace = "co.algorizo.erp.inspectionMapper";
	@Autowired
	private SqlSession sqlSession;
<<<<<<< HEAD
<<<<<<< HEAD
//	검수 목록 조회 아아아아
=======

>>>>>>> parent of 403c62a (inspectionDAOImpl 주석 추가)
=======

>>>>>>> parent of 403c62a (inspectionDAOImpl 주석 추가)
	@Override
	public List<InspectionDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list");
	}

	@Override
	public InspectionDTO detail(int i_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".detail", i_id);
	}

	@Override
	public void register(InspectionDTO inspectionDTO) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".register", inspectionDTO);
	}

	@Override
	public void update(InspectionDTO inspectionDTO) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".update", inspectionDTO);
	}

	@Override
	public void delete(int i_id) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", i_id);
	}

	@Override
	public String registerCode(String prefix) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".registerCode", prefix);
	}

}
