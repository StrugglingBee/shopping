package com.shoppingkitten.service;

import com.shoppingkitten.dao.ProductDao;
import com.shoppingkitten.entity.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class ProductService {
    @Resource
    private ProductDao pd;

    //添加商品
    public int addProduct(Product product){
        return pd.addProduct(product);
    }

    //根据商品id查找商品信息
    public Product findSingleProduct(int id){
        return pd.findSingleProduct(id);
    }

    //根据商品id删除商品信息
    public int deleteproduct(int id){
        return pd.deleteproduct(id);
    }

    //修改商品
    public int updateproduct(Product product){
        return pd.updateproduct(product);
    };

    //批量删除商品
    public int deleteproducts(ArrayList<Integer> ids){
        return pd.deleteproducts(ids);
    };

    //查询所有的商品有多少个
    public int findAllProduct(){
        return pd.findAllProduct();
    };
    //分页查询
    public ArrayList<Product> findProductByLimit(HashMap<String, Integer> map){
        return pd.findProductByLimit(map);
    };

    //根据商品的类别tid查询该类别的所有商品
    public int findProductCountByType(int tid){
        return pd.findProductCountByType(tid);
    };
    //根据商品类型分页查询
   public ArrayList<Product> findProductByTypeAndLimit(HashMap<String, Integer> map){
       return pd.findProductByTypeAndLimit(map);
   };

    //根据名称搜索
    public ArrayList<Product> findProductByName(String name){
        return pd.findProductByName(name);
    };
}
