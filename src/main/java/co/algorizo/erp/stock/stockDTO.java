package co.algorizo.erp.stock;

import java.math.BigDecimal;

public class stockDTO {
	
	private int s_id;
	private int p_id;
	private String s_indate;
	private String s_outdate;
	private int s_quantity;
	private String s_status;
	private BigDecimal totalprice;
	private int del;
	private String etc;
	
	public stockDTO() {
		
	}

	public stockDTO(int s_id, int p_id,String s_indate, String s_outdate,
			int s_quantity, String s_status, BigDecimal totalprice, int del,String etc) {
		super();
		this.s_id = s_id;
		this.p_id = p_id;
		this.s_indate = s_indate;
		this.s_outdate = s_outdate;
		this.s_quantity = s_quantity;
		this.s_status = s_status;
		this.totalprice = totalprice;
		this.del = del;
		this.etc = etc;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getS_indate() {
		return s_indate;
	}

	public void setS_indate(String s_indate) {
		this.s_indate = s_indate;
	}

	public String getS_outdate() {
		return s_outdate;
	}

	public void setS_outdate(String s_outdate) {
		this.s_outdate = s_outdate;
	}

	public int getS_quantity() {
		return s_quantity;
	}

	public void setS_quantity(int s_quantity) {
		this.s_quantity = s_quantity;
	}

	public String getS_status() {
		return s_status;
	}

	public void setS_status(String s_status) {
		this.s_status = s_status;
	}

	public BigDecimal getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(BigDecimal totalprice) {
		this.totalprice = totalprice;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "stockDTO [s_id=" + s_id + ", p_id=" + p_id + ", s_indate=" + s_indate + ", s_outdate=" + s_outdate
				+ ", s_quantity=" + s_quantity + ", s_status=" + s_status + ", totalprice=" + totalprice + ", del="
				+ del + ", etc=" + etc + "]";
	}

}