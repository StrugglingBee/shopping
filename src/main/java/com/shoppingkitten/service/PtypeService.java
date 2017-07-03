package com.shoppingkitten.service;

import com.shoppingkitten.dao.PtypeDao;
import com.shoppingkitten.entity.Product_type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class PtypeService {
   @Resource
    private PtypeDao pd;//注入资源
    //查找所有的商品分类,组装父子关系
    public ArrayList<Product_type> findTypes(){
        ArrayList<Product_type> ts=pd.findTypes();
        ArrayList<Product_type> data=new ArrayList<Product_type>();
        for (Product_type a: ts){
            if (a.getPid()==0){
                data.add(a);
            }
            for (Product_type b: ts){
                if (a.getId()==b.getPid()){
                    a.getChildren().add(b);
                }
            }
        }
        return  data;
    }
    //删除分类
    public int deletePtype(int id){
        return  pd.deletePtype(id);
    }

    //批量删除
    public int deletePtypes(ArrayList<Integer> ids){
        return pd.deletePtypes(ids);
    };
    //添加同级分类
    public int addType1(Product_type pt){
        return  pd.addType1(pt);
    }
    //添加子分类
    public int addType2(Product_type pt){
        return  pd.addType2(pt);
    }
    //修改
    public int editType(Product_type pt){
        return  pd.editType(pt);
    }
    //找所有的商品分类
    public ArrayList<Product_type> findTypes2(){
         return pd.findTypes2();
    }

    //根据名称搜索
    public ArrayList<Product_type> findProduct_typeByText(String text){
        return pd.findProduct_typeByText(text);
    };
}
