package com.shoppingkitten.service;

import com.shoppingkitten.dao.ArticleDao;
import com.shoppingkitten.entity.Article;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

/**
 * Created by Administrator on 2017/7/3 0003.
 */
@Service
public class ArticleService {
    @Resource
    private ArticleDao ad;//注入资源
    //读取数据
    public ArrayList<Article> findArticle(){
        return  ad.findArticle();
    }
    //保存文章
    public  int saveArticle(Article article){
        return  ad.saveArticle(article);
    }
    //更新文章
    public  int updateArticle(Article article){
        return  ad.updateArticle(article);
    }
    //删除文章
    public  int removeArticle(Article article){
        return  ad.removeArticle(article);
    }

    //根据title查找文章
    public  ArrayList<Article> findArticleByTitle(String title){
        return ad.findArticleByTitle(title);
    }
    //根据text查找文章
    public  ArrayList<Article> findArticleByText(String text){
        return ad.findArticleByText(text);
    }
}
