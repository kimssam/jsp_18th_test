package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	static final int LISTCOUNT = 5;
	//게시글 목록이 몇개씩 보여질건지 상수로 선언
	
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response ) throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request,HttpServletResponse response ) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI();
		//=>/WebMarket/BoardListAction.do
		System.out.println("RequestURI : "+RequestURI);
		
		String contextPath = request.getContextPath();
		//=>/WebMarket
		System.out.println("contextPath : "+contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		//=>/board/list.jsp에서 /list.jsp을 꺼내려면 5번째부터 가져오기 위해 substring()을 사용
		System.out.println("command : "+command);
		//=>/BoardListAction.do
		
		if(command.equals("/BoardListAction.do")) {
			requestBoardList(request);
			RequestDispatcher rd =  request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}
		
		else if(command.equals("/BoardWriteForm.do")) {
			requestLoginName(request); //인증된 사용자명 가져오는 함수
			RequestDispatcher rd =  request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
		}
		
		else if(command.equals("/BoardWriteAction.do")) {
			requestBoardWrite(request); //인증된 사용자명 가져오는 함수
			RequestDispatcher rd =  request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardViewAction.do")) {
			requestBoardView(request); //선택한 게시글에 대한 상세내용을 가져오는 함수
			RequestDispatcher rd =  request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardView.do")) {
			RequestDispatcher rd =  request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardUpdateAction.do")) {
			requestBoardUpdate(request);
			RequestDispatcher rd =  request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
		
		else if(command.equals("/BoardDeleteAction.do")) {
			requestBoardDelete(request);
			RequestDispatcher rd =  request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
	}
	
	//게시판 목록을 가져오는 함수
	public void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<>();
		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		//페이지번호가 있으면
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		boardlist = dao.getBoardList(pageNum);
		request.setAttribute("boardlist", boardlist);
		// pageNum을 request에 추가
		request.setAttribute("pageNum", pageNum);
		// 사용자가 게시판 하단의 검색창을 검색하고 검색버튼을 클릭했을 때 items, text얻어옴
		String items = request.getParameter("items");
		String text = request.getParameter("text");

		int total_record = dao.getListCount(items, text);
		request.setAttribute("total_record", total_record);

		boardlist = dao.getBoardList(pageNum, limit, items, text);// 검색한 결과로 가져온 리스트
		request.setAttribute("boardlist", boardlist);
		// 를 request에 boardlist변수명으로 덮어쓰기

		// total_page 총 게시판 페이지수 구하기
		int total_page;
		if (total_record % limit == 0) {
			total_page = total_record / limit;
		} else {
			total_page = total_record / limit;
			total_page += 1;
		}
		request.setAttribute("total_page", total_page);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("items", items);
		request.setAttribute("text", text);

	}
	
	
	//requestLoginName()구현
	public void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getLoginNameById(id);
		request.setAttribute("name", name);
	}
	
	
	//requestBoardWrite() 구현
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContents(request.getParameter("contents"));
		
		board.setHit(0);
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
	}
	
	//requestBoardView() 글 상세내용 가져오는 함수생성
	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		request.setAttribute("board", board);
	}
	
	//requestBoardUpdate() 함수 구현
	public void requestBoardUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setTitle(request.getParameter("title"));
		board.setContents(request.getParameter("contents"));
		board.setIp(request.getRemoteAddr());
		
		dao.updateBoard(board);
	}
	
	//requestBoardDelete()함수 구현
	public void requestBoardDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
	}
}










