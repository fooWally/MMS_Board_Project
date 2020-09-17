package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class MCheckIdCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		MemberDTO dto = new MemberDAO().read(id);
	
		
		if(dto!=null) {
			response.getWriter().print("0");
		} else {
			response.getWriter().print("1");
		}
		
		return null;
	}

}
