<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>로그인 페이지</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 위에 2개가 카카오 -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
</head>
<br>
<a href="/board/list">게시판(수정예정)</a>
<br />
<br>
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "/sae_member/logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "/sae_member/register";
		})

		$("#memberUpdateBtn").on("click", function() {
			location.href = "/sae_member/memberUpdateView";
		})

		$("#findPassBtn").on("click", function() {
			location.href = "/sae_member/findPass";
		});
	});
</script>
<!-- 네이버 로그아웃 3번하고 로그인하면 로그인 오류뜸 근데 로그인은 됨 -->
<!-- 카카오 로그인 스크립트 -->
<script type="text/javascript">
	function unlinkApp() {
		Kakao.API.request({
			url : '/v1/user/unlink',
			success : function(res) {
				alert('success: ' + JSON.stringify(res))
			},
			fail : function(err) {
				alert('fail: ' + JSON.stringify(err))
			},
		})
	}
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						Kakao.init('046f95da86241f89ff0763a299108c86');
						console.log(Kakao.isInitialized());

						Kakao.Auth
								.createLoginButton({
									container : '#kakao-login-btn',
									success : function(authObj) {
										Kakao.API
												.request({
													url : '/v2/user/me',
													success : function(result) {

														id = result.id
														connected_at = result.connected_at
														kakao_account = result.kakao_account

														email = "";
														birthday = "";
														age_range = "";
														profile_nickname = "";
														if (typeof kakao_account != 'undefined') {
															email = kakao_account.email;
															birthday = kakao_account.birthday;
															age_range = kakao_account.age_range;
															profile_nickname = kakao_account.profile.nickname;
														}

														location.href = "/sae_member/kakao?userId="
																+ profile_nickname
																+ "&&email="
																+ email
																+ "&&birthday="
																+ birthday;

													},
													fail : function(error) {
														alert('login success, but failed to request user information: '
																+ JSON
																		.stringify(error))
													},
												})
									},
									fail : function(err) {
										alert('failed to login: '
												+ JSON.stringify(err))
									},
								});
					});
</script>
<!-- 네이버 스크립트 -->
<script>
	$(document)
			.ready(
					function() {

						var naverLogin = new naver.LoginWithNaverId({
							clientId : "haN0bJqB_tJg0j83ohZ2", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
							callbackUrl : "http://localhost:8080/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
							isPopup : false,
							callbackHandle : true,
							loginButton : {
								color : "green",
								type : 3,
								height : 60
							}
						/* 로그인 버튼의 타입을 지정 */
						});
						naverLogin.init();

						$("#naverIdLogin")
								.on(
										"click",
										function() {

											naverLogin
													.getLoginStatus(function(
															status) {
														console.log(status);
														if (status) {
															var email = naverLogin.user
																	.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

															console
																	.log(naverLogin.user);

															if (email == undefined
																	|| email == null) {
																alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
																naverLogin
																		.reprompt();
																return;
															}

															location.href = "/sae_member/naver?userId="
																	+ naverLogin.user.name
																	+ "&&email="
																	+ naverLogin.user.email
																	+ "&&birthday="
																	+ naverLogin.user.birthday;
														
														} else {
															console
																	.log("callback 처리에 실패하였습니다.");
														}
													});
										});
					});
	var testPopUp;
	function openPopUp() {
		testPopUp = window.open("https://nid.naver.com/nidlogin.logout",
				"_blank",
				"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp() {
		testPopUp.close();
	}

	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
		}, 1000);
	}
</script>
<body>
	<form name='homeForm' method="post" action="/sae_member/login">
		<c:if test="${member == null }">
			<div>
				<label for="userId"></label> <input type="text" id="userId"
					name="userId">
			</div>
			<div>
				<label for="userPass"></label> <input type="password" id="userPass"
					name="userPass">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
				<a id="kakao-login-btn"></a>
				<!-- 	<button id="naver-login-btn">네이버 로그인</button> -->
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naverIdLogin"></div>
				<!-- //네이버아이디로로그인 버튼 노출 영역 -->
				<button id="findPassBtn" type="button">비밀번호 찾기</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userId}님환영합니다.</p>
				<c:if test="${loginlogin == null }">
					<button id="memberUpdateBtn" type="button">회원정보수정</button>
					<button id="logoutBtn" type="button">로그아웃</button>
				</c:if>

				<c:if test="${loginlogin != null }">
					<button id="logoutBtn" type="button">로그아웃</button>
				</c:if>
			</div>

		</c:if>

		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요</p>
		</c:if>
	</form>

</body>
</html>
