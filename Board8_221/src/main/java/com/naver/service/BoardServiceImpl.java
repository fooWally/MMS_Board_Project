package com.naver.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dto.BoardVO;
import com.naver.dto.PageTO;
import com.naver.repository.BoardDAO;


//annotate to create bservice obj
@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public List<BoardVO> list() {
		return bdao.list();
	}

	@Override
	public void insert(BoardVO vo) {
		bdao.insert(vo);
	}

	@Override
	public BoardVO read(int bno) {
		bdao.updateReadcnt(bno);
		return bdao.read(bno);
	}

	@Override
	public BoardVO updateui(int bno) {
		return bdao.updateui(bno);
	}

	@Override
	public void update(BoardVO vo) {
		bdao.update(vo);
	}

	@Override
	public PageTO listpage(PageTO to) {
		 int amount = bdao.getAmount();
		 to.setAmount(amount);
		 List<BoardVO> list = bdao.getListpage(to);
		 to.setList(list);
		 System.out.println("amount = "+amount);
		 System.out.println(list);
		return to;
	}

}
