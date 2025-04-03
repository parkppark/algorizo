package co.algorizo.erp.company;

import java.util.List;

import co.algorizo.erp.product.ProductDTO;

public interface CompanyDAO {
	
	public List<CompanyDTO> companylist();
	public CompanyDTO getcompany(int cp_id);
	public void companyupdate(CompanyDTO companyDTO);
	public void companyinsert(CompanyDTO companyDTO);
	public void companydelete(int cp_id);
}
