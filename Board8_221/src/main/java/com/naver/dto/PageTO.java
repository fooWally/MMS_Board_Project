package com.naver.dto;

import java.util.List;

//페이징 처리와 관련한 모든 정보가 들어있는 클래스
public class PageTO {	
	
	private int curPage = 1; //상황마다 바뀜, 지정이 안되어있으면 1로 하겠다는 뜻
	private int amount; 	 // 상황마다 마뀜
	private int perPage = 10;
	private int totalPage;
	private int startNum;
	private int endNum;
	private int pageLine = 10;
	private int beginPageNum;
	private int stopPageNum;
	
	private List<BoardVO> list;
	
	
	public PageTO() {//디폴트 생성자
		process();
	}
	
	public PageTO(int curPage) {//사용자생성자
		this.curPage = curPage;
		process();
	}
	
	
	public List<BoardVO> getList() {
		return list;
	}

	public void setList(List<BoardVO> list) {
		this.list = list;
	}


	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
		process(); //현재 페이지가 바뀔때 메서드 호출
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getPageLine() {
		return pageLine;
	}

	public void setPageLine(int pageLine) {
		this.pageLine = pageLine;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		process(); //amount 값이 바뀔때 메서드 호출
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getBeginPageNum() {
		return beginPageNum;
	}

	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}

	public int getStopPageNum() {
		return stopPageNum;
	}

	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}
	
	public void process() {	//amount 값이 바뀔때마다, 현재 페이지가 바뀔때마다 이 메서드가 실행되어야함
		totalPage = (amount -1) / perPage +1;
		startNum = (curPage -1) * perPage +1;
		endNum = curPage * perPage;
		if(endNum > amount) {
			endNum = amount;
		}
		
		beginPageNum = ((curPage-1)/pageLine) * pageLine +1;
		stopPageNum = beginPageNum + (pageLine -1);
		if(stopPageNum > totalPage) {
			stopPageNum = totalPage;
		}
		
	}


	@Override
	public String toString() {
		return "PageTO [curPage=" + curPage + ", amount=" + amount + ", perPage=" + perPage + ", totalPage=" + totalPage
				+ ", startNum=" + startNum + ", endNum=" + endNum + ", pageLine=" + pageLine + ", beginPageNum="
				+ beginPageNum + ", stopPageNum=" + stopPageNum + "]";
	}


	

}
