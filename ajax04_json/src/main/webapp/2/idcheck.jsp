<%@page import="org.json.JSONObject"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //idcheck.jsp
	String id=request.getParameter("id");
	boolean exist=false;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		con=JdbcUtil.getCon();
		String sql="select * from member where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			exist=true;
		}
	}catch(SQLException s){
		s.printStackTrace();
	}finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(SQLException s){
			s.printStackTrace();
		}
	}
	JSONObject json=new JSONObject();
	json.put("exist",exist);
	
	response.setContentType("text/plain;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print(json);
%>




