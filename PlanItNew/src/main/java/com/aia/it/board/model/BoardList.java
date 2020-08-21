package com.aia.it.board.model;

import java.util.List;


public class BoardList {
	
	private int boardTotalCount;
	private int currentPageNumber;
	private List<Board> BoardList;
	private int pageTotalCount;
	private int boardCountPerpage;
	private int startRow;
	
	
	public BoardList() {
	}
	
	
	public BoardList(int boardTotalCount, int currentPageNumber, List<Board> boardList,
			int boardCountPerpage, int startRow) {
		this.boardTotalCount = boardTotalCount;
		this.currentPageNumber = currentPageNumber;
		BoardList = boardList;
		this.pageTotalCount = pageTotalCount;
		this.boardCountPerpage = boardCountPerpage;
		this.startRow = startRow;
		calTotalCount();
	}
	
private void calTotalCount() {
		
		if(boardTotalCount==0) {
			
			pageTotalCount=0;
			
		}else {
			
			pageTotalCount = boardTotalCount/boardCountPerpage;
			System.out.println("보드/카운트페이지"+boardTotalCount%boardCountPerpage);
			
			if(boardTotalCount%boardCountPerpage > 0) {
				pageTotalCount ++;
			}
			
			System.out.println("pageTotalCount"+pageTotalCount);
		}
	}
	public int getBoardTotalCount() {
		return boardTotalCount;
	}


	public void setBoardTotalCount(int boardTotalCount) {
		this.boardTotalCount = boardTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}


	public List<Board> getBoardList() {
		return BoardList;
	}


	public void setBoardList(List<Board> boardList) {
		BoardList = boardList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getBoardCountPerpage() {
		return boardCountPerpage;
	}


	public void setBoardCountPerpage(int boardCountPerpage) {
		this.boardCountPerpage = boardCountPerpage;
	}


	public int getStartRow() {
		return startRow;
	}


	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}


	@Override
	public String toString() {
		return "BoardList [boardTotalCount=" + boardTotalCount + ", currentPageNumber=" + currentPageNumber
				+ ", BoardList=" + BoardList + ", pageTotalCount=" + pageTotalCount + ", boardCountPerpage="
				+ boardCountPerpage + ", startRow=" + startRow + "]";
	}
	
	
	
	

}
