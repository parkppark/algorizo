<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="include/head.jsp" %>
</head>

<body>
    <%@include file="include/left_column.jsp" %>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
<!--        메인 컨텐트 -->
			<div class="main_title">
				<h1>조달 계획 조회</h1>
			</div>
			<div class="container">
				<div id="content" class="content">
					<table class="table">
					    <colgroup>
					        <col style="width: 10%;">  <!-- 번호 -->
					        <col style="width: 40%;">  <!-- 제목 -->
					        <col style="width: 20%;">  <!-- 작성자 -->
					        <col style="width: 30%;">  <!-- 등록일 -->
					    </colgroup>
						<thead>
							<tr>
								<td class="list_td">번호</td>
								<td class="list_td">제목</td>
								<td class="list_td">작성자</td>
								<td class="list_td">등록일</td>
							</tr>
						</thead>
						<tbody id="content_list">
							
						</tbody>
					</table>
				</div>
				<div class="registerButton">
					<button class="btn btn-primary rounded-pill" id="registerButton">계획 등록</button>
				</div>
				<div id="pageNum" class="pageNum">
					<ul class="pagination">
					    <c:forEach var="i" begin="1" end="${pagesize}">
					        <li class="page-item">
					            <a class="page-link" id="pageNum" href="#" data-page="${i}">${i}</a>
					        </li>
					    </c:forEach>
			  		</ul>
				</div>
			</div>
            <footer>
                <%@ include file="include/footer.jsp" %>
            </footer>
        </div>
<!--    상세보기 모달창 -->
		<div class="modal fade" id="plan_detail" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">조달 계획 조회</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<div id="view_mode">
							<div class="form_box">
								<form>
									<div class="form_title">
										<label for="detailTitle" class="form-label">계획 제목</label>
										<input type="text" class="form-control" id="detailTitle" readonly="readonly">
									</div>
									<div class="form_meta">
										<div class="form_writer">
											<label for="detailWriter" class="form-label">계획 작성자</label>
											<input type="text" class="form-control" id="detailWriter" readonly="readonly">
										</div>
										<div class="form_regdate">
											<label for="detailRegdate" class="form-label">계획 작성일</label>
											<input type="text" class="form-control" id="detailRegdate" readonly="readonly">
										</div>
									</div>
									<div class="form_product" id="form_product">
										<h5 class="modal-title">조달 품목</h5>
										<div class="table_box">
											<table class="table table-bordered">
												<colgroup>
													<col style="width: 20%;">
													<col style="width: 20%;">
													<col style="width: 20%;">
													<col style="width: 20%;">
													<col style="width: 20%;">
												</colgroup>
												<thead class="table-light">
													<tr>
														<td>품목명</td>
														<td>수량</td>
														<td>단가</td>
														<td>납기일</td>
														<td>소계</td>
													</tr>
												</thead>
												<tbody class="item_table_body">
													
												</tbody>
											</table>
										</div>
										<div id="register_product_button_div">
										</div>
										<div class="total_div" id="total_div">
											<h5 class="total_h5">총합계</h5>
											<strong class="total_strong" id="total_strong"></strong>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div id="update_mode" style="display: none">
							<div class="form_box">
								<form action="update" id="plan_update_form" method="post">
									<div class="form_title">
										<label for="updateTitle" class="form-label">계획 제목</label>
										<input type="text" class="form-control" id="updateTitle" required="required">
									</div>
									<div class="form_meta">
										<div class="form_writer">
											<label for="updateWriter" class="form-label">계획 작성자</label>
											<input type="text" class="form-control" id="updateWriter" value="로그인유저" readonly="readonly">
										</div>
										<div class="form_regdate">
											<label for="updateRegdate" class="form-label">계획 작성일</label>
											<input type="text" class="form-control" id="updateRegdate" readonly="readonly">
										</div>
									</div>
									<div class="form_product">
										<label for="item_table_body" class="form-label">조달 품목</label>
										<div class="table_box">
											<table class="table table-bordered">
												<colgroup>
													<col style="width: 20%;">
													<col style="width: 10%;">
													<col style="width: 20%;">
													<col style="width: 20%;">
													<col style="width: 20%;">
													<col style="width: 10%;">
												</colgroup>
												<thead class="table-light">
													<tr>
														<td>품목명</td>
														<td>수량</td>
														<td>단가</td>
														<td>납기일</td>
														<td>소계</td>
														<td>비고</td>
													</tr>
												</thead>
												<tbody id="update_table_body">
													
												</tbody>
											</table>
										</div>
										<div class="register_product_button_div">
											<button type="button" class="btn btn-secondary" data-mode="update">+ 품목 추가</button>
										</div>
										<div class="total_div" id="total_div">
											<h5 class="total_h5">총합계</h5>
											<strong class="total_strong" id="register_total_strong">0 원</strong>
										</div>
									</div>
									<div class="submit_button">
										<button type="submit" class="btn btn-secondary custom">저장</button>
										<button type="button" class="btn btn-secondary custom">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer" id="modal-footer">
						<button type="button" class="btn btn-outline-secondary" id="plan_update">수정</button>
						<button type="button" class="btn btn-outline-secondary" id="plan_delete" onclick="isDelete()">삭제</button>
					</div>
				</div>
			</div>
		</div>
