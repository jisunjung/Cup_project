package com.teafunnycup.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.teafunnycup.common.Constants;
import com.teafunnycup.dao.BoardDAO;
import com.teafunnycup.dto.BoardDTO;

public class AnswerInsertsaveAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="qna.bizpoll";
		
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		Integer bno = Integer.parseInt(multi.getParameter("bno"));
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String filename = " "; //(공백)
		int filesize = 0;
		
		System.out.println("bno : " + bno + ", title : " + title + ", content : " + content + ", writer : " + writer);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bbDto = bDao.boardDetailView(bno);				// 상위 상세게시글의 내용
		
		int ref = bbDto.getRef();								// 기존게시글 bno
		int re_step = bbDto.getRe_step() + 1;					// 기존 게시글의 re_step + 1
		int re_level = bbDto.getRe_level() + 1;	 				// 기존 답변단계 re_level + 1
		
		try {
			  // 첨부파일의 집합(배열로 가져옴)
			  Enumeration files = multi.getFileNames();
			  
			  while(files.hasMoreElements()) {
				  // 첨부파일의 이름
				  String file1 = (String)files.nextElement();
				  filename = multi.getFilesystemName(file1);
				  File f1 = multi.getFile(file1);
				  
				  if(f1 != null) {
					  filesize = (int)f1.length(); // 파일 사이즈 저장
				  }
			  }
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  
		  // filename이 null 또는 ""일 때 "-" 처리
		  if(filename == null || filename.trim().equals("")) {
			  filename = "-";
		  }
		  
		  // 답글 순서 조정(re_step)
		  bDao.updateStep(ref, re_step);						// re_step : 출력순서 조정
		  
		  
		  BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize, ref, re_step, re_level);
		  int result = bDao.answerInsert(bDto);
	
		  if(result > 0) {
				System.out.println("답변 등록 성공");
		  } else {
				System.out.println("답변 등록 실패");
		  }
		
		  ActionForward forward = new ActionForward();
		  forward.setPath(url);
		  forward.setRedirect(false);
					
		  return forward;
	}
	

}
