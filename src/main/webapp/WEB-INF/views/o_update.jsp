<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="include/head.jsp"%>
<%@ include file="include/plugin.jsp"%>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
}

.max-w-4xl {
	max-width: 100%;
}

.detail-container {
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	border-radius: 8px;
	width: 600px;
	margin: 30px auto;
}

h1 {
	font-size: 1.75rem;
	font-weight: bold;
	margin-bottom: 20px;
	text-align: center;
}

.detail-section {
	display: flex;
	flex-direction: column;
	margin-top: 20px;
}

.detail-item {
	margin-bottom: 15px;
	padding: 15px;
	background-color: #fafafa;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	font-size: 1rem;
}

.detail-item label {
	font-weight: bold;
	margin-right: 10px;
}

.detail-item span {
	word-wrap: break-word;
	font-weight: normal;
}

.button-container {
	text-align: center;
	margin-top: 20px;
}

.back-btn {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 1rem;
	cursor: pointer;
	text-decoration: none;
}

.back-btn:hover {
	background-color: #45a049;
}

.footer {
	margin-top: 50px;
	text-align: center;
	font-size: 0.9rem;
	color: #777;
}
</style>
</head>

<body>
	<div class="max-w-4xl mx-auto">
		<div class="detail-container">
			<h1>입고 수정</h1>
			<form action="update" role="form" method="post">
				<c:forEach var="up" items="${up}">
					<div class="detail-section">
						<div class="detail-item">
							<label>출고 아이디:</label> <input type="hidden" name="out_id"
								value="${up.out_id}" required="required">
						</div>
						<div class="detail-item">
							<label>출고 날짜:</label> <input type="hidden" name="out_date"
								value="${up.out_date }" required="required">
						</div>
						<div class="detail-item">
							<label>수정 날짜:</label> <input type="text" name="update_date"
								value="${up.update_date }" required="required">
						</div>
						<div class="detail-item">
							<label>출고 상태:</label> <input type="text" name="out_status"
								value="${up.out_status }" required="required">
						</div>
				</c:forEach>
		</div>
		<div class="button-container">
			<button type="submit" class="back-btn">등록</button>
		</div>
		</form>
	</div>
	</div>

	<footer class="footer">
		<%@ include file="include/footer.jsp"%>
	</footer>
</body>

</html>
