package com.shoppingkitten.dao;


import com.shoppingkitten.entity.Product_type;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface PtypeDao {
    //查找所有的商品分类
    ArrayList<Product_type> findTypes();
   //根据id删除分类
    int deletePtype(int id);
    //批量删除
    int deletePtypes(ArrayList<Integer> ids);
    //添加同级分类
    int addType1(Product_type pt);
   //添加子分类
    int addType2(Product_type pt);
    //修改分类
    int editType(Product_type pt);
    //查找所有的商品分类2
    ArrayList<Product_type> findTypes2();

    //根据名称搜索
    ArrayList<Product_type> findProduct_typeByText(String text);
}
