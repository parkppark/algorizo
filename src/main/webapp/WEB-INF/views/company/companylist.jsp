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
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <%@include file="../include/left_column.jsp"%>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>공급업체관리테이블</h3>
                            <p class="text-subtitle text-muted">알고리조</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/erp">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Table</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

                <!--  Inverse table start -->
                <section class="section">
                    <div class="row" id="table-inverse">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">공급업체 목록</h4>
                                </div>
                                <div class="card-content">
                                    <!-- table with light -->
                                    <div class="table-responsive">
                                        <table class="table table-light mb-0" id="table1">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">회사명</th>
                                                    <th class="text-center">업종</th>
                                                    <th class="text-center">대표이사</th>
                                                    <th class="text-center">대표전화</th>
                                                    <th class="text-center">팩스번호</th>
                                                    <th class="text-center">이메일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach var="company" items="${companylist}">
                                            		<tr>
                                            			<td>
                                            				<a href="${contextPath }/company/companydetail?cp_id=${company.cp_id}"
                                            				class="text-primary">${company.cp_name }</a>
                                            			</td>
                                            			<td>${company.cp_ctg}</td>
                                            			<td>${company.cp_manager}</td>
                                            			<td>${company.cp_pno }</td>
                                            			<td>${company.cp_fax}</td>
                                            			<td>${company.cp_mail}</td>
                                            		</tr>
                                            	</c:forEach>
                                                <!-- <tr>
                                                    <td class="text-bold-500">Michael Right</td>
                                                    <td>$15/hr</td>
                                                    <td class="text-bold-500">UI/UX</td>
                                                    <td>Remote</td>
                                                    <td>Austin,Taxes</td>
                                                    <td><a href="#"><i
                                                                class="badge-circle badge-circle-white text-secondary font-medium-1"
                                                                data-feather="mail"></i></a></td>
                                                </tr>
                                                 -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <footer>
                <%@include file="../include/footer.jsp"%>
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