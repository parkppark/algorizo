package co.algorizo.erp.procurement_plan.DTO;

import java.util.List;

public class PlanDTO {
	private int plan_id;
	private String plan_title;
	private String plan_writer;
	private String plan_regdate;
	private String plan_moddate;
	
	private List<PlanProductDTO> products;
	
	public PlanDTO() {
		
	}

	public PlanDTO(int plan_id, String plan_title, String plan_writer, String plan_regdate, String plan_moddate,
			List<PlanProductDTO> products) {
		super();
		this.plan_id = plan_id;
		this.plan_title = plan_title;
		this.plan_writer = plan_writer;
		this.plan_regdate = plan_regdate;
		this.plan_moddate = plan_moddate;
		this.products = products;
	}

	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}

	public String getplan_writer() {
		return plan_writer;
	}

	public void setplan_writer(String plan_writer) {
		this.plan_writer = plan_writer;
	}

	public String getPlan_regdate() {
		return plan_regdate;
	}

	public void setPlan_regdate(String plan_regdate) {
		this.plan_regdate = plan_regdate;
	}

	public String getplan_moddate() {
		return plan_moddate;
	}

	public void setplan_moddate(String plan_moddate) {
		this.plan_moddate = plan_moddate;
	}

	public List<PlanProductDTO> getProducts() {
		return products;
	}

	public void setProducts(List<PlanProductDTO> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "PlanDTO [plan_id=" + plan_id + ", plan_title=" + plan_title + ", plan_writer=" + plan_writer + ", plan_regdate="
				+ plan_regdate + ", plan_moddate=" + plan_moddate + ", products=" + products + "]";
	}
	
}
