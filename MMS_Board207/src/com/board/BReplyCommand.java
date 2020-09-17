package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class BReplyCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String sNum = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		
		int orinum = -1;
		if(sNum!=null) {
			orinum = Integer.valueOf(sNum);
		}
		
		new BoardDAO().reply(orinum, title, content, author);
		
		return new CommandAction(true, "blist.do");
	}

}
