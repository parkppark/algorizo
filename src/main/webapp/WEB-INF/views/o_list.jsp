<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="include/head.jsp"%>
<style>
.dataTable-new {
	display: flex;
	align-items: center;
}
</style>
</head>
<body>
	<%@include file="include/left_column.jsp"%>
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
						<h3>DataTable</h3>
						<p class="text-subtitle text-muted">For user to check they
							list</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">DataTable</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header"><h3>출고 목록</h3></div>
					<div class="card-body">
						<div
							class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
							<div class="dataTable-top">
							<div class="dataTable-dropdown" style="display: flex; justify-content: space-between;">
								<div class="dataTable-new">
									<select class="dataTable-selector form-select" style="width:70px; margin-right: 5px;"><option
											value="5">5</option>
										<option value="10" selected="">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option></select><label>entries per page</label>
								</div>		
								<div class="dataTable-search">
									<input class="dataTable-input" placeholder="Search..."
										type="text">
								</div>
							</div>
							</div>
							<div class="dataTable-container">
								<table class="table table-striped dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 12.8%;"><a href="#"
												class="dataTable-sorter">출고 아이디</a></th>
											<th data-sortable="" style="width: 12.8667%;"><a
												href="#" class="dataTable-sorter">출고 날짜</a></th>
											<th data-sortable="" style="width: 25.8667%;"><a
												href="#" class="dataTable-sorter">출고 상태</a></th>
											<th data-sortable="" style="width: 11.1333%;"><a
												href="#" class="dataTable-sorter">비고</a></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="in" items="${list}">
											<tr>
												<td><a href="o_detail?out_id=${in.out_id}">${in.out_id}</td>
												<script>
													console.log("출고 아이디: "
															+ "${in.out_id}");
												</script>
												<td>${in.out_date}</td>
												<td>${in.out_status}</td>
												<td>${in.etc}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="dataTable-bottom">
								<div class="dataTable-info"></div>
								<ul
									class="pagination pagination-primary float-end dataTable-pagination">
									<li class="page-item pager"><a href="#" class="page-link"
										data-page="1">‹</a></li>
									<li class="page-item active"><a href="#" class="page-link"
										data-page="1">1</a></li>
									<li class="page-item"><a href="#" class="page-link"
										data-page="2">2</a></li>
									<li class="page-item"><a href="#" class="page-link"
										data-page="3">3</a></li>
									<li class="page-item pager"><a href="#" class="page-link"
										data-page="2">›</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<script
			src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>
		<script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
		<script>
			// Simple Datatable
			let table1 = document.querySelector('#table1');
			let dataTable = new simpleDatatables.DataTable(table1);
		</script>
		<script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
		<footer>
			<%@ include file="include/footer.jsp"%>
		</footer>
	</div>
	<%@ include file="include/plugin.jsp"%>
</body>

</html>
