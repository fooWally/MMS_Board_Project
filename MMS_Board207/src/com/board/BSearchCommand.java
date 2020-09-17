package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class BSearchCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String sCurPage = request.getParameter("curPage");
		String sValue = request.getParameter("target");
		String condition  = request.getParameter("condition");
		
		int curPage  = 1;
		if(sCurPage != null) {
			curPage = Integer.parseInt(sCurPage);
		}
		int value = 1;
		if(sValue != null) {
			value = Integer.parseInt(sValue);
		}
		BoardDAO dao = new BoardDAO();
		BPageTO to = dao.search(curPage, value, condition);
		System.out.println("target, condition ="+ sValue +":"+ condition);
		
		request.setAttribute("list",to.getList());
		request.setAttribute("to", to);
		request.setAttribute("condition", condition);
		request.setAttribute("value", value);
		return new CommandAction(false, "b_searchlist.jsp");
	}

}
