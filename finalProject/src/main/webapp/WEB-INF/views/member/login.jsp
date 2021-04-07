<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>로 그 인</h2>
                        <form action="login" method="post">
                            <div class="group-input">
                                <label for="username">아이디 입력 *</label>
                                <input type="text" id="memberId" name="memberId">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호 입력 *</label>
                                <input type="password" id="password" name="password">
                            </div>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <a href="searchID&PW" class="forget-pass">아이디/비밀번호 찾기</a>
                                </div>
                            </div>
                            <button type="submit" class="site-btn login-btn" style="width:170px; height:50px;">로그인</button>
                            &nbsp;&nbsp;&nbsp;
	                        <a href="https://kauth.kakao.com/oauth/authorize
									?response_type=code
									&client_id=8b88c20e8232de584d13f04e421f2b48
									&redirect_uri=http://localhost/finalProject/callback">
							<img src="resources/img/kakao_login_medium_narrow.png"></a>
                        </form>
                        <br>
                        <div class="switch-login">
                            <a href="signUpSelect" class="or-login">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>