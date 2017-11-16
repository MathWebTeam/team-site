package com.xtuwebteam.service;

import com.xtuwebteam.domain.entity.News;
import com.xtuwebteam.domain.model.Page;
import com.xtuwebteam.domain.model.Pageable;


public interface NewsService {

    Page<News> listPost(Pageable pageable);

    News getNews(Long id);
}
