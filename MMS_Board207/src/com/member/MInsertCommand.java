package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class MInsertCommand implements Command  {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		System.out.println(id+":"+pw+":"+name+":"+birth+":"+email);
		new MemberDAO().insert(new MemberDTO(id, pw, name, birth, email));
//		String [] id = {"m001","m002","m003", "m004", "m005","m006"};
//		String [] pw = {"1234","2345","3456","4567", "5678","6789"};
//		String [] name = {"john", "ryu", "kim", "홍길동", "아무나","나무"};
//		String [] birth = {"1980-12-31", "1999-02-27", "1989-07-01","1990-05-21","1970-09-13","1999-01-08"}; 
//		String [] email = {"abc@oh.com", "bcd@aa.com","aaa@bbc.com","ddd@korea.com","abc@mbc.net","dada@abc.com"};
//		for (int i = 0; i < email.length; i++) {
//			new MemberDAO().insert(new MemberDTO(id[i], pw[i], name[i], birth[i], email[i]));
//		}
		return new CommandAction(true, "index.jsp");

	}

}
