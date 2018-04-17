package com.teafunnycup.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dao.ReplyDAO;
import com.teafunnycup.dto.BoardDTO;
import com.teafunnycup.dto.ReplyDTO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "qnaone.jsp";	// 게시글 상세페이지 출력
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("게시글 번호 = " + bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		// 조회수 1 증가
		bDao.boardViewCnt(bno);
		
		
		// 상세 게시글 출력
		BoardDTO bDto = bDao.boardDetailView(bno);
		request.setAttribute("boardview", bDto);
		
		
		
		// 상세 게시글 댓글 출력
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = rDao.replySelect(bno);
		
		request.setAttribute("replyview", list);

		// 상세 게시글 댓글수 카운트
		int re_count;
		
		
		re_count = rDao.replyCount(bno);
		//System.out.println("test1111111111111111111111111111111111");
		System.out.println("re_count : " + re_count);
		//System.out.println("test1111111111111111111111111111111111");
		request.setAttribute("re_count", re_count);
		//System.out.println("test2222222222222222222222222222222222");
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		//System.out.println("test3333333333333333333333333333333333");		
		return forward;
		
	}
}
