package co.algorizo.erp.product;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDAO;
	@Override
	public void productinsert(ProductDTO productDTO) {
		productDAO.productinsert(productDTO);
	}
	@Override
	public List<ProductDTO> productlist() {
		// TODO Auto-generated method stub
		return productDAO.productlist();
	}
	@Override
	public ProductDTO getProductCode(String p_code) {
		return productDAO.getProductCode(p_code);
	}
	@Override
	public void productupdate(ProductDTO productDTO) {
		productDAO.productupdate(productDTO);
	}
	@Override
	public void productdelete(int p_id) {
		productDAO.productdelete(p_id);
	}
	@Override
	public String generateNextProductCode() {
		String lastProductCode = productDAO.getLastProductCode();
        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
        if (lastProductCode == null || !lastProductCode.startsWith("PD-" + today)) {
            return "PD-" + today + "-001";
        }
        int lastNumber = Integer.parseInt(lastProductCode.substring(12));
        return String.format("PD-%s-%03d", today, lastNumber + 1);
    }


}
