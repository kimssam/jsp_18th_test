package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(instance == null) instance = new BoardDAO();
		return instance;
	}
	
	public ArrayList<BoardDTO> getBoardList(int page){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select * from w_board order by board_seq desc";//최근글이 앞에 오도록 내림차순
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("board_seq"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setContents(rs.getString("contents"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setRegist_day(rs.getString("logtime"));
				board.setUpdate_day(rs.getString("updatetime"));
				list.add(board);
			}
		}catch(Exception e){
			System.out.println("getBoardList() 에러 : "+e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	
	//조건에 맞는(페이징시, 검색시) 전체 게시글의 갯수 출력하는 함수
	public int getListCount(String items, String text) {//items:컬럼명, text:검색 키워드 문자열
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;//선택된 총 게시글의 갯수
		
		String sql;
		
		if(items == null && text == null ) {//검색어가 없으면 리스트 전체 갯수 가져오기
			sql="select  count(*) from w_board";
		}else {
			sql="select count(*) from w_board where " +items+ " like '%"+text+"%'"; //검색어가 있으면 검색한 리스트의 갯수 가져오기
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = rs.getInt(1);
			
		}catch(Exception e){
			System.out.println("getListCount() 에러 : "+e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return x; //선택된 게시글의 총 갯수를 리턴
	}
	
	
	//매개변수로 page, items, text를 포함한 getBoardList함수 구현(페이징 추가)
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(items, text);
		//내가 검색한 조건에 맞게 선택된 총 게시글의 갯수
		
		//페이징 구현:5개씩 목록이 보일 것이므로 rs의 1, 6, 11번 행으로 이동하기 위한 index변수를 생성
		int start = (page - 1) *limit;
		//예)페이지 넘버가 1일 때 start=0
		//페이지 넘버가 2일 때 start = 5
		//페이지 넘버가 3일 때 start = 10
		int index = start + 1;
		//1,6,11...
		
		
		String sql;
		
		if(items == null & text==null) {
			sql ="select * from w_board order by board_seq desc";
		}else {
			sql="select * from w_board where " +items+ " like '%"+text+"%' order by board_seq desc"; //검색어가 있으면 검색한 리스트의 갯수 가져오기
		}
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			//TYPE_SCROLL_INSENSITIVE : rs에서 화면이동하는데 사용하는 커서
			//CONCUR_READ_ONLY:rs으로 가져온 row의 값을 다시 insert하거나 update하지 않겠다. 그냥 데이터를 읽기만 하겠다.
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("board_seq"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setContents(rs.getString("contents"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setRegist_day(rs.getString("logtime"));
				board.setUpdate_day(rs.getString("updatetime"));
				list.add(board);
				
				//페이징 처리 로직
				if(index < (start + limit) && index <= total_record ) index++;
				else break;
				//(예시)total_record:12, page는 1페이지가 들어왔다라고 가정시 
				
				//1 < (0+5) && 1 <= 12 => index:2
				//2 < (0+5) && 2 <= 12 => index:3
				//3 < (0+5) && 3 <= 12 => index:4
				//4 < (0+5) && 4 <= 12 => index:5
				//5 < (0+5) && 5 <= 12 => break로 빠져나옴
				//rs.absolute(1,2,3,4,5)
				
				//(예시)total_record:12, page는 2페이지가 들어왔다라고 가정시 
				//5 < (5+5) && 5 <= 12 => index:6
				//6 < (5+5) && 6 <= 12 => index:7
				//7 < (5+5) && 7 <= 12 => index:8
				//8 < (5+5) && 8 <= 12 => index:9
				//9 < (5+5) && 9 <= 12 => index:10
				//10 < (5+5) && 10 <= 12 => break로 빠져나옴
				//rs.absolute(6,7,8,9,10)
				
				//(예시)total_record:12, page는 3페이지가 들어왔다라고 가정시 
				//10 < (10+5) && 10 <= 12 => index:11
				//11 < (10+5) && 11 <= 12 => index:12
				//12 < (10+5) && 12 <= 12 => index:13
				//13 < (10+5) && 13 <= 12 => break로 빠져나옴
				//rs.absolute(11,12,13)
				
			} 
		}catch(Exception e){
			System.out.println("getBoardList(매개변수 네개짜리) 에러 : "+e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	
	//getLoginNameById() 구현
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String name = null;
		String sql="select * from w_member where id=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("name");
			
		}catch(Exception e){
			System.out.println("getLoginNameById() 에러 : "+e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return name;
	}
	
	//insertBoard() 구현
	public void insertBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql="insert into w_board values(board_seq.nextval, ?,?,?,?,?,?,sysdate, sysdate)";
			
			System.out.println("========");
			System.out.println(board.getId());
			System.out.println(board.getName());
			System.out.println(board.getTitle());
			System.out.println(board.getContents());
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getContents());
			pstmt.setInt(5, board.getHit());
			pstmt.setString(6, board.getIp());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("insertBoard() 에러 : "+e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	
	//getBoardByNum() 함수 구현
	public BoardDTO getBoardByNum(int num, int pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;
		
		String sql="select * from  w_board where board_seq=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("board_seq"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setContents(rs.getString("contents"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setRegist_day(rs.getString("logtime"));
				board.setUpdate_day(rs.getString("updatetime"));
			}
			
		}catch(Exception e){
			System.out.println("getBoardByNum() 에러 : "+e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return board;
	}
	
	//updateBoard() 함수 구현
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql ="update w_board set title=?, contents=?, ip=?, updatetime=sysdate where board_seq=?";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContents());
			pstmt.setString(3, board.getIp());
			pstmt.setInt(4, board.getNum());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("updateBoard() 에러 : "+e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	//deleteBoard()함수 구현
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql="delete w_board where board_seq=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("deleteBoard() 에러 : "+e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}








