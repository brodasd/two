package org.zerock.domain;

public class SearchCriteria extends Criteria {

	private String sType;
	private String keyword;

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [sType=" + sType + ", keyword=" + keyword + "]";
	}

}
