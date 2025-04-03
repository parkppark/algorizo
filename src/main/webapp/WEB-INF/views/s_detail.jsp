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

/* 드래그 시 색상 변경 */
::selection {
	background-color: #FF6347;
	color: white;
}

/* 링크에 마우스 올릴 때 밑줄 추가 */
a:hover {
	text-decoration: underline;
	color: #FF6347;
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
    margin-top: 20px;
    text-align: center;
    display: flex;
    justify-content: center;
    gap: 8px; /* 버튼 간 간격 */
}

.back-btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    color: white;
    background-color: #3EB489; /* 버튼 색상 */
    text-decoration: none;
    border-radius: 5px;
    border: none;
    cursor: pointer;
}

.back-btn:hover {
    background-color: #0056b3; /* 호버 색상 */
}

.inline-form {
    display: inline; /* 폼을 인라인으로 표시 */
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
			<h1재>고 상세 정보</h1>
			<c:forEach var="dto" items="${detail }">
				<!-- 상세보기 세로 레이아웃 -->
				<div class="detail-section">
					<div class="detail-item">
						<label>재고 아이디:</label> <span>${dto.s_id }</span>
					</div>
					<div class="detail-item">
						<label>재고 입고 날짜:</label> <span>${dto.s_indate}</span>
					</div>
					<div class="detail-item">
						<label>재고 출고 날짜:</label> <span>${dto.s_outdate}</span>
					</div>
					<div class="detail-item">
						<label>재고 상태:</label> <span>${dto.s_status}</span>
					</div>
					<div class="detail-item">
						<label>비고:</label> <span>${dto.etc}</span>
					</div>
				</div>
				<!-- 결과가 없는 경우 -->
				<c:if test="${dto == null}">
					<p class="text-red-500 mt-4">재고 정보를 찾을 수 없습니다.</p>
				</c:if>

				<!-- 돌아가기 버튼 -->
				<div class="button-container">
					<a href="${contextPath}/stock/s_list" class="back-btn">목록</a> <a
						href="s_update?s_id=${dto.s_id}" class="back-btn">수정</a>
					<form action="${contextPath}/stock/s_delete" method="post"
						class="inline-form">
						<input type="hidden" name="s_id" value="${dto.s_id}">
						<button type="submit" class="back-btn">삭제</button>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>

	<footer class="footer">
		<%@ include file="include/footer.jsp"%>
	</footer>
</body>

</html>
