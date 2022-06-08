<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function getList(){
	let xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			let data=xhr.responseText;
			let result=JSON.parse(data);
			let list=result.list;
			let div=document.getElementById("result");
			for(let i=0;i<list.length;i++){
				let mem=list[i].id +"," + list[i].pwd +"," + list[i].email +"," + list[i].age +","+ list[i].regdate;
				div.innerHTML += mem +"<br>";
			}	
		}
	};
	xhr.open('get','server3.jsp',true);
	xhr.send();
}
</script>
</head>
<body>
<!-- btn1을 클릭하면 json데이터 얻어와 div#result에 출력해 보세요 -->
<input type="button" value="데이터받아오기" id="btn1" onclick="getList()">
<div id="result"></div>
</body>
</html>