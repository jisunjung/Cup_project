package com.teafunnycup.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.teafunnycup.dao.ReplyDAO;
import com.teafunnycup.dto.ReplyDTO;

public class CommentListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "commentlist.jsp";
		
		Integer bno = Integer.parseInt(request.getParameter("bno"));
		
		// 상세 게시글 댓글 출력
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = rDao.replySelect(bno);
		request.setAttribute("replyview", list);
		
		// 상세 게시글 댓글수 카운트
		int re_count;
		re_count = rDao.replyCount(bno);
		System.out.println("re_count : " + re_count);
		request.setAttribute("re_count", re_count);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;
		
		
	}


}
