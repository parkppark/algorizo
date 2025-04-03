package co.algorizo.erp.company;

import java.util.List;

public interface CompanyService {

	public List<CompanyDTO> companylist();
	public CompanyDTO getcompany(int cp_id);
	public void companyupdate(CompanyDTO companyDTO);
	public void companyinsert(CompanyDTO companyDTO);
	public void companydelete(int cp_id);
	public CompanyDTO selectCompany(int cp_id);
}
