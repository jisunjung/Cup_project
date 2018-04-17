package com.teafunnycup.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 커맨드에서 모든 Action작업 처리시
 *Action 메서드를 재정의해서 사용
*/

public interface Action {
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException;

}
