package com.shoppingkitten.service;

import com.shoppingkitten.dao.AreaDao;
import com.shoppingkitten.entity.Address_area;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
@Service
public class AreaService {
    @Resource
    private AreaDao ad;
    //查找所有的商品分类,组装父子关系
    public ArrayList<Address_area> findAllArea4(){
        ArrayList<Address_area> ts=ad.findAllArea4();
        ArrayList<Address_area> data=new ArrayList<Address_area>();
        for (Address_area a:ts){
            if (a.getPid()==0){
                data.add(a);
            }
            for (Address_area b: ts){
                if (a.getId()==b.getPid()){
                    a.getChildren().add(b);
                }
            }
        }
        return  data;
    }
    //找所有的商品分类
    public ArrayList<Address_area> findAllArea5(){
        return ad.findAllArea5();
    }
    //删除分类
    public int deleteArea(int id){
        return  ad.deleteArea(id);
    }

    //添加同级分类
    public int addArea(Address_area aa){
        return ad.addArea(aa);
    }
    //添加子分类
    public int addArea1(Address_area aa){
        return ad.addArea1(aa);
    }
    //修改
    public int editArea(Address_area aa){
        return  ad.editArea(aa);
    }
    //根据名称搜索
    public ArrayList<Address_area> findAddress_areaByName(String name){
        return ad.findAddress_areaByName(name);
    };
}
