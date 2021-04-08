<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div>
	<div>
	<ul>
	<li>

	타이틀이미지: <img src="resources/images/board1/${board.t_image}">

	


	</li>	
	<li>	
		<div>
		제목: ${board.title }	
		</div>
		<div>
		날짜 : ${board.calendar}
		</div>
		<div>
		${board.writer }
		</div>
		<div>
		${board.views }
		</div>
		<div>
		${board.category}	
		</div>
		<div>
		${board.memberId }
		</div>
	</li>
	</ul>
	</div>
	<div>

	
	상세이미지: <img src="resources/images/board1/${board.image}">
	

	</div>
	
</div>




</body>
</html>