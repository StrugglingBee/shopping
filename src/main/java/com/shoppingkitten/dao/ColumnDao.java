package com.shoppingkitten.dao;

import com.shoppingkitten.entity.Column;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public interface ColumnDao {
    //分页查询
//    ArrayList <Column> findColumnByPage(HashMap<String,Integer> map);
    //查询数据条数
//    int findColumnCounts();
    //查找所有栏目
        ArrayList<Column> findColumn();
      //保存栏目
    int saveColumn(Column column);
    //更新栏目
    int updateColumn(Column column);
    //删除栏目
    int removeColumn(Column column);
    //根据名称查找栏目
    ArrayList<Column> findColumnByName(String name);
    //根据id查找栏目
    ArrayList<Column> findColumnById(String id);
}
