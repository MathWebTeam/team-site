package com.xtuwebteam.service.impl;

import com.xtuwebteam.dao.mapper.NewsMapper;
import com.xtuwebteam.domain.entity.News;
import com.xtuwebteam.domain.model.Page;
import com.xtuwebteam.domain.model.Pageable;
import com.xtuwebteam.service.NewsService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author derker
 * @since 2017.11.17 00:13
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Resource
    private NewsMapper newsMapper;

    @Override
    public Page<News> listPost(Pageable pageable) {
        Example example = new Example(News.class);
        example.setOrderByClause("created_time DESC");
        List<News> content = newsMapper.selectByExampleAndRowBounds(example, pageable.getPageRowBounds());
        int total = newsMapper.selectCount(null);
        return new Page<>(content, pageable, total);
    }

    @Override
    public News getNews(Long id) {
        return newsMapper.selectByPrimaryKey(id);
    }
}
