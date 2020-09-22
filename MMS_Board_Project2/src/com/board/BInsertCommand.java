package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.Command;
import com.naver.CommandAction;

public class BInsertCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardDAO dao = new BoardDAO();
		dao.insert(new BoardDTO(-1, author, title, content, null, 0, -1, 0, 0, 0, 0)); //num값은 무엇을 넣어도 상관없음(어차피 dao에서 num값 다시 세팅함)
//		String[] author = {"이맹똥", "이멋나", "임앵두", "제대로", "제우스", "조약돌", "주피터", "지자랑", "최고다", "최최고", "추미남", "허억", "홍탁"};
//		String[] title = {"청하", "이름이", "지어줄 수 있는 이름", "별명이 많다", "스웨덴에서는", "법으로 금지", "전산 입력 쪽", "명단", "청하", "가수 김청하", "한 글자 추가", "항변하는", "이유는 간단하다"};
//		String[] content = {"여성 솔로 가수 김청하 ", "이름이 '청하'라서 술과 관련된 별명이 많다.", "아이에게 지어줄 수 있는 이름의 명단", " 스웨덴에서는 자녀에게 이상한 이름을 지어주는 것을 법으로 금지한다.", "전산 입력 쪽에서 문제인 이유는 간단하다", "특히 그거 한 글자 추가해 주는 게 그렇게 어렵냐!", "항변하는 경우가 많은데, 정말 어려운 일이다", "굳이 책임 소재를 찾자면 이름을 지어 주신 부모님", "개명하는 게 그리 어려운 일도 아니고 사는데", "입 털어서 바꿀 정도다", "추미남", "본인이 개의치 않으면 남의 이름 가지고 왈가왈부할", "이름 자체는 평범한데 성, 직급, 관등성명과 붙여 읽으면 이상해지는 경우"};
//
//		BoardDAO dao = new BoardDAO();
//		for (int i = 1; i < author.length ; i++) {
//			dao.insert(new BoardDTO(-1, author[i], title[i], content[i], null, 0, -1, 0, 0, 0, 0));
//			try { Thread.sleep(50); 
//			} catch
//			(InterruptedException e) {
//				e.printStackTrace(); 
//			} 
//		}
//		BoardDAO dao = new BoardDAO();
//		for (int i = 1; i < 100 ; i++) {
//			dao.insert(new BoardDTO(-1, "author"+i, "title"+i, "content"+i, null, 0, -1, 0, 0, 0, 0));
//			try { Thread.sleep(50); 
//			} catch
//			(InterruptedException e) {
//				e.printStackTrace(); 
//			} 
//		}
		return new CommandAction(true, "blist.do");
	}

}
