package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class BListCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String sCurPage = request.getParameter("curPage");
		int curPage = 1;
		if(sCurPage!=null) {
			curPage = Integer.parseInt(sCurPage);
		}
		//처음 접속 했을때는 null이니까 curPage=1임 (초기화값)
		
		BoardDAO dao = new BoardDAO();
		
		//List<BoardDTO> list = dao.list();
		BPageTO to = dao.list(curPage);
		
		request.setAttribute("list", to.getList());
		request.setAttribute("to", to);
		
		System.out.println(to);
		
		return new CommandAction(false, "b_list.jsp");
	}

}
