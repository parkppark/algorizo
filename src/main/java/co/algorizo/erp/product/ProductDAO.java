package co.algorizo.erp.product;

import java.util.List;

public interface ProductDAO {
	
	public void productinsert(ProductDTO productDTO);
	public List<ProductDTO> productlist();
	public ProductDTO getProductCode(String p_code);
	public void productupdate(ProductDTO productDTO);
	public void productdelete(int p_id);
	public String getLastProductCode();

}
