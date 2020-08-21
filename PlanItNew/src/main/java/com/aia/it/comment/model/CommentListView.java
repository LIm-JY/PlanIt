package com.aia.it.comment.model;

import java.util.List;

public class CommentListView {

	private int commentTotalCount;
	private int currentPageNumber;
	private List<Comment> CommentList;
	private int pageTotalCount;
	private int commentCountPerpage;
	private int startRow;
	
	
	public CommentListView(int commentTotalCount, int currentPageNumber, List<Comment> commentList, 
			int commentCountPerpage, int startRow) {
		this.commentTotalCount = commentTotalCount;
		this.currentPageNumber = currentPageNumber;
		CommentList = commentList;
		this.commentCountPerpage = commentCountPerpage;
		this.startRow = startRow;
		calTotalCount();
		
		
	}
	
	
	private void calTotalCount() {
		
		if(commentTotalCount==0) {
			
			pageTotalCount=0;
			
		}else {
			
			pageTotalCount = commentTotalCount/commentCountPerpage;
			System.out.println(commentTotalCount%commentCountPerpage);
			
			if(commentTotalCount/commentCountPerpage > 0) {
				pageTotalCount ++;
			}
			
			System.out.println(pageTotalCount);
		}
	}
	
	
	
	
	
	public CommentListView() {
	}
	public int getCommentTotalCount() {
		return commentTotalCount;
	}
	public void setCommentTotalCount(int commentTotalCount) {
		this.commentTotalCount = commentTotalCount;
	}
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	public List<Comment> getCommentList() {
		return CommentList;
	}
	public void setCommentList(List<Comment> commentList) {
		CommentList = commentList;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	public int getCommentCountPerpage() {
		return commentCountPerpage;
	}
	public void setCommentCountPerpage(int commentCountPerpage) {
		this.commentCountPerpage = commentCountPerpage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	@Override
	public String toString() {
		return "CommentListView [commentTotalCount=" + commentTotalCount + ", currentPageNumber=" + currentPageNumber
				+ ", CommentList=" + CommentList + ", pageTotalCount=" + pageTotalCount + ", commentCountPerpage="
				+ commentCountPerpage + ", startRow=" + startRow + "]";
	}

	
	
	
	
	
	

}
