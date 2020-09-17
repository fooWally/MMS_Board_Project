package com.naver.controller;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.dto.BoardVO;
import com.naver.dto.PageTO;
import com.naver.service.BoardService;

//annotation to create controller in servlet-context.xml
@Controller 
@RequestMapping("board")
public class BoardController {
	
	@Inject
	private BoardService bservice;
	
	//paging 처리하는 method
	@RequestMapping(value="listpage", method=RequestMethod.GET)
	public void listpage(PageTO to,  Model model) {
//		System.out.println("to before ="+to);
		to	= bservice.listpage(to); //clicking page gets "to" input data(e.g. curPage) --> bservice.listpage = to is more data
//		System.out.println("to after ="+to);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(BoardVO vo, @RequestParam("curPage") int curPage) {
		bservice.update(vo); //paging 처리후 add parameter curPage
		return "redirect:/board/listpage?curPage="+curPage;
	}
	
	@RequestMapping(value="update", method = RequestMethod.GET)
	//bno is not a pathVariable
	public String updateui(int bno, int curPage, Model model) {
		BoardVO vo = bservice.updateui(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage); //paging 처리후 add & bind curPage 
		return "board/update";
	}
	
	@RequestMapping(value = "read/{bno}", method=RequestMethod.GET)
	public String read(@PathVariable("bno") int bno, int curPage, Model model) {
		BoardVO vo = bservice.read(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage); //paging 처리후 add & bind curPage
		return "/board/read";
	}
	
	@RequestMapping("list")
	public void list(Model model){
		List<BoardVO> list = bservice.list();
		model.addAttribute("list", list);
	}
	@RequestMapping(value = "insert", method=RequestMethod.POST)
	public String insert(BoardVO vo) {
		bservice.insert(vo);
		return "redirect:/board/list"; // after insert action, goes to list
	}

	@RequestMapping(value = "insert", method=RequestMethod.GET)
	public void insertui() {}
	
	
}
