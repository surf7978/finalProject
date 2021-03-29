<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>
</head>
<body>
	<div>
		<ul>
			<li><a style="cursor: pointer;" href="#">수술치료</a></li>
			<li><a href="#">예방접종</a></li>
			<li>검진검사</li>
			<li>기타</li>
		</ul>
		<br>
		<ul>
			<li>중성화</li>
			<li>다리수술</li>
			<li>치과</li>
			<li>안과</li>
			<li>수술1</li>
			<li>수술2</li>
			<li>수술3</li>
			<li>수술4</li>
		</ul>
		<div>
			<span> <input type="checkbox" id="1"> <label for="1">중성화수술
			</label>
			</span> <span> <input type="checkbox" id="2"> <label for="2">중성화수술
			</label>
			</span> <span> <input type="checkbox" id="3"> <label for="3">중성화수술
			</label>
			</span>
		</div>

		<ul>
			<li><strong>지역구분</strong>
				<div class="con">
					<span> <input type="checkbox" id="1"> <label for="1">서울전체</label>
						<span> <input type="checkbox" id="2"> <label for="2">강남구</label>
						</span>
						<span> <input type="checkbox" id="3"> <label for="3">강동구</label>
						</span>
						<span> <input type="checkbox" id="4"> <label for="4">강북구</label>
						</span>
						<span> <input type="checkbox" id="5"> <label for="5">강서구</label>
						</span>
						<span> <input type="checkbox" id="6"> <label for="6">관악구</label>
						</span>
					</span>
				</div>
			</li>
		</ul>
		<ul>
			<li>
				<strong>결과 내 재검색</strong>
				<div>
					<input type="text" placeholder="검색어 입력"><button type="button">검색</button>
				</div>
			</li>
		</ul>
		<ul>
			<li>
				<strong>반려동물유형</strong>
				<div>
					<span>
						<input type="checkbox" id="7">
						<label for="7">반려견</label>
					</span>
					<span>
						<input type="checkbox" id="8">
						<label for="8">반려묘</label>
					</span>
					<span>
						<input type="checkbox" id="9">
						<label for="9">기타</label>
					</span>
				</div>			
			</li>
			<li>
			<strong>성별</strong>
			<div>
				<span>
				<input type="checkbox" id="10">
				<label for="10">남</label>
				</span>
				<span>
				<input type="checkbox" id="11">
				<label for="11">여</label>
				</span>
			</div>
			</li>
			<li>
			<strong>크기</strong>
			<div>
				<span>
				<input type="checkbox" id="12">
				<label for="12">소형</label>
				</span>
				
				<span>
				<input type="checkbox" id="13">
				<label for="13">중형</label>
				</span>
				
				<span>
				<input type="checkbox" id="14">
				<label for="14">대형</label>
				</span>
			</div>
			</li>
		</ul>
	</div>
</body>
</html>