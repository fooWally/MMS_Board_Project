package com.naver.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.naver.dto.BoardVO;

@Controller
//test folder
@RequestMapping("test")
//댓글 작업 using Ajax
public class TestAjaxController {
	
	@RequestMapping(value="test4", method=RequestMethod.POST)
	@ResponseBody
	// can use test4(String mList)
	public List<Map<String, Object>> test4(@RequestParam Map<String, Object> map) 
			throws Exception {
		//System.out.println(mList);
		//System.out.println(map);
		String jsonStr = map.get("mList").toString();
		System.out.println("jsonStr ="+jsonStr);
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> list = 
				mapper.readValue(jsonStr, new TypeReference<ArrayList<Map<String, Object>>>(){});
		
		for(Map<String, Object> m : list) {
			System.out.println("------------------------");
			System.out.println("m ="+m);
			System.out.println(m.get("id"));
			System.out.println(m.get("name"));
			System.out.println(m.get("age"));
		}
		return list;
	}
	
	
	@RequestMapping(value="test4", method=RequestMethod.GET)
	public void test4() {
	}
	
	@RequestMapping(value="test3", method=RequestMethod.POST)
	public @ResponseBody BoardVO test3(BoardVO vo) {
			System.out.println("vo"+ vo);
		return vo;
	}
	
	
	@RequestMapping(value="test3", method=RequestMethod.GET)
	public void test3() {
	}
	
	@RequestMapping(value="test22", method=RequestMethod.POST)
	@ResponseBody
	public String[] test22(String[] arr) {
		return arr;
	}
	@RequestMapping(value="test22", method=RequestMethod.GET)
	public void test22() {}
	
	//click on test2 button to execute what's in test2.jsp
	@RequestMapping(value="test2", method=RequestMethod.POST)
	@ResponseBody
	public String[] test2(String[] arr) {
		System.out.println("::::test2::::");
		for(String e: arr) {
			System.out.println(e);
		}
		System.out.println("::::test2::::");
		return arr;
	}
	//display test2 button by typing /test/test2 in url
	@RequestMapping(value="test2", method=RequestMethod.GET )
	public void test2() {}
	
	//click on test1 button to execute what's in test1.jsp
	// produces="application/text; charset=UTF-8" for korean characters
	@RequestMapping(value="test1", method = RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String test1(String str) {
		return str;
	}
	
	//display test1 button by typing /test/test1 in url
	@RequestMapping(value="test1", method = RequestMethod.GET)
	public void test1() {}
}
