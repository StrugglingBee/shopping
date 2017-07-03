package com.shoppingkitten.dao;

import com.shoppingkitten.entity.Address_area;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
@Repository
public interface AreaDao {
    //查询数据库所有物流信息
    ArrayList<Address_area> findAllArea4();
    //查询数据库所有物流信息
    ArrayList<Address_area> findAllArea5();
    //根据id删除分类
    int deleteArea(int id);
    //添加同级分类
    int addArea(Address_area aa);
    //添加子级分类
    int addArea1(Address_area aa);
    //修改分类
    int editArea(Address_area aa);
    //根据名称搜索
    ArrayList<Address_area> findAddress_areaByName(String name);
}
