package co.algorizo.erp.inbound;

import java.time.LocalDate;
import java.time.LocalDateTime;

import co.algorizo.erp.product.ProductDTO;

public class inboundDTO {
	
		private int in_id;            // 입고 기록 고유 ID
	    private int p_id;             // 상품 ID
	    private String in_date; // 생성 날짜 (날짜와 시간 필요)
	    private String update_date; // 수정 날짜 (날짜와 시간 필요)
	    private String in_status;     // 입고 상태
	    private int in_quantity;     // 입고 상태
	    private String etc;           // 비고
	    private int del;      		//삭제
	    
	    private ProductDTO productDTO;
	
	public inboundDTO() {
		
	}

	public inboundDTO(int in_id, int p_id, String in_date, String update_date, String in_status, int in_quantity,
			String etc, int del, ProductDTO productDTO) {
		super();
		this.in_id = in_id;
		this.p_id = p_id;
		this.in_date = in_date;
		this.update_date = update_date;
		this.in_status = in_status;
		this.in_quantity = in_quantity;
		this.etc = etc;
		this.del = del;
		this.productDTO = productDTO;
	}

	public int getIn_id() {
		return in_id;
	}

	public void setIn_id(int in_id) {
		this.in_id = in_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getIn_status() {
		return in_status;
	}

	public void setIn_status(String in_status) {
		this.in_status = in_status;
	}

	public int getIn_quantity() {
		return in_quantity;
	}

	public void setIn_quantity(int in_quantity) {
		this.in_quantity = in_quantity;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public ProductDTO getProductDTO() {
		return productDTO;
	}

	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}

	@Override
	public String toString() {
		return "inboundDTO [in_id=" + in_id + ", p_id=" + p_id + ", in_date=" + in_date + ", update_date=" + update_date
				+ ", in_status=" + in_status + ", in_quantity=" + in_quantity + ", etc=" + etc + ", del=" + del
				+ ", productDTO=" + productDTO + "]";
	}

}