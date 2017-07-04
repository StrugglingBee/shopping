package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Article;
import com.shoppingkitten.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ArticleController {
    @Resource
    private ArticleService as;//注入资源

    //读取数据
    @RequestMapping("findArticle.do")
    @ResponseBody
    public ArrayList<Article> findArticle() {
        return as.findArticle();
    }

    //保存文章
    @RequestMapping("saveArticle.do")
    @ResponseBody
    public int saveArticle(Article article) {
        if (article.getId() == 0) {
            return as.saveArticle(article);
        } else {
            return as.updateArticle(article);
        }
    }

    //删除文章
    @RequestMapping("removeArticle.do")
    @ResponseBody
    public int removeArticle(@RequestBody List<Integer> id) {
        int rs = 0;
        if (id != null) {
            //转化成ArrayList
            ArrayList<Integer> ids = (ArrayList<Integer>) id;
            rs = as.removeArticle(ids );
        }
        return rs;
    }
    //查找文章
    @RequestMapping("searchArticle.do")
    @ResponseBody
    public ArrayList<Article> searchArticle(String type, String value) {
        ArrayList<Article> al = null;
        if (value != null && type != null) {
            switch (type) {
                case "title":
                    value = "%" + value + "%";
                    al = as.findArticleByTitle(value);
                    break;
                case "text":
                    value = "%" + value + "%";
                    al = as.findArticleByText(value);
                    break;
            }
        }
        return  al;
    }
}
