<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function getInfo(){
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let user=JSON.parse(data);//data를 json객체로 만들기
				let div=document.getElementById("result");
				div.innerHTML="이름:" + user.name +"<br>" +
							"나이:" + user.age +"<br>" +
							"전화번호:" + user.phone;
			}
		};
		xhr.open('get','server1.jsp',true);
		xhr.send();
	}
</script>
</head>
<body>
<!-- btn1을 클릭하면 정보를 얻어와 div#result에 출력하기 (이름,나이,전화번호) -->
<input type="button" value="데이터받아오기" id="btn1" onclick="getInfo()">
<div id="result">
</div>
</body>
</html>