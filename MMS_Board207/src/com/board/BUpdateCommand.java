package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class BUpdateCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String sNum = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		int num = -1;
		if(sNum!=null) {
			num = Integer.parseInt(sNum);
		}
		
		new BoardDAO().update(new BoardDTO(num, null, title, content, null, 0, 0, 0, 0, 0, 0));
		
		return new CommandAction(true, "blist.do");
	}

}
