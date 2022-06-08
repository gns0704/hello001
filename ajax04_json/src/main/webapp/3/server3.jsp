
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="test.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Member> list=new ArrayList<Member>();
	list.add(new Member("kim","1234","kim@daum.net",10,new Date()));
	list.add(new Member("hello","000","hello@daum.net",20,new Date()));
	list.add(new Member("test","5432","test@daum.net",30,new Date()));
	
	//list에 담긴 정보를 json배열로 만들기
	JSONArray jarr=new JSONArray();
	for(int i=0;i<list.size();i++){
		Member user=list.get(i);
		JSONObject obj=new JSONObject();
		obj.put("id",user.getId());
		obj.put("pwd",user.getPwd());
		obj.put("email",user.getEmail());
		obj.put("age",user.getAge());
		obj.put("regdate",user.getRegdate());
		//json객체를 json배열에 추가하기
		jarr.put(obj);
	}
	JSONObject data=new JSONObject();
	data.put("list",jarr);
	response.setContentType("text/plain;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print(data);
	pw.close();

%>