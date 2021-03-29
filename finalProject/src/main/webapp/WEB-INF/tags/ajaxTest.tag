<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="ajax" type="com.company.common.ajaxTest"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
ul li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
a {
	cursor: pointer;
	text-decoration:none;
}
</style>
<!-- 마우스 올리면 밑줄생기도록 -->
	<div>
		<ul>
			<li><a href="#">수술치료</a></li>
			<li><a href="#">예방접종</a></li>
			<li><a href="#">검진검사</a></li>
			<li><a href="#">기타</a></li>
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
		<br>
		<div>
			<span>
			<label> <input type="checkbox"> 중성화수술</label>
			</span>
			<span>
			<label><input type="checkbox"> 중성화수술</label>
			</span>
			<span>
			<label><input type="checkbox"> 중성화수술</label>
			</span>
		</div>
		<ul>
			<li><strong>지역구분</strong>
				<div class="con">
					<span><label><input type="checkbox">서울전체</label>
						<span><label><input type="checkbox">강남구</label>
						</span>
						<span><label><input type="checkbox">강동구</label>
						</span>
						<span><label><input type="checkbox">강북구</label>
						</span>
						<span><label><input type="checkbox">강서구</label>
						</span>
						<span><label><input type="checkbox">관악구</label>
						</span>
					</span>
				</div>
			</li>
		</ul>
		<br><br>
		<ul>
			<li>
				<strong>결과 내 재검색</strong>
				<div>
					<input type="text" placeholder="검색어 입력"><button type="button">검색</button>
				</div>
			</li>
		</ul>
		<br><br>
		<ul>
			<li>
				<strong>반려동물유형</strong>
				<div>
					<span>
						<label><input type="checkbox">반려견</label>
					</span>
					<span>
						<label><input type="checkbox">반려묘</label>
					</span>
					<span>
						<label><input type="checkbox">기타</label>
					</span>
				</div>			
			</li>
			<br><br>
			<li>
			<strong>성별</strong>
			<div>
				<span>
				<label><input type="checkbox">남</label>
				</span>
				<span>
				<label><input type="checkbox">여</label>
				</span>
			</div>
			</li>
			<br><br>
			<li>
			<strong>크기</strong>
			<div>
				<span>
				<label><input type="checkbox">소형</label>
				</span>
				<span>
				<label><input type="checkbox">중형</label>
				</span>
				<span>
				<label><input type="checkbox">대형</label>
				</span>
			</div>
			</li>
		</ul>
	</div>
