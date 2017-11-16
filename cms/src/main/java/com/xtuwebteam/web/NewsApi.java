package com.xtuwebteam.web;

import com.xtuwebteam.domain.model.Pageable;
import com.xtuwebteam.service.NewsService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/news")
public class NewsApi {

    @Resource
    private NewsService newsService;

    @GetMapping
    public ResponseEntity listNews(Pageable pageable) {
        return ResponseEntity.ok(newsService.listPost(pageable));
    }

    @GetMapping("/{id}")
    public ResponseEntity getNews(@PathVariable Long id) {
        return ResponseEntity.ok(newsService.getNews(id));
    }
}
