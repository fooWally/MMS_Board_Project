package com.naver.controller;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
//run things in test2 folder
//no Requestmapping necessary because url: '/rest1' in test1.jsp
public class Test2RestController  {
	
	@RequestMapping(value="rest4", method= RequestMethod.POST)
	public @ResponseBody String rest4(@RequestBody Map<String, Object> map) {
		Object obj0 = map.get("test2");//var test2 = "world"
		System.out.println(obj0);
		Object obj = map.get("test5"); //var test5 = ${mList} in test4.jsp
		System.out.println("map ="+ map);
		if (obj!=null) {
		   List<Map<String, Object>> list = (List<Map<String, Object>>) obj;
		   for (Map<String, Object> m : list) {
			   System.out.println(m.get("id"));
			   System.out.println(m.get("name"));
			   System.out.println(m.get("age"));
		   }
		}
		return "hello";
	}
	
	
	
	
	@RequestMapping(value="rest3", method = RequestMethod.POST)
	public void rest3(@RequestBody Map<String, Object> map) {
		Object obj = map.get("test4");
		if (obj!=null) {
			List<Map<String, Object>> list = (List<Map<String, Object>>) obj ;
		for (Map<String, Object> m : list) {
			System.out.println("------------------------");
			System.out.println(m.get("name"));
			System.out.println(m.get("age"));
			System.out.println(m.get("addr"));
			}
		}
	}
	
	
	@RequestMapping(value="rest2", method = RequestMethod.POST)
	public String rest2(@RequestBody Map<String, Object> map) {
		System.out.println(map.get("test1"));
		System.out.println(map.get("test2"));
		System.out.println(map.get("test3"));
		//string 'what' prints out in console.log(result)
		return "what";
	}
	
//	@RequestMapping(value="rest2", method = RequestMethod.POST)
//	public void rest2(@RequestBody String msg) {
		//see msg in console of editor: looks like a map -> so take msg as map
//		System.out.println("msg ="+msg);
//	}

	//name of method = rest1 and value="rest1" and url:/rest1
	@RequestMapping(value="rest1", method= RequestMethod.POST, produces="application/text; charset=UTF-8")
	public String rest1(@RequestBody String test1) {
		System.out.println("RestController test1 ="+test1);
		return "good "+test1;
	}
}
