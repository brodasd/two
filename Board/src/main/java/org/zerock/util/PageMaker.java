package org.zerock.util;

public class PageMaker {
	// current page number;
	private int current;
	private int total;
	private int firstPage, lastPage, prev, next;

	public PageMaker(int current, int total) {
		this.current = current;
		this.total = total;
		calcPage();
	}

	private void calcPage() {

		int tempLast = (int) (Math.ceil(current / 10.0) * 10);

		this.firstPage = tempLast - 9;

		if (firstPage != 1) {
			this.prev = firstPage - 1;
		}

		if (this.total <= tempLast * 10) {
			this.lastPage = (int) (Math.ceil(total / 10.0));
			this.next = -1;

		} else {
			this.lastPage = tempLast;
			this.next = this.lastPage + 1;
		}
	}

	public int getCurrent() {
		return current;
	}

	public int getTotal() {
		return total;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getPrev() {
		return prev;
	}

	public int getNext() {
		return next;
	}

	@Override
	public String toString() {
		return "PageMaker [current=" + current + ", total=" + total + ", firstPage=" + firstPage + ", lastPage="
				+ lastPage + ", prev=" + prev + ", next=" + next + "]";
	}

}