package co.algorizo.erp.dept.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import co.algorizo.erp.dept.dto.DeptDTO;

@Repository
public class DeptDAOimpl implements DeptDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<DeptDTO> getDeptList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("co.algorizo.erp.deptMapper.getDeptList");
	}

}
