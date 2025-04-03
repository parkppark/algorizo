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

label {
	font-size: 1rem;
	margin-bottom: 8px;
	font-weight: bold;
	color: #333;
}

select {
	padding: 10px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
	transition: all 0.3s ease;
}

/* 포커스 시 경계선 색상 변경 */
select:focus {
	border-color: #007bff;
	outline: none;
}

/* 옵션 스타일 */
select option {
	padding: 10px;
	font-size: 1rem;
}

/* 상태에 따라 색상 표시 (선택된 옵션에 따라) */
select:focus option {
	background-color: #f1f1f1;
}
/* 날짜 선택 입력 스타일 */
input[type="date"] {
    width: 100%; /* 너비를 100%로 설정 */
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    transition: all 0.3s ease;
    box-sizing: border-box; /* padding이 포함되도록 */
}

/* 포커스 시 테두리 색상 변경 */
input[type="date"]:focus {
    border-color: #007bff;
    outline: none;
}
</style>
</head>

<body>
	<div class="max-w-4xl mx-auto">
		<div class="detail-container">
			<h1>재고 등록</h1>
			<form action="s_register" role="form" method="post">
				<div class="detail-section">
					<div class="detail-item">
						<label for="out_status">재고 상태:</label> <select name="s_status"
							id="s_status" class="form-control">
							<option value="재고 충족">재고 충족</option>
							<option value="재고 부족">재고 부족</option>
							<option value="재고 없음">재고 없음</option>
						</select> <span class="tooltip">재고 상태를 선택하세요.</span>
					</div>
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
