package com.spring.getjob.paging;

import org.springframework.web.util.UriComponentsBuilder;

public class PageVO {
    private int page;  // 현재 페이지
    private int perPageNum;  // 페이지당 보여줄 게시물 수 
    private String searchType;
    private String keyword;
    
    public PageVO() {
    	this.page=1;
    	this.perPageNum=10;
    	this.searchType=null;
    	this.keyword=null;
    	
    }
    
    public String makeQuery() {
    	UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
				
		if (searchType!=null) {
			uriComponentsBuilder
					.queryParam("searchType", this.searchType)
					.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
	}
    
    
    public int getPageStart() {
    	return (this.page -1) * perPageNum;
    }

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0) {
			this.page=1;
		}else {
			this.page=page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum >100) {
			this.perPageNum=10;
		}else {
			this.perPageNum=perPageNum;
		}
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
