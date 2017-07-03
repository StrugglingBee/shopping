package com.shoppingkitten.service;

import com.shoppingkitten.dao.CourierDao;

import com.shoppingkitten.entity.Address_courier;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
@Service
public class CourierService {
    @Resource
    private CourierDao cd;
    //根据省查询
    public ArrayList<Address_courier> findCourierById(String id){
        return cd.findCourierById(id);
    };
    //添加物流信息
    public int addAddress_courier(Address_courier address_courier){return cd.addAddress_courier(address_courier);};
    //查询数据库所有信息
    public ArrayList<Address_courier> findAllCourice(){
        ArrayList<Address_courier> list= cd.findAllCourier();
//        for (Send_address s:list
//                ) {
//            System.out.println(s.toString()+222);
//        }
        return list;
    }
    //修改物流信息
    public int updateAddress_courier(Address_courier address_courier){return cd.updateAddress_courier(address_courier);};
    //删除物流信息
    public int deleteAddress_courier(ArrayList<Integer>ids){return cd.deleteAddress_courier(ids);};
    //分页
    public ArrayList<Address_courier> findAllAddress_courierByLimit(HashMap<String,Integer>map){
        return cd.findAllAddress_courier(map);
    };
    //查询有多少物流信息
    public int findAllAddress_courier1(){
        return cd.findAllAddress_courier1();
    };
}
