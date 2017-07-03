package com.shoppingkitten.dao;

import com.shoppingkitten.entity.*;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface DistributionDao {
        //根据省查询
        ArrayList<Send_area_province> findDistributionByProvince(String province);
//    //根据市查询
//    ArrayList<Send_area_city> findDistributionByCity(String city);


     //查询省地区名称
    ArrayList<Send_area_province> findAllArea();
    //查询省地区名称
    ArrayList<Send_area_city> findAllArea1();
    //查询省地区名称
    ArrayList<Send_area_county> findAllArea2();
    //查询数据库所有物流信息
    ArrayList <Send_distribution> findAllDistribution();
    //添加信息
    int addSend_distribution(Send_distribution send_distribution);
    //删除信息
    int deleteSend_distribution(ArrayList<Integer> ids);
    // 修改信息
    int updateSend_distribution(Send_distribution send_distribution);
    //分页
    ArrayList<Send_distribution> findAllSend_distribution(HashMap<String,Integer> map);
    //查询条数
    int findAllSend_distribution1();
}
