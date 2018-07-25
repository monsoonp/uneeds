<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login head 아래, jquery도 추가할 것-->
<!-- 
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="412414727668-s6eej5gc6l0emtej7ccvr949oo2l68hg.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3-min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 -->
<!-- MODAL CONTROLL BUTTON -->
<div>
	<a type="button" class="btn btn-primary btn-md loginBtn" data-toggle="modal"
		data-target="#dvModal" data-backdrop="static">Login</a>
</div>
<!-- MODAL -->
<div class="modal fade" id="dvModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2>LOGIN</h2>
				<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
			</div>
			<div class="modal-body">
				
				<!-- login div -->
				<div class="loginDiv">
					<!-- 구글 -->
					<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
					<!-- 페북 --><!-- 로그아웃 버튼 자동생성 -->
					<div id="status"></div>
					<div class="fb-login-button" data-size="large"
						data-button-type="login_with" data-show-faces="false"
						data-auto-logout-link="true" data-use-continue-as="false"></div>
						
					<!-- 네이버 -->
					<div id="naver_id_login"></div>
					<!-- 카카오 로그인 -->
					<a id="kakao-login-btn"></a>
				
				</div>
				<div class="logOutDiv">
					<a href="#">${id} ( ${site} )</a>
					<a href="http://192.168.0.61:8080/uneeds/logout" >로그아웃</a>
					<!-- 로그아웃
					<a href="#" class="g_logout" onclick="signOut();"
						style="padding: 0;">구글 로그아웃</a>
					
					
					<div id="naver_id_logout" style="">
						<a href="#" onclick="naverlogout();">네이버로그아웃</a>
						<div id="dvLogin"></div>
					</div>
					
					<a href="http://developers.kakao.com/logout">카카오로그아웃</a>
					-->
 				
				</div>
				<!-- login div end -->


			</div>
			<div class="modal-footer">UNEEDS</div>


		</div>
	</div>
</div>

<script>
	
	if('${login}'=='logined'){
		$(".loginDiv").addClass("display-none");
		$(".logOutDiv").removeClass("display-none");
	}else{
		$(".loginDiv").removeClass("display-none");
		$(".logOutDiv").addClass("display-none");
	}
	
	
	
	//구글
	function onSignIn(googleUser) {
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());
		console.log("profile: " + JSON.stringify(profile));
		//ul.append("<li>구글: "+profile.getEmail()+"("+profile.getName()+")</li>");

		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
	};
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}
	
	//페북
	window.fbAsyncInit = function() {
		FB.init({
			appId : '1250201825110378',
			autoLogAppEvents : true,
			xfbml : true,
			version : 'v3.0'
		});
		/*
		FB.ui({
			  method: 'share_open_graph',
			  action_type: 'og.likes',
			  action_properties: JSON.stringify({
			    object:'https://developers.facebook.com/docs/javascript/examples',
		  })
		}, function(response){
		  // Debug response (optional)
		  console.log(response);
		});
		*/
		FB.login(function(response) {
		    if (response.authResponse) {
		     console.log('Welcome!  Fetching your information.... ');
		     FB.api('/me', function(response) {
		       console.log('Good to see you, ' + response.name + '.');
		     });
		    } else {
		     console.log('User cancelled login or did not fully authorize.');
		    }
		}, {scope: 'public_profile,email'});
		FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		});
		    
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/ko_KR/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		// The response object is returned with a status field that lets the
		// app know the current login status of the person.
		// Full docs on the response object can be found in the documentation
		// for FB.getLoginStatus().
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			fb_info();
		} else {
			// The person is not logged into your app or we are unable to tell.
			//document.getElementById('status').innerHTML = 'Please log '+ 'into this app.';
		}
	}
	//페북 값 받아오기
	function fb_info() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', {fields: 'email,name'}, function(response) {
	      console.log('Successful login for: ' + response.name+", "+response.email);
	      //document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';
	      //ul.append("<li>페북: "+response.email+"("+response.name+")</li>");
	    });
	}
	
	//로그인
	var naver_id_login = new naver_id_login("dhxVzayDoaI1Ff2KDolt",
				"http://192.168.0.61:8080/uneeds/book/");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("192.168.0.61:8080/");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
		
	/* 네이버 로그아웃 함수 */
	function naverlogout() {
		// 로그아웃 아이프레임
		$("body").append("<iframe id='logoutIframe' style='display: none;'></iframe>");
		$("#logoutIframe").attr("src", "http://nid.naver.com/nidlogin.logout");
		// 로그아웃 처리
		//$("#naver_id_login").show();
		//$("#naver_id_logout").hide();
	}
	
	// 카카오
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('b45576e5990ea9f2ee92793cf38b63c0');
    // 카카오 로그인 버튼을 생성합니다.
    
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					console.log(JSON.stringify(res.kaccount_email));
					console.log(JSON.stringify(res.id));
					console.log(JSON.stringify(res.properties.profile_image));
					console.log(JSON.stringify(res.properties.nickname));
					//console.log(res.kaccount_email.split("@")[0]);
					
					//로그인 요청
					send_login(select_id(res.kaccount_email), "kakao");
					//ul.append("<li>카카오: " + res.properties.nickname + "("
					//		+ res.kaccount_email + ", " + res.id + ")</li>");
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
    
	function klogout() {
		Kakao.Auth.logout(function(response){
			console.log('카카오 로그아웃'+response);
			//location.href="http://localhost:8080/uneeds/login";
		});
	}
	
	function sendInfo(){
		$.ajax({
			
		})
	}
	
	function send_login(id, site){
		$.ajax({
			type : 'POST',
			url : "http://192.168.0.61:8080/uneeds/login",
			data : {"id":id, "site":site},
			success : function(data){
				//console.log("login..."+data);
			},
			dataType: "text",
			complete: function(data){
				console.log("login...");
				window.location = "";
			}
		});
		//window.location = '/';
	}
	
	function select_id(id){
		return id.split("@")[0];
	}
</script>