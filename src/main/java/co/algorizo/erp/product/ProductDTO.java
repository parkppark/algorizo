package co.algorizo.erp.product;

public class ProductDTO {
	private int p_id;
	private String p_lctg;
	private String p_mctg;
	private String p_sctg;
	private String p_code;
	private String p_name;
	private int p_price;
	private String p_content;
	private String p_regdate;
	private String p_moddate;
	private String p_img;
	
	public ProductDTO() {}

	public ProductDTO(int p_id, String p_lctg, String p_mctg, String p_sctg, String p_code, String p_name, int p_price,
			String p_content, String p_regdate, String p_moddate, String p_img) {
		super();
		this.p_id = p_id;
		this.p_lctg = p_lctg;
		this.p_mctg = p_mctg;
		this.p_sctg = p_sctg;
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_content = p_content;
		this.p_regdate = p_regdate;
		this.p_moddate = p_moddate;
		this.p_img = p_img;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_lctg() {
		return p_lctg;
	}

	public void setP_lctg(String p_lctg) {
		this.p_lctg = p_lctg;
	}

	public String getP_mctg() {
		return p_mctg;
	}

	public void setP_mctg(String p_mctg) {
		this.p_mctg = p_mctg;
	}

	public String getP_sctg() {
		return p_sctg;
	}

	public void setP_sctg(String p_sctg) {
		this.p_sctg = p_sctg;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}

	public String getP_moddate() {
		return p_moddate;
	}

	public void setP_moddate(String p_moddate) {
		this.p_moddate = p_moddate;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	@Override
	public String toString() {
		return "ProductDTO [p_id=" + p_id + ", p_lctg=" + p_lctg + ", p_mctg=" + p_mctg + ", p_sctg=" + p_sctg
				+ ", p_code=" + p_code + ", p_name=" + p_name + ", p_price=" + p_price + ", p_content=" + p_content
				+ ", p_regdate=" + p_regdate + ", p_moddate=" + p_moddate + ", p_img=" + p_img + "]";
	}
	
	
	

}
