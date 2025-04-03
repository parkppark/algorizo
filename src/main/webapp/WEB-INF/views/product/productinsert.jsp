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
							<h3>품목등록</h3>
							<p class="text-subtitle text-muted">Multiple form layout you
								can use</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">자재관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">품목등록</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!-- Basic Horizontal form layout section start -->
				<section id="basic-horizontal-layouts">
					<div class="row match-height">
						<div class="col-md-12 col-12">
							<!-- 화면 전체를 차지하도록 수정 -->
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">자재관리 | 품목등록</h4>
								</div>
								<div class="card-content">
									<div class="card-body">
										<form class="form form-horizontal"
											action="/erp/product/productinsert" method="post">
											<div class="form-body">
												<div class="row">
													<div class="col-md-2">
														<label>대분류</label>
													</div>
													<div class="col-md-10 form-group">
														<select id="category" class="form-control" name="p_lctg"
															required>
															<option value="" disabled selected>선택</option>
															<option value="자동차">자동차</option>
															<option value="전자제품">전자제품</option>
														</select>
													</div>

													<div class="col-md-2">
														<label>중분류</label>
													</div>
													<div class="col-md-10 form-group">
														<select id="subcategory" class="form-control"
															name="p_mctg" required>
															<option value="" disabled selected>선택</option>
															<option value="부품">부품</option>
														</select>
													</div>

													<div class="col-md-2">
														<label>소분류</label>
													</div>
													<div class="col-md-10 form-group">
														<select id="item" class="form-control" name="p_sctg"
															required>
															<option value="" disabled selected>선택</option>
															<option value="바퀴">바퀴</option>
															<option value="창문">창문</option>
															<option value="뚜껑">뚜껑</option>
														</select>
													</div>

													<div class="col-md-2">
														<label>발주코드</label>
													</div>
													<div class="col-md-10 form-group">
														<input type="hidden" name="p_code"
															value="${nextProductCode}"> <input type="text"
															class="form-control" id="p_code" readonly="readonly"
															value="${nextProductCode}">
													</div>

													<div class="col-md-2">
														<label>품목명</label>
													</div>
													<div class="col-md-10 form-group">
														<input type="text" class="form-control" name="p_name"
															required>
													</div>

													<div class="col-md-2">
														<label>제품소개</label>
													</div>
													<div class="col-md-10 form-group">
														<textarea class="form-control" name="p_content" rows="3"></textarea>
													</div>

													<div class="col-md-2">
														<label>판매단가</label>
													</div>
													<div class="col-md-10 form-group">
														<input type="number" class="form-control" name="p_price"
															required>
													</div>


													<div class="col-md-2">
														<label>작성일</label>
													</div>
													<div class="col-md-10 form-group">
														<input type="text" class="form-control" name="p_regdate"
															readonly>
													</div>

													<div class="col-md-2">
														<label>수정일</label>
													</div>
													<div class="col-md-10 form-group">
														<input type="text" class="form-control" name="p_moddate"
															readonly>
													</div>

													<div class="col-sm-12 d-flex justify-content-end">
														<button type="submit" class="btn btn-primary me-1 mb-1">품목등록</button>
														<button type="button"
															onclick="location.href='product/productlist'"
															class="btn btn-primary me-1 mb-1">목록</button>
														<button type="reset"
															class="btn btn-light-secondary me-1 mb-1">초기화</button>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

				</section>
				<!-- // Basic multiple Column Form section end -->
			</div>

			<footer>
				<%@include file="../include/footer.jsp"%>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


	<%@include file="../include/plugin.jsp"%>


</body>
</html>