<!-- 	계획 등록 모달창 -->
		<div class="modal fade" id="plan_register" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">조달 계획 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<div class="form_box">
							<form action="register" id="plan_register_form" method="post">
								<div class="form_title">
									<label for="registerTitle" class="form-label">계획 제목</label>
									<input type="text" class="form-control" id="registerTitle" required="required">
								</div>
								<div class="form_meta">
									<div class="form_writer">
										<label for="registerWriter" class="form-label">계획 작성자</label>
										<input type="text" class="form-control" id="registerWriter" value="로그인유저" readonly="readonly">
									</div>
									<div class="form_regdate">
										<label for="registerRegdate" class="form-label">계획 작성일</label>
										<input type="text" class="form-control" id="registerRegdate" readonly="readonly">
									</div>
								</div>
								<div class="form_product">
									<label for="item_table_body" class="form-label">조달 품목</label>
									<div class="table_box">
										<table class="table table-bordered">
											<colgroup>
												<col style="width: 20%;">
												<col style="width: 10%;">
												<col style="width: 20%;">
												<col style="width: 20%;">
												<col style="width: 20%;">
												<col style="width: 10%;">
											</colgroup>
											<thead class="table-light">
												<tr>
													<td>품목명</td>
													<td>수량</td>
													<td>단가</td>
													<td>납기일</td>
													<td>소계</td>
													<td>비고</td>
												</tr>
											</thead>
											<tbody id="item_table_body">
												
											</tbody>
										</table>
									</div>
									<div class="register_product_button_div">
										<button type="button" class="btn btn-secondary" data-mode="register">+ 품목 추가</button>
									</div>
									<div class="total_div" id="total_div">
										<h5 class="total_h5">총합계</h5>
										<strong class="total_strong" id="register_total_strong">0 원</strong>
									</div>
								</div>
								<div class="submit_button">
									<button type="submit" class="btn btn-secondary custom">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
    <!-- 플러그인 -->
    <%@ include file="include/plugin.jsp" %>
    <script>
