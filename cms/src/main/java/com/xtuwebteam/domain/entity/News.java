package com.xtuwebteam.domain.entity;

import com.xtuwebteam.domain.base.BaseEntity;

import java.util.Date;

/**
 * 新闻实体
 */
public class News extends BaseEntity {

    /**
     * 标题
     */
    private String title;
    /**
     * 作者
     */
    private String author;
    /**
     * 摘要
     */
    private String summary;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public static void main(String[] args) {
        System.out.println(new Date());
    }
}
