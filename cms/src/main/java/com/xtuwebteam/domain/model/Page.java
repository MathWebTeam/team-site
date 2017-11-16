package com.xtuwebteam.domain.model;

import java.util.List;

public class Page<T> {
    private int page; // 页码（从1开始计数）
    private int size; // 页面大小
    private int total; // 数据总数
    private List<T> content;

    public Page(List<T> content, Pageable pageable, int total) {
        this.content = content;
        this.page = pageable.getPage();
        this.size = pageable.getSize();
        this.total = total;
    }

    public Page(List<T> content, int page, int size, int total) {
        this.content = content;
        this.page = page;
        this.size = size;
        this.total = total;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getContent() {
        return content;
    }

    public void setContent(List<T> content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Page{" +
                "page=" + page +
                ", size=" + size +
                ", total=" + total +
                ", content=" + content +
                '}';
    }
}
