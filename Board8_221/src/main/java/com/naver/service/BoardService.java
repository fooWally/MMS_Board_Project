package com.naver.service;

import java.util.List;

import com.naver.dto.BoardVO;
import com.naver.dto.PageTO;

public interface BoardService {
	
	public abstract List<BoardVO> list();
	public abstract void insert(BoardVO vo);
	public abstract BoardVO read(int bno);
	public abstract BoardVO updateui(int bno);
	public abstract void update(BoardVO vo);
	public abstract PageTO listpage(PageTO to);

}
