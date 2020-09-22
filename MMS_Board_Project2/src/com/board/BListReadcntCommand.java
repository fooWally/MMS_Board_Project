package com.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.naver.Command;
import com.naver.CommandAction;

public class BListReadcntCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession sess = request.getSession(false);
		Object login=sess.getAttribute("login");
		if(login!=null) {
			BoardDAO dao = new BoardDAO();
			List<BoardDTO> list = dao.listreadcnt();
			request.setAttribute("list", list);
		return new CommandAction(false, "b_listreadcnt.jsp");

		}else {
			return new CommandAction(false, "m_login.jsp");
		}
	}

}
