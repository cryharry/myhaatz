package board;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    Connection conn=null;
    PreparedStatement pstmt=null;
    String sql="";
    ResultSet rs=null;
    
	private Connection dbConn() throws Exception{
		Connection con=null;
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
		conn = ds.getConnection();
		return conn;
	}
	public void insertBoard(BoardBean boardBean){
		int num=0;
		try {
			//1,2  디비연결
			conn=dbConn();
			//num구하기
			sql="select max(num) from board";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;//게시판글이 있은 경우 최근글번호+1
			}else{
				num=1;//게시판글이 없는 경우
			}
			//주글일 경우 글번호(num) == 그룹번호(re_ref) 같게 만듬
			//3 sql insert
			sql="insert into board(num,name,passwd,subject,content,file,type,date,readcount,ip,re_ref,re_lev,re_seq) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardBean.getName());
			pstmt.setString(3, boardBean.getPasswd());
			pstmt.setString(4, boardBean.getSubject());
			pstmt.setString(5, boardBean.getContent());
			pstmt.setString(6, boardBean.getFile());
			pstmt.setString(7, boardBean.getType());
			pstmt.setTimestamp(8, boardBean.getDate());
			pstmt.setInt(9, 0);
			pstmt.setString(10, boardBean.getIp());
			pstmt.setInt(11, num); //re_ref == 주글num
			pstmt.setInt(12, 0); //re_lev
			pstmt.setInt(13, 0);  //re_seq
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
	}//메서드
	public int getBoardCount(){
		int count=0;
		try {
			//1,2디비연결
			conn=dbConn();
			//3 sql 글개수 가져오기 count(*)
			sql="select count(*) from board";
			pstmt=conn.prepareStatement(sql);
			//4단계 rs저장
			rs=pstmt.executeQuery();
			//5 데이터있으면 count 저장
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	public List<BoardBean> getBoards(int startRow, int pageSize) {
	    List<BoardBean> boardList = new ArrayList<BoardBean>();
	    try {
	        // 1,2 디비연결
            conn = dbConn();
            // 3 sql 정렬 re_ref 내림차순 re_req 오름 limit 시작행-1,글개수
            sql = "SELECT * FROM BOARD ORDER BY re_ref desc, re_seq asc" +
            		" LIMIT ? , ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startRow-1);
            pstmt.setInt(2, pageSize);
            // 4 rs 저장
            rs = pstmt.executeQuery();
            // 5 데이터가 있으면 자바빈 객체 생성
            while(rs.next()) {
                BoardBean boardBean = new BoardBean();
                boardBean.setNum(rs.getInt("num"));
                boardBean.setReadcount(rs.getInt("readcount"));
                boardBean.setName(rs.getString("name"));
                boardBean.setDate(rs.getTimestamp("date"));
                boardBean.setSubject(rs.getString("subject"));
                boardBean.setContent(rs.getString("content"));
                boardBean.setRe_lev(rs.getInt("re_lev"));
                boardBean.setRe_ref(rs.getInt("re_ref"));
                boardBean.setRe_seq(rs.getInt("re_seq"));
                boardBean.setFile(rs.getString("file"));
                boardBean.setIp(rs.getString("ip"));
                boardBean.setPasswd(rs.getString("passwd"));;
                boardBean.setType(rs.getString("type"));
                
                boardList.add(boardBean);
            }
            // 폼 -> 자바빈 저장 ->  boardList 한칸 저장
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
            if(conn!=null) try{conn.close();}catch(SQLException ex){}
        }
	    return boardList;
	}
	public List<BoardBean> getBoards(int startRow, int pageSize, String search) {
        List<BoardBean> boardList = new ArrayList<BoardBean>();
        try {
            // 1,2 디비연결
            conn = dbConn();
            // 3 sql 정렬 re_ref 내림차순 re_req 오름 limit 시작행-1,글개수
            sql = "SELECT * FROM BOARD WHERE subject like ? ORDER BY re_ref desc, re_seq asc" +
                    " LIMIT ? , ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%"+search+"%");
            pstmt.setInt(2, startRow-1);
            pstmt.setInt(3, pageSize);
            // 4 rs 저장
            rs = pstmt.executeQuery();
            // 5 데이터가 있으면 자바빈 객체 생성
            while(rs.next()) {
                BoardBean boardBean = new BoardBean();
                boardBean.setNum(rs.getInt("num"));
                boardBean.setReadcount(rs.getInt("readcount"));
                boardBean.setName(rs.getString("name"));
                boardBean.setDate(rs.getTimestamp("date"));
                boardBean.setSubject(rs.getString("subject"));
                boardBean.setContent(rs.getString("content"));
                boardBean.setRe_lev(rs.getInt("re_lev"));
                boardBean.setRe_ref(rs.getInt("re_ref"));
                boardBean.setRe_seq(rs.getInt("re_seq"));
                boardBean.setFile(rs.getString("file"));
                boardBean.setIp(rs.getString("ip"));
                boardBean.setPasswd(rs.getString("passwd"));;
                boardBean.setType(rs.getString("type"));
                
                boardList.add(boardBean);
            }
            // 폼 -> 자바빈 저장 ->  boardList 한칸 저장
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
            if(conn!=null) try{conn.close();}catch(SQLException ex){}
        }
        return boardList;
    }
	
	public BoardBean getBoard(int num) {
	    BoardBean boardBean = null;
	    try {
            conn = dbConn();
            
            sql = "SELECT * FROM BOARD WHERE num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                boardBean = new BoardBean();
                boardBean.setNum(rs.getInt("num"));
                boardBean.setReadcount(rs.getInt("readcount"));
                boardBean.setName(rs.getString("name"));
                boardBean.setDate(rs.getTimestamp("date"));
                boardBean.setSubject(rs.getString("subject"));
                boardBean.setContent(rs.getString("content"));
                boardBean.setRe_lev(rs.getInt("re_lev"));
                boardBean.setRe_ref(rs.getInt("re_ref"));
                boardBean.setRe_seq(rs.getInt("re_seq"));
                boardBean.setFile(rs.getString("file"));
                boardBean.setIp(rs.getString("ip"));
                boardBean.setPasswd(rs.getString("passwd"));
                boardBean.setType(rs.getString("type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
            if(conn!=null) try{conn.close();}catch(SQLException ex){}
        }
	    return boardBean;
	}
	public void updateReadCount(int num) {
	    try {
            conn = dbConn();
            sql = "UPDATE BOARD SET readcount = readcount+1 WHERE num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
            if(conn!=null) try{conn.close();}catch(SQLException ex){}
        }
	}
	public int updateBoard(BoardBean boardBean) {
	    int check = -1;
	    try {
            conn = dbConn();
            sql = "SELECT passwd FROM BOARD WHERE num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardBean.getNum());
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(boardBean.getPasswd().equals(rs.getString("passwd"))) {
                    sql = "UPDATE BOARD SET name=?, subject=?, content=?, file=?, type=? WHERE num=?";
                    
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, boardBean.getName());
                    pstmt.setString(2, boardBean.getSubject());
                    pstmt.setString(3, boardBean.getContent());
                    pstmt.setString(4, boardBean.getFile());
                    pstmt.setString(5, boardBean.getType());
                    pstmt.setInt(6, boardBean.getNum());
                    
                    pstmt.executeUpdate();
                    
                    check = 1;
                } else {
                    check = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
            if(conn!=null) try{conn.close();}catch(SQLException ex){}
        }
	    return check;
	}
	
	public int deleteBoard(int num, String passwd) {
	    int check = -1;
	    try {
            conn = dbConn();
            sql = "SELECT passwd FROM BOARD WHERE num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                if(passwd.equals(rs.getString("passwd"))) {
                    sql = "DELETE FROM BOARD WHERE num = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, num);
                    
                    pstmt.executeUpdate();
                    check = 1;
                } else {
                    check = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
            if(conn!=null) try{conn.close();}catch(SQLException ex){}
        }
	    return check;
	}
	public void reInsertBoard(BoardBean boardBean) {
	    int num = 0;
	    try {
            conn = dbConn();
            sql = "SELECT MAX(num) FROM BOARD";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                num = rs.getInt(1)+1;
            } else {
                num = 1;
            }
            // 기존의 답글의 순서 재배치
            // 기존의 re_seq + 1 수정
            // 조건 같은 그룹에 있고 동시에 순서가 자기보다 큰 값이 있는지(답변글 있는지)
            sql = "UPDATE BOARD SET re_seq = re_seq+1 WHERE re_ref = ? and re_seq = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardBean.getRe_ref());
            pstmt.setInt(2, boardBean.getRe_seq());
            pstmt.executeUpdate();
            // re_lev, re_seq 증가
            // inset 실행
            sql="insert into board(num,name,passwd,subject,content,file,type,date,readcount,ip,re_ref,re_lev,re_seq) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, boardBean.getName());
            pstmt.setString(3, boardBean.getPasswd());
            pstmt.setString(4, boardBean.getSubject());
            pstmt.setString(5, boardBean.getContent());
            pstmt.setString(6, boardBean.getFile());
            pstmt.setString(7, boardBean.getType());
            pstmt.setTimestamp(8, boardBean.getDate());
            pstmt.setInt(9, 0);
            pstmt.setString(10, boardBean.getIp());
            pstmt.setInt(11, boardBean.getRe_ref()); //re_ref == 주글num
            pstmt.setInt(12, boardBean.getRe_lev()+1); //re_lev
            pstmt.setInt(13, boardBean.getRe_seq()+1);  //re_seq
            
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
            if(conn!=null) try{conn.close();}catch(SQLException ex){}
        }
	}
}//클래스
