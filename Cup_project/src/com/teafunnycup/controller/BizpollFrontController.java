package com.teafunnycup.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.action.Action;
import com.teafunnycup.action.ActionForward;
import com.teafunnycup.action.BoardDeleteAction;
import com.teafunnycup.action.BoardDeleteChekeAction;
import com.teafunnycup.action.BoardDetailAction;
import com.teafunnycup.action.BoardLoginChekeAction;
import com.teafunnycup.action.BoardSearchAction;
import com.teafunnycup.action.BoardUpdateSaveAction;
import com.teafunnycup.action.BoardUpdateViewAction;
import com.teafunnycup.action.BoardinsertsaveAction;
import com.teafunnycup.action.ConstractAction;
import com.teafunnycup.action.IdOlapCkAction;
import com.teafunnycup.action.IndexAction;
import com.teafunnycup.action.LoginAction;
import com.teafunnycup.action.LoginAjaxAction;
import com.teafunnycup.action.LoginCkAction;
import com.teafunnycup.action.LoginOutAction;
import com.teafunnycup.action.MemAjaxAction;
import com.teafunnycup.action.MemberAction;
import com.teafunnycup.action.MemberInsertAction;
import com.teafunnycup.action.QnaAction;
import com.teafunnycup.action.ReplyAction;
import com.teafunnycup.action.ReplyDeleteAction;
import com.teafunnycup.action.WriteqnaAction;

/**
 * Servlet implementation class bizpllFrontcontroller
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	// 생성자
    public BizpollFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    // 매개변수 자동생성 (request, response)
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// Action interface사용
		// 인터페이스
		Action action = null;
		
		// 페이지 이동방법 결정 ( Forward, sendRedirect)
		ActionForward forward = null;
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length()); // uri에서 ctx를 빼면 내가 원하는 소스만 출력 가능
		
		System.out.println("uri ===> " + uri);
		System.out.println("ctx ===> " + ctx);
		System.out.println("command ===> " + command);
		
		// ======= 액션 매핑 ======= //
		// 실제로 동작하는 곳, 하나의 Servlet에서 URL을 읽어 해당 기능을 구현
		if(command.equals("/index.bizpoll")) {
			System.out.println("servlet start");
			action = new IndexAction(); // action은 인터페이스 : 다형성을 이용해서 해당 액션기능을 action에 넣음
			//System.out.println("controller 시작 전");
			forward = action.excute(request, response); // 공통 분기작업에 보낼 forward
			//System.out.println("controller 시작 후");
		} else if(command.equals("/login.bizpoll")) {
			action = new LoginAction();
			forward = action.excute(request, response);
		} else if(command.equals("/member.bizpoll")) {
			action = new MemberAction();
			forward = action.excute(request, response);
		}else if(command.equals("/constract.bizpoll")) {
			action = new ConstractAction();
			forward = action.excute(request, response);
		} else if(command.equals("/id_olap_ck.bizpoll")) {
			action = new IdOlapCkAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberinsert.bizpoll")) {
			action = new MemberInsertAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memajax.bizpoll")) {
			action = new MemAjaxAction();
			forward = action.excute(request, response);
		} else if(command.equals("/loginck.bizpoll")) {
			action = new LoginCkAction();
			forward = action.excute(request, response);
		} else if(command.equals("/loginajax.bizpoll")) {
			action = new LoginAjaxAction();
			forward = action.excute(request, response);
		} else if(command.equals("/loginout.bizpoll")) {
			action = new LoginOutAction();
			forward = action.excute(request, response);
		} else if(command.equals("/qna.bizpoll")) {
			action = new QnaAction();
			forward = action.excute(request, response);
		} else if(command.equals("/writeqna.bizpoll")) {
			action = new WriteqnaAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardinsertsave.bizpoll")) {
		action = new BoardinsertsaveAction();
		forward = action.excute(request, response);
		} else if(command.equals("/boarddetail.bizpoll")) {
			action = new BoardDetailAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardupdateview.bizpoll")) {
			action = new BoardUpdateViewAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardupdatesave.bizpoll")) {
			action = new BoardUpdateSaveAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boarddelete.bizpoll")) {
			action = new BoardDeleteAction();
			forward = action.excute(request, response);
		} else if(command.equals("/board_delete_ck.bizpoll")) {
			action = new BoardDeleteChekeAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardloginck.bizpoll")) {
			action = new BoardLoginChekeAction();
			forward = action.excute(request, response);
		} else if(command.equals("/reply.bizpoll")) {
			action = new ReplyAction();
			forward = action.excute(request, response);
		}  else if(command.equals("/replydelete.bizpoll")) {
			action = new ReplyDeleteAction();
			forward = action.excute(request, response);
		}  else if(command.equals("/boardsearch.bizpoll")) {
			action = new BoardSearchAction();
			forward = action.excute(request, response);
		}
		
		
		//System.out.println("ActionForward 전");
		// ======= 공통분기 작업 ======= //
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				//System.out.println("forward로 실행");
				//System.out.println(forward.getPath());
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
		
	}

	
}
