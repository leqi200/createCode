package com.example.demo.common;

import java.io.Serializable;
import java.util.List;


public class PageTO<T> implements Serializable {

    private static final long serialVersionUID = 1L;

        // 当前页
        private int page;
        // 总记录数
        private long total;
        // 总页数
        private int pages;
        // 每页的数量
        private int limit;
     // 结果集
        private List<T> list;

        public int getPage() {
            return page;
        }

        public void setPage(int page) {
            this.page = page;
        }

        public long getTotal() {
            return total;
        }

        public void setTotal(long total) {
            this.total = total;
        }

        public int getPages() {
            return pages;
        }

        public void setPages(int pages) {
            this.pages = pages;
        }

        public List<T> getList() {
            return list;
        }

        public void setList(List<T> list) {
            this.list = list;
        }

        public int getLimit() {
			return limit;
		}

		public void setLimit(int limit) {
			this.limit = limit;
		}


        
        /**
         * 分页
         *
         * @param list       列表数据
         * @param totalCount 总记录数
         * @param pageSize   每页记录数
         * @param currPage   当前页数
         */
        public PageTO(List<T> list, int total, int page, int limit) {
            this.list = list;
            this.total = total;
            this.limit = limit;
            this.page = page;
            this.pages = (int) Math.ceil((double) total / limit);
        }
        
        
        /**
         * 分页
         *
         * @param list       列表数据
         * @param totalCount 总记录数
         * @param pageSize   每页记录数
         * @param currPage   当前页数
         */
        public PageTO(List<T> list, int total,Query query) {
            this.list = list;
            this.total = total;
            this.limit = query.getLimit();
            this.page = query.getPage();
            this.pages = (int) Math.ceil((double) total / limit);
        }
}
