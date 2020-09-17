package com.naver.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dto.ReplyVO;
import com.naver.service.ReplyService;

@RestController
@RequestMapping("replies") //uri, replies + data post
public class ReplyController {
	
	@Inject
	private ReplyService rservice;
	
	@RequestMapping(method = RequestMethod.PUT)
	public String update(@RequestBody ReplyVO vo) {
		System.out.println(vo);
		rservice.update(vo);
		return "success_update";
	}
	
	
	//read.jsp: 
	@RequestMapping(value="{rno}",  method=RequestMethod.DELETE)
	public String delete(@PathVariable int rno) {
		rservice.delete(rno);
		return "success_delete";
	}
	
//	@RequestMapping(method=RequestMethod.DELETE)
//	public String delete(@RequestBody String rno) {
//		System.out.println(rno);
//		return rno;
//	}
	
	@RequestMapping(value="{bno}" , method= RequestMethod.GET)
	public List<ReplyVO> list(@PathVariable Integer bno){
		List<ReplyVO> list = rservice.list(bno);
		// for test 
//		List<ReplyVO> list = new ArrayList<ReplyVO>();
//		list.add(new ReplyVO(3, 25, "rr", "aa", "2020-02-21 09:23", "2020-02-21 09:23"));
//		list.add(new ReplyVO(4, 25, "bb", "aa", "2020-02-21 09:23", "2020-02-21 09:23"));
//		list.add(new ReplyVO(5, 25, "cc", "aa", "2020-02-21 09:23", "2020-02-21 09:23"));
		return list;
	}
	
	@RequestMapping(value ="", method = RequestMethod.POST )
	public void insert(@RequestBody ReplyVO vo) {
//		System.out.println("reply vo ="+vo);
		rservice.insert(vo);
	}

}
