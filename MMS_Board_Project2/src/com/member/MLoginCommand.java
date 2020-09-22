package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;


public class MLoginCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("++++++++");
		System.out.println(id + pw);
		
		
		MemberDTO login = new MemberDAO().login(new MemberDTO(id, pw, null, null, null));
		System.out.println("++++++++");
		System.out.println(login);
		request.getSession().setAttribute("login", login);
		
		return new CommandAction(true, "index.jsp");
	}

}
