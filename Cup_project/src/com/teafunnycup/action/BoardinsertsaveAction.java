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

public class BoardinsertsaveAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qna.bizpoll";
		
		//파일 업로드 처리
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		//파일을 저장할 디렉토리가 존재하지 않다면 디렉토리 생성
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		// request를 확장시킨 MultipartRequest 생성
		// new MultipartRequest(request, 파일업로드 디렉토리, 업로드 용량, 인코딩, 파일이름중복정책)
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String filename = " "; //(공백)
		int filesize = 0;
		//String file = request.getParameter("file_upload");	: 파일은 이렇게 가져올 수 없음. 예외처리가 필요함
		System.out.println(title + ", " + writer + ", " + content + ", ");
		
		
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
		
		
		
		BoardDAO bDAO = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
		int result = bDAO.boardInsert(bDto);
		// 게시글을 실제로 등록하고, 게시글 등록 후 게시글 목록 페이지로 이동
		if(result > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
				
		return forward;
	}
	

}
