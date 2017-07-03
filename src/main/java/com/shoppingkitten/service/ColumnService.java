package com.shoppingkitten.service;

import com.shoppingkitten.dao.ColumnDao;
import com.shoppingkitten.entity.Column;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ColumnService {
    @Resource
    private ColumnDao cd;//注入资源
    //分页查询
//    public ArrayList<Column> findColumnByPage(HashMap<String,Integer> map){
//        return  cd.findColumnByPage(map);
//    }
    //查询所有数据条数
//    public int findColumnCounts(){
//        return cd.findColumnCounts();
//    }
    //查询所有栏目
    public ArrayList<Column> findColumn(){
        return cd.findColumn();
    }
    //保存栏目
    public  int saveColumn(Column column){
        return  cd.saveColumn(column);
    }
    //更新栏目
    public int updateColumn(Column column){
        return  cd.updateColumn(column);
    }
    //删除栏目
    public int removeColumn(Column column){
       return cd.removeColumn(column);

    }
    //根据名称查找栏目
  public  ArrayList<Column> findColumnByName(String name){
        return  cd.findColumnByName(name);
    }
    //根据id查找栏目
    public  ArrayList<Column> findColumnById(String id){
        return  cd.findColumnById(id);
    }
}
