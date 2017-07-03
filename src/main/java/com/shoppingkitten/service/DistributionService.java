package com.shoppingkitten.service;

import com.shoppingkitten.dao.DistributionDao;
import com.shoppingkitten.entity.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class DistributionService {
    @Resource
    private DistributionDao dd;
    //根据省查询
    public ArrayList<Send_area_province> findDistributionByProvince(String province){
        return dd.findDistributionByProvince(province);
    };
//    //根据市查询
//    public ArrayList<Send_area_city> findDistributionByCity(String city){
//        return dd.findDistributionByCity(city);
//    };
    //查询数据库省地区信息
    public ArrayList<Send_area_province> findAllArea(){
        ArrayList<Send_area_province> list =dd.findAllArea();
//        System.out.println(list);
        return list;
    }
    //查询数据库市地区信息
    public ArrayList<Send_area_city> findAllArea1(){
        ArrayList<Send_area_city> list1 =dd.findAllArea1();
//        System.out.println(list1);
        return list1;
    }
    //查询数据库县地区信息
    public ArrayList<Send_area_county> findAllArea2(){
        ArrayList<Send_area_county> list2 =dd.findAllArea2();
//        System.out.println(list2);
        return list2;
    }
    //查询数据库所有信息
    public ArrayList<Send_distribution> findAllDistribution(){
        ArrayList<Send_distribution> list= dd.findAllDistribution();
//        for (Send_distribution s:list
//                ) {
//            System.out.println(s.toString()+222);
//        }
       return list;
    }
    //添加物流信息
    public int addSend_distribution(Send_distribution send_distribution){return dd.addSend_distribution(send_distribution);};
    //删除信息
    public int deleteSend_distribution(ArrayList<Integer>ids){return dd.deleteSend_distribution(ids);};
    //修改信息
    public int updateSend_distribution(Send_distribution send_distribution){return dd.updateSend_distribution(send_distribution);};
    //分页
    public ArrayList<Send_distribution> findAllSend_distributionByLimit(HashMap<String,Integer> map){
        return dd.findAllSend_distribution(map);
    }
    //查询条数
    public int findAllSend_distribution1(){
        return dd.findAllSend_distribution1();
    }

}
