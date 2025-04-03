<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="../include/head.jsp"%>
</head>

<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="sidebar-header">
					<div class="d-flex justify-content-between">
						<div class="logo">
							<a href="/erp"><img
								src="${contextPath }/resources/static/dist/assets/images/logo/logo.png"
								alt="Logo" srcset=""></a>
						</div>
						<div class="toggler">
							<a href="#" class="sidebar-hide d-xl-none d-block"><i
								class="bi bi-x bi-middle"></i></a>
						</div>
					</div>
				</div>
				<%@include file="../include/left_column.jsp"%>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>품목관리</h3>
							<p class="text-subtitle text-muted">알고리조 컴퍼니 품목관리 화면</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/erp">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">DataTable</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-header">Simple Datatable</div>
						<div class="card-body">
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
										<th class="text-center">품목번호</th>
										<th class="text-center">품목코드</th>
										<th class="text-center">대분류</th>
										<th class="text-center">중분류</th>
										<th class="text-center">소분류</th>
										<th class="text-center">품목명</th>
										<th class="text-center">판매단가</th>
										<th class="text-center">입고일</th>
										<th class="text-center">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${productlist }">
										<tr>
											<td>${product.p_id}</td>
											<td><a
												href="${contextPath }/product/productdetail?p_code=${product.p_code}"
												class="text-primary"> ${product.p_code} </a></td>
											<td>${product.p_lctg}</td>
											<td>${product.p_mctg }</td>
											<td>${product.p_sctg }</td>
											<td>${product.p_name }</td>
											<td>${product.p_price }</td>
											<td>${product.p_regdate }</td>
											<td><span class="badge bg-success">Active</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-sm-12 d-flex justify-content-end">
								<button type="button" onclick="location.href='productinsert'"
									class="btn btn-primary me-1 mb-1">품목등록</button>
							</div>
						</div>
					</div>
				</section>

				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
					$(document)
							.ready(
									function() {
										// 대분류 클릭 시 드롭다운 표시/숨김
										$("#LctgHeader").click(function(event) {
											event.stopPropagation(); // 이벤트 버블링 방지
											$("#LctgList").toggle();
										});

										// 드롭다운에서 항목 선택 시 필터링
										$(".Lctg-item")
												.click(
														function() {
															var selectedCategory = $(
																	this).data(
																	"category");

															$(
																	"#table1 tbody tr")
																	.each(
																			function() {
																				var rowCategory = $(
																						this)
																						.find(
																								"td:nth-child(1)")
																						.text()
																						.trim();

																				if (selectedCategory === ""
																						|| rowCategory === selectedCategory) {
																					$(
																							this)
																							.show();
																				} else {
																					$(
																							this)
																							.hide();
																				}
																			});

															// 드롭다운 숨기기
															$("#LctgList")
																	.hide();
														});

										// 화면의 다른 곳 클릭 시 드롭다운 숨김
										$(document).click(function() {
											$("#LctgList").hide();
										});
									});
				</script>
			</div>

	       <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>2021 &copy; Mazer</p>
                    </div>
                    <div class="float-end">
                        <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                href="http://ahmadsaugi.com">A. Saugi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

    <script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
    <script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>

    <script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
</body>

</html>