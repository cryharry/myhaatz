<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, org.json.simple.JSONObject" %>
<%
	request.setCharacterEncoding("utf8");
	String search = request.getParameter("search");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	try {
	    Context ctx = new InitialContext();
	    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
	    
	    conn = ds.getConnection();
	    sql = "SELECT subject FROM BOARD WHERE subject like ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, "%"+search+"%");
	    
	    rs = pstmt.executeQuery();
	    
	    while(rs.next()) {
	    	out.println(rs.getString("subject")+"<br>");
	    }
	    
        out.flush();
	} catch(Exception e) {
	    out.println(e.toString());
	    out.flush();
	} finally {
	    if(rs != null) try{rs.close();}catch(Exception e){}
	    if(pstmt != null) try{pstmt.close();}catch(Exception e){}
	    if(conn != null) try{conn.close();}catch(Exception e){}
	}
%>