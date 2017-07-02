package com.shoppingkitten.dao;


import com.shoppingkitten.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface ProductDao {
   //根据商品的类别tid查询该类别的所有商品数量
    int findProductCountByType(int tid);
   //根据商品类型分页查询
   ArrayList<Product> findProductByTypeAndLimit(HashMap<String, Integer> map);


   //添加商品
    int addProduct(Product product);
   //根据商品id查找商品信息
    Product findSingleProduct(int id);
    //根据商品id删除商品信息
    int deleteproduct(int id);

    //修改商品
    int updateproduct(Product product);

    //批量删除商品
    int deleteproducts(ArrayList<Integer> ids);

    //查询所有的商品有多少个
    int findAllProduct();
    //分页查询
    ArrayList<Product> findProductByLimit(HashMap<String, Integer> map);
    //根据名称搜索
    ArrayList<Product> findProductByName(String name);
}
