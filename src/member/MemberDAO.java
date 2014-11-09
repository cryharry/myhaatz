/*
 * MemberDAO.java 2014. 10. 24.
 *
 * Copyright oracleclub.com All rights Reserved.
 */
package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * Class 내용 기술
 * 
 * @author : user
 * 
 */
public class MemberDAO {
    // DB연결용 변수
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";
    
    // DB연결
    private Connection dbConn() throws Exception {
        Context initCtx = new InitialContext();
        DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/jspbeginner");
        conn = ds.getConnection();
        return conn;
    }

    // 회원가입 insertMember()메서드 만들기
    public void insertMember(MemberBean memberBean) {
        try {
            conn = dbConn();
            sql = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getId());
            pstmt.setString(2, memberBean.getPasswd());
            pstmt.setString(3, memberBean.getName());
            pstmt.setTimestamp(4, memberBean.getReg_date());
            pstmt.setInt(5, memberBean.getAge());
            pstmt.setString(6, memberBean.getGender());
            pstmt.setString(7, memberBean.getEmail());
            pstmt.setString(8, memberBean.getAddress1());
            pstmt.setString(9, memberBean.getAddress2());
            pstmt.setString(10, memberBean.getAddress3());
            pstmt.setString(11, memberBean.getTel());
            pstmt.setString(12, memberBean.getMtel());
            
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
    }
    
    public int userCheck(String id, String passwd) {
        int check = -1;     
        try {
            conn = dbConn();
            sql = "SELECT passwd FROM MEMBER WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(passwd.equals(rs.getString("passwd"))) {
                   check = 1;
                } else {
                   check = 0;
                }
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null)try {pstmt.close();} catch (Exception e) {}
            if (conn != null)try {conn.close();} catch (Exception e) {}
        }
        return check;
    }
    
    public MemberBean getMember(String id) {
        MemberBean memberBean = null;
        try {
            conn = dbConn();
            sql = "SELECT * FROM MEMBER WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                memberBean = new MemberBean();
                memberBean.setId(rs.getString("id"));
                memberBean.setAge(rs.getInt("age"));
                memberBean.setEmail(rs.getString("email"));
                memberBean.setGender(rs.getString("gender"));
                memberBean.setPasswd(rs.getString("passwd"));
                memberBean.setName(rs.getString("name"));
                memberBean.setReg_date(rs.getTimestamp("reg_date"));
                memberBean.setAddress1(rs.getString("address1"));
                memberBean.setAddress2(rs.getString("address2"));
                memberBean.setAddress3(rs.getString("address3"));
                memberBean.setTel(rs.getString("tel"));
                memberBean.setMtel(rs.getString("mtel"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
        return memberBean;
    }
    public int updateMember(MemberBean memberBean) {
        int check = -1;
        try {
            conn = dbConn();
            sql = "UPDATE MEMBER SET passwd=? ,name=?, age=?, gender=?, email=?,"
                  +"tel=? ,mtel=? ,address1=? ,address2 =? ,address3=? where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getPasswd());
            pstmt.setString(2, memberBean.getName());
            pstmt.setInt(3, memberBean.getAge());
            pstmt.setString(4, memberBean.getGender());
            pstmt.setString(5, memberBean.getEmail());
            pstmt.setString(6, memberBean.getTel());
            pstmt.setString(7, memberBean.getMtel());
            pstmt.setString(8, memberBean.getAddress1());
            pstmt.setString(9, memberBean.getAddress2());
            pstmt.setString(10, memberBean.getAddress3());
            pstmt.setString(11, memberBean.getId());
                    
            pstmt.executeUpdate();
            check = 1;
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
        return check;
    }
    
    public int deleteMember(String id, String passwd) {
        int check = -1;
        try {
            conn = dbConn();
            sql = "SELECT passwd FROM MEMBER WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                if(passwd.equals(rs.getString("passwd"))) {
                    check = 1;
                    sql = "DELETE FROM MEMBER WHERE id=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, id);
                    
                    pstmt.executeUpdate();
                    
                } else {
                    check = 0;
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e) {}
            if(conn != null) try{conn.close();}catch (Exception e) {}
        }
        return check;
    }
    public List<MemberBean> getMembers() {
        List<MemberBean> memberlist = new ArrayList<MemberBean>();
        try {
            conn = dbConn();
            sql = "SELECT * FROM MEMBER";
            pstmt = conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                MemberBean memberBean = new MemberBean();
                memberBean.setId(rs.getString("id"));
                memberBean.setPasswd(rs.getString("passwd"));
                memberBean.setAge(rs.getInt("age"));
                memberBean.setEmail(rs.getString("email"));
                memberBean.setName(rs.getString("name"));
                memberBean.setGender(rs.getString("gender"));
                memberBean.setReg_date(rs.getTimestamp("reg_date"));
                memberBean.setAddress1(rs.getString("address1"));
                memberBean.setAddress2(rs.getString("address2"));
                memberBean.setAddress3(rs.getString("address3"));
                memberBean.setTel(rs.getString("tel"));
                memberBean.setMtel(rs.getString("mtel"));
                memberlist.add(memberBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
        return memberlist;
    }
    public int getMemberCount() {
    	int count = 0;
    	try {
			conn = dbConn();
			sql = "SELECT count(*) FROM MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e) {}
            if(conn != null) try{conn.close();}catch (Exception e) {}
		}
    	return count;
    }
}
