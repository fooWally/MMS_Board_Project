package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class BReadCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sNum = request.getParameter("num");
		
		int num = -1;
		
		if(sNum!=null) {
			num = Integer.parseInt(sNum);
		}
		
		BoardDTO dto = new BoardDAO().read(num);
		
		request.setAttribute("dto", dto);
				
		return new CommandAction(false, "b_read.jsp");
	}

}
