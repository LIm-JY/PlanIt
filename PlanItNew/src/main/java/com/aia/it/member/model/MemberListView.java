package com.aia.it.member.model;

import java.util.List;

public class MemberListView {
	
	private int memberTotalCnt; //총멤버수
	private int currentPageNum;
	private List<Member> memberList; 
	private int pageTotalCnt; //총 페이지
	private int memberCntPerPage; //페이지당 멤버리스트의 멤버수
	private int startRow;
	
	public MemberListView() {

	}

	public MemberListView(int memberTotalCnt, int currentPageNum, List<Member> memberList,
			int memberCntPerPage, int startRow) {
		this.memberTotalCnt = memberTotalCnt;
		this.currentPageNum = currentPageNum;
		this.memberList = memberList;
		this.memberCntPerPage = memberCntPerPage;
		this.startRow = startRow;
		calTotalCnt();
	} 
	
	//멤버리스트 페이지
	private void calTotalCnt() { 
		if(memberTotalCnt == 0) { 
			pageTotalCnt = 0; 
			}else {
				pageTotalCnt = memberTotalCnt/memberCntPerPage;
				if(memberTotalCnt % memberCntPerPage > 0) {
					pageTotalCnt++;
				}
				System.out.println(pageTotalCnt);
			}		
	}

	public int getMemberTotalCnt() {
		return memberTotalCnt;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public List<Member> getMemberList() {
		return memberList;
	}

	public int getPageTotalCnt() {
		return pageTotalCnt;
	}

	public int getMemberCntPerPage() {
		return memberCntPerPage;
	}

	public int getStartRow() {
		return startRow;
	}

	@Override
	public String toString() {
		return "MemberListView [memberTotalCnt=" + memberTotalCnt + ", currentPageNum=" + currentPageNum
				+ ", memberList=" + memberList + ", pageTotalCnt=" + pageTotalCnt + ", memberCntPerPage="
				+ memberCntPerPage + ", startRow=" + startRow + "]";
	}

	
	
	
	
	
	
}
