package com.shoppingkitten.dao;

import com.shoppingkitten.entity.Article;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
@Repository
public interface ArticleDao {
    //读取数据
    ArrayList<Article> findArticle();
    //添加保存文章
    int saveArticle(Article article);
    //更新文章
    int updateArticle(Article article);
    //删除文章
    int removeArticle(ArrayList<Integer> ids);
    //根据title查找文章
    ArrayList<Article> findArticleByTitle(String title);
    //根据text查找文章
    ArrayList<Article> findArticleByText(String text);
}
