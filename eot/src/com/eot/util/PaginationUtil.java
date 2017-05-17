package com.eot.util;

public class PaginationUtil {
	
	public static int[] getPageIndex(Pagination pagination) {
		int pageIndex[] = null;
		int currentPage = pagination.getCurrentPage();
		int pageCount = pagination.getPageCount();
		
		if (pageCount <= 5) {
			pageIndex = new int[pageCount];
			for (int i = 0; i < pageCount; i++) {
				pageIndex[i] = i + 1;
		}
			return pageIndex;
		}
		
		if ((pageCount - currentPage) > 5) {
			pageIndex = new int[5];
			pageIndex[0] = currentPage - 1;
			pageIndex[1] = currentPage ;
			pageIndex[2] = -1;
			pageIndex[3] = currentPage + 1;
			pageIndex[4] = currentPage + 2;
			return pageIndex;
		}
		
		if ((pageCount - currentPage) <= 4) {
			pageIndex = new int[5];
			pageIndex[0] = pageCount - 4;
			pageIndex[1] = pageCount - 3;
			pageIndex[2] = pageCount - 2;
			pageIndex[3] = pageCount - 1;
			pageIndex[4] = pageCount;
			return pageIndex;
		}
		return new int[]{1};
	}
	
	 public boolean isFirstPage(Pagination pagination) {
	        if(pagination.getCurrentPage() <= 1){
	            return true;
	        }
	        
	        return false;
	 }

	 public boolean isLastPage(Pagination pagination) {
	        if(pagination.getCurrentPage() >= pagination.getPageCount()){
	            return true;
	        }
	        
	        return false;
	 }
}