//     	계획 조회
	    async function list(pageNum = "1") {
	        try{
	            const response = await fetch(`http://localhost:8080/erp/plans/listData?pageNum=\${pageNum}` , {
	                method : "GET" ,
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리중 오류 발생");
	            }
	
	            const data = await response.json();
	            
	            const content_list = document.getElementById("content_list");
	            content_list.innerHTML = "";
	            
	            data.forEach(plan => {
	                const tr_content = document.createElement("tr");
	                tr_content.innerHTML = `
	                    <td class="list_td">\${plan.plan_id}</td>
	                    <td class="list_td"><a href="#" class="plan_title" data-id="\${plan.plan_id}"> \${plan.plan_title} </a></td>
	                    <td class="list_td">\${plan.plan_writer}</td>
	                    <td class="list_td">\${plan.plan_regdate}</td>
	                `
	                content_list.appendChild(tr_content);
	            });
	            
		        document.querySelectorAll(".plan_title").forEach(plan => {
		            plan.addEventListener("click" , function(event) {
		                event.preventDefault();
		                
		                const plan_id = this.getAttribute("data-id");
		                
		                const modal_div = document.getElementById("plan_detail");
		                const modal = new bootstrap.Modal(modal_div);
		                modal.show();
		                
	                    detail(plan_id);
		            }); 
		        });
	    
	        } catch(error) {
	            console.error("데이터 처리중 오류 발생" , error);
	        }
	    }
// 		계획 조회 탭 진입 시 리스트 보여주기
	    document.addEventListener("DOMContentLoaded" , () => {
	        list();
	        
	    });
	    
//      계획 상세보기
        async function detail(plan_id) {
            try{
                const response = await fetch(`http://localhost:8080/erp/plans/detail?plan_id=\${plan_id}` , {
                    method : "GET" , 
                    headers : {"Content-Type" : "application/json"}
                });

                if(!response.ok){
                    throw new Error("데이터 처리중 오류 발생");
                }

                const data = await response.json();
//              데이터 값 초기화
                const tbody = document.querySelector(".item_table_body");
                tbody.innerHTML = "";
                
                const total_strong = document.getElementById("total_strong");
                total_strong.innerHTML = "0 원";
                
                const detailTitle = document.getElementById("detailTitle");
                detailTitle.value = "";
                detailTitle.setAttribute("data-id" , plan_id);
                const detailWriter = document.getElementById("detailWriter");
                detailWriter.value = "";
                const detailRegdate = document.getElementById("detailRegdate");
                detailRegdate.value = "";
                
                if(data === null || data === ""){
                	return;
                } 

                let total_price = 0;
                
                detailTitle.value = `\${data[0].plan_title}`;
                detailWriter.value = `\${data[0].plan_writer}`;
                detailRegdate.value = `\${data[0].plan_regdate}`;

                data.forEach(plan => {
                    const tr_plan = document.createElement("tr");
                    const pp_total_price = parseInt(plan.pp_total_price).toLocaleString('ko-KR');
                    const price = parseInt(plan.p_price).toLocaleString('ko-KR');
                    tr_plan.innerHTML = `
                        <td class="p_name" data-id="\${plan.p_id}">\${plan.p_name}</td>
                        <td class="pp_quantity">\${plan.pp_quantity}</td>
                        <td class="p_price">\${price}</td>
                        <td class="pp_delivery_date">\${plan.pp_delivery_date}</td>
                        <td class="pp_total_price">\${pp_total_price}</td>
                    `
                    
                    tbody.appendChild(tr_plan);
                	total_price += parseInt(plan.pp_total_price);
                });
                
                total_strong.innerHTML = total_price.toLocaleString('ko-KR') + " 원";
                
            } catch(error){
                console.error("데이터 처리중 오류 발생" , error);
            }
        }
// 	    페이지 번호 선택 시 데이터 리스트
	    document.querySelectorAll(".page-link").forEach(page => {
	        page.addEventListener("click" , function(event) {
	            event.preventDefault();
	
	            const pageNum = this.getAttribute("data-page");
	
	            list(pageNum);
	        });
	    });
// 	    계획 등록 모달창
        document.getElementById("registerButton").addEventListener("click" , async () => {
            const plan_register = document.getElementById("plan_register");
            const modal = new bootstrap.Modal(plan_register);
            modal.show();
            
            const tbody = document.getElementById("item_table_body");
            document.getElementById("register_total_strong").innerHTML = "0 원";
            tbody.innerHTML = "";
            const row = register_Row(tbody);
            const products = await product_list();
            product_Select_Data(products , row);
            bind_event(row , tbody);
        });

//      품목 추가
        async function register_product(tbody){
	    	const rowLength = tbody.querySelectorAll("tr").length;
	        const products = await product_list();
	        if(products.length !== rowLength){
	        	const row = register_Row(tbody);
	            product_Select_Data(products , row);
	            bind_event(row , tbody);
	        } else {
	        	alert("전체 상품 갯수보다 행을 더 추가할 수 없습니다.");
	        }
        }
        
//      행 생성
		function register_Row(tbody){
            const product_tr = document.createElement("tr");
            product_tr.innerHTML = `
                <td>
                <select class="form-select" id="form-select" name="product_p_id[]" required="required">
                </select>
                </td>
                <td><input type="text" class="form-control" name="product_quantity[]" required="required"></td>
                <td><input type="text" class="form-control" name="product_price[]" readonly="readonly"></td>
                <td><input type="datetime-local" class="form-control" name="product_delivery_date[]" required="required"></td>
                <td><input type="text" class="form-control" name="product_total_price[]" readonly="readonly"></td>
                <td><input type="button" class="btn btn-danger btn-sm" value="삭제"></td>
            `
            tbody.appendChild(product_tr);
            
            return product_tr;
		}
		
//      품목 리스트 조회
        async function product_list() {
        	try{
	            const response = await fetch("http://localhost:8080/erp/plans/product_list" , {
	                method : "GET" , 
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리 오류");
	            }
				// 품목 리스트 데이터 리턴
				const data = await response.json();
	            return data;
	
        	} catch(error) {
        		console.error("오류 발생" , error);
        	}
        }

//      품목 select 데이터
        function product_Select_Data(products , row){
           	const select = row.querySelector(".form-select");
            select.innerHTML = `<option value="">품목을 선택 해주세요</option>`;

            products.forEach(product => {
                const product_option = document.createElement("option");
                product_option.value = `\${product.p_id}`;
                product_option.text = `\${product.p_name}`;
                product_option.setAttribute("data-price" , `\${product.p_price}`);

                select.appendChild(product_option);
            });
        }
//      이벤트 바인딩
        function bind_event(row , tbody){
        	const deleteButton = row.querySelector(".btn-sm");
        	const select = row.querySelector(".form-select");
        	const quantity = row.querySelector('input[name="product_quantity[]"]');
			//	품목 삭제
            deleteButton.addEventListener("click" , () => {
                const item_table_body = document.getElementById("item_table_body");                
                
                if(item_table_body.children.length === 1){
                    row.querySelector(".form-select").value = "";
                    row.querySelector('input[name="product_quantity[]"]').value = "";
                    row.querySelector('input[name="product_price[]"]').value = "";
                    row.querySelector('input[name="product_price[]"]').dataset.value = "";
                    row.querySelector('input[name="product_delivery_date[]"]').value = "";
                    row.querySelector('input[name="product_total_price[]"]').value = "";
                    row.querySelector('input[name="product_total_price[]"]').dataset.value = "";
                } else {
                    item_table_body.removeChild(row);
                }
                
                total_price();
            });
			//	품목 데이터 가져오기
            select.addEventListener("change" , ()=> {
                const selectOption = select.options[select.selectedIndex];
                const price = selectOption.getAttribute("data-price");
                
                const product_price = row.querySelector('input[name="product_price[]"]');
                product_price.value = parseInt(price).toLocaleString('ko-KR');
                product_price.setAttribute("data-value" , price);
                
                sub_total_price(quantity , row);
            });
// 			수량 변동 시
            quantity.addEventListener("change" , () => {
            	sub_total_price(quantity , row);
            });
//          숫자만 입력 가능
            quantity.addEventListener("input" , () => {
	            if(!parseInt(quantity.value)){
	        		quantity.value = "";
	        	}
            });
//          품목추가 버튼 누를 시 (등록)
            document.querySelector('.btn-secondary[data-mode="register"]').addEventListener("click" , () => {
            	register_product(tbody);
            });
//          품목추가 버튼 누를 시 (수정)
            document.querySelector('.btn-secondary[data-mode="update"]').addEventListener("click" , () => {
            	register_product(tbody);
            });
        }
        
//    	소계 계산
		function sub_total_price(quantity , row){
                const select_quantity = parseInt(quantity.value || 0);
                const price = row.querySelector('input[name="product_price[]"]').dataset.value;
                const subTotal_price = row.querySelector('input[name="product_total_price[]"]');
                if(quantity.value === ""){
                	subTotal_price.value = "";
                	subTotal_price.dataset.value = "";
                } else {
	                subTotal_price.value = (parseInt(select_quantity) * parseInt(price)).toLocaleString('ko-KR');
	                subTotal_price.setAttribute("data-value" , parseInt(select_quantity) * parseInt(price));
                }
                
                total_price();
		}
		
// 		총합계 계산
		function total_price(){
	        const register_total_strong = document.getElementById("register_total_strong");
	        let total_price = 0;
	        document.querySelectorAll('input[name="product_total_price[]"]').forEach(update_price => {
	            total_price += parseInt(update_price.dataset.value || 0);
	        });
	        
	        register_total_strong.innerHTML = total_price.toLocaleString('ko-KR') + " 원";
		}
// 		작성일 자동 입력
        const regdate = document.getElementById("registerRegdate");
        const today = new Date();
        
        const year = today.getFullYear();
        const month = "0" + (today.getMonth() + 1);
        const day = today.getDate();

        regdate.value = year + "-" + month + "-" + day;
        
//      계획 등록
        document.getElementById("plan_register_form").addEventListener("submit" , async function(event) {
            event.preventDefault();
            const title = document.getElementById("registerTitle").value;
            const writer = document.getElementById("registerWriter").value;

            const tbody = document.querySelectorAll("#item_table_body tr");
            const products = [];
            
            tbody.forEach(row => {
            	products.push({
                    p_id: parseInt(row.querySelector('select[name="product_p_id[]"]').value) ,
                    pp_quantity: parseInt(row.querySelector('input[name="product_quantity[]"]').value) ,
                    pp_delivery_date: row.querySelector('input[name="product_delivery_date[]"]').value ,
                    pp_total_price: parseInt(row.querySelector('input[name="product_total_price[]"]').dataset.value)
                });
            });
            
            const planData = {
           		plan_title : title ,
           		plan_writer : writer ,
            	products : products
            }
            try{
	            const response = await fetch("http://localhost:8080/erp/plans/register" , {
	                method : "POST" ,
	                headers : {"Content-Type" : "application/json"} ,
	                body : JSON.stringify(planData)
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리 오류");
	            }
				
	            location.href="list";
            } catch(error) {
            	console.error("오류 발생", error);
            }
        });
        
//      삭제 confirm 
        function isDelete(){
            if(confirm("정말 삭제하시겠습니까 ?")){
                plan_delete();
            }
        }
//     	계획 삭제
		async function plan_delete() {
            const plan_id = document.getElementById("detailTitle").dataset.id;
            try{
	            const response = await fetch(`http://localhost:8080/erp/plans/delete?plan_id=\${plan_id}` , {
	                method : "POST" ,
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리 오류");
	            }
	
	            location.href = "list";
            } catch(error) {
            	console.error("오류 발생" , error);
            }
		}

	</script>
</body>
</html>