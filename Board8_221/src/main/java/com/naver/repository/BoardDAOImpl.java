package com.naver.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.naver.dto.BoardVO;
import com.naver.dto.PageTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	private final String NS ="com.naver.board";

	@Override
	public List<BoardVO> list() {
		return session.selectList(NS+".list");
	}

	@Override
	public void insert(BoardVO vo) {
		session.insert(NS+".insert", vo);
	}

	@Override
	public BoardVO read(int bno) {
		return session.selectOne(NS+".read", bno);
	}

	@Override
	public void updateReadcnt(int bno) {
		session.update(NS+".updateReadcnt",bno);
	}

	@Override
	public BoardVO updateui(int bno) {
		return session.selectOne(NS+".updateui", bno);
	}

	@Override
	public void update(BoardVO vo) {
		session.update(NS+".update",vo);
	}

	@Override
	public int getAmount() {
		return session.selectOne(NS+".getAmount");
	}

	@Override
	public List<BoardVO> getListpage(PageTO to) {
		// rb offset -1 : compare it to when no -1: without -1, the page doesn't display the latest article
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());
		return session.selectList(NS+".getListpage", null, rb);
	}

}
