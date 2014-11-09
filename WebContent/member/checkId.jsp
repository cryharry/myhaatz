<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	// 한글 처리
	request.setCharacterEncoding("utf8");
	// 파라미터값 가져오기
	String id = request.getParameter("id");
	// 디비용 변수
	Context initCtx = null;
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	Boolean idValue = true;
	
	try {
	    initCtx = new InitialContext();
	    ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
	    conn = ds.getConnection();
	    sql = "SELECT id from MEMBER WHERE id=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, id);
	    rs = pstmt.executeQuery();
	    
	    if(rs.next()) {
	        if(id.equals(rs.getString("id"))) {
	            idValue = false;
	        }
	    }
	    if(idValue == true) {
	        %><font color="green">사용가능한 ID입니다.</font><%
	    } else {
	        %><font color="red">사용중인 ID입니다.</font><%
	    }
	} catch(Exception e) {
	    out.println(e.toString());
	} finally {
	    if(rs != null) try{rs.close();}catch(Exception e){}
	    if(pstmt != null) try{pstmt.close();}catch(Exception e){}
	    if(conn != null) try{conn.close();}catch(Exception e){}
	}
%>