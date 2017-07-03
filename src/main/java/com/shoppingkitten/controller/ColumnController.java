package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Column;
import com.shoppingkitten.service.ColumnService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class ColumnController {

    @Resource
    private ColumnService cs;//注入资源

    //分页显示
//    @RequestMapping("findColumnByPage.do")
//    @ResponseBody
//    public ArrayList<Column> findColumnByPage(int page,int size){
//        ArrayList<Column> data=null;
//        if(page>0&&size>0){
//            int start=(page-1)*size;
//            int end=size;
//            //封装成Map
//            HashMap<String,Integer> map=new HashMap<>();
//            map.put("start",start);
//            map.put("end",size);
//            data=cs.findColumnByPage(map);
//            //查询数据条数
//            int counts=cs.findColumnCounts();
//            data.get(0).setCounts(counts);
//            return  data;
//        }
//        return  data;
//    }
    //查询所有栏目
    @RequestMapping("findColumn.do")
    @ResponseBody
    public ArrayList<Column> findColumn(){
       return  cs.findColumn();
    }
    //保存栏目到数据库
    @RequestMapping("saveColumn.do")
    @ResponseBody
    public  int saveColumn(Column column) {
//        System.out.println(column.toString());
        if (column.getId() == 0) {
            return cs.saveColumn(column);
        } else {
            return cs.updateColumn(column);
        }
    }
//删除栏目
        @RequestMapping("removeColumn.do")
        @ResponseBody
        public int removeColumn(Column column){
            return  cs.removeColumn(column);
        }
        //查找栏目
    @RequestMapping("searchColumn.do")
    @ResponseBody
    public  ArrayList<Column> searchColumn( String type,String value){
        ArrayList<Column> rs=null;
        if(value!=null&&type!=null){
            //判断按什么字段查找
            switch (type){
                case "name":
                    value="%"+value+"%";
                rs=cs.findColumnByName(value);
                break;
                case "id":
                    value="%"+value+"%";
                    rs=cs.findColumnById(value);
                    break;
            }
        }
        return  rs;
    }
    }

