package co.algorizo.erp.outbound;

public class outboundDTO {

	private int out_id;
	private int p_id;
	private String out_date;
	private String update_date;
	private String out_status;
	private String etc;
	private int del;

	public outboundDTO() {

	}

	public outboundDTO(int out_id, int p_id, String out_date, String update_date, String out_status, String etc,
			int del) {
		super();
		this.out_id = out_id;
		this.p_id = p_id;
		this.out_date = out_date;
		this.update_date = update_date;
		this.out_status = out_status;
		this.etc = etc;
		this.del = del;
	}

	public int getOut_id() {
		return out_id;
	}

	public void setOut_id(int out_id) {
		this.out_id = out_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getOut_date() {
		return out_date;
	}

	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getOut_status() {
		return out_status;
	}

	public void setOut_status(String out_status) {
		this.out_status = out_status;
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

	@Override
	public String toString() {
		return "outboundDTO [out_id=" + out_id + ", p_id=" + p_id + ", out_date=" + out_date + ", update_date="
				+ update_date + ", out_status=" + out_status + ", etc=" + etc + ", del=" + del + "]";
	}

	
}