<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("updateID");
		
		
		
		String sql = "UPDATE From members WHERE id=?";
	
		String driverName = "com.mysql.jdbc.Driver";
		
		
		String url = "jdbc:mysql://localhost:3306/shopdb2";
		
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			
			
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, uid);
			
			
			int result = pstmt.executeUpdate();
			
			
			if(result == 1) {
				out.println("회원 정보 수정 완료!");
			} else {
				out.println("회원 정보 수정 실패!");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		
	
	%>

<a href="memberList.jsp">회원 전체 목록 보기</a>
</body>
</html>