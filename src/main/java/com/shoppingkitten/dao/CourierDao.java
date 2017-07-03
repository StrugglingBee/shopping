package com.shoppingkitten.dao;

import com.shoppingkitten.entity.Address_courier;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
@Repository
public interface CourierDao {
    //根据ID查询
    ArrayList<Address_courier> findCourierById(String id);
    //添加物流信息
    int addAddress_courier(Address_courier address_courier);
    //查询数据库所有物流信息
    ArrayList<Address_courier> findAllCourier();
    //修改物流信息
    int updateAddress_courier(Address_courier address_courier);
    //删除物流信息
    int deleteAddress_courier(ArrayList<Integer> ids);
    //分页查询
    ArrayList<Address_courier> findAllAddress_courier(HashMap<String,Integer>map);
    //查询有多少个物流信息地址
    int findAllAddress_courier1();
}
