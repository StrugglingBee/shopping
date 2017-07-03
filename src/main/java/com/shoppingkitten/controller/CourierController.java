package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Address_courier;
import com.shoppingkitten.service.CourierService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
@Controller
public class CourierController {
    @Resource
    private CourierService cs;
    //添加物流信息
    @RequestMapping("saveOrUpdateCourier.do")
    @ResponseBody
    public int addAddress_courier(Address_courier address_courier){
        int rs=0;
        int id=address_courier.getId();
        if (id==0){
//        System.out.println(pid);
            rs=cs.addAddress_courier(address_courier);
        }else{
            rs=cs.updateAddress_courier(address_courier);
        }
        return rs;
    }
    //查询数据库所有物流信息
    @RequestMapping("findAllCourier.do")
    @ResponseBody
    public ArrayList<Address_courier> findAllCourier(){
        ArrayList<Address_courier> list = cs.findAllCourice();
//        for (Send_address s:list
//             ) {
//            System.out.println(s.toString());
//        }
        return list;
    }
    //修改物流信息

    //删除物流信息
    @RequestMapping("removeAddress_courier.do")
    @ResponseBody
    public int deleteAddress_courier(@RequestBody List<Integer> ids){
//        for (Integer i:ids
//             ) {
//            System.out.println(i);
//        }
        int rs=0;
        if(ids!=null){
            ArrayList<Integer>mids=(ArrayList<Integer>)ids;
            rs=cs.deleteAddress_courier(mids);
        }
        return rs;
    }

    //分页
    @RequestMapping("courier.do")
    @ResponseBody
    public ArrayList<Address_courier> findAllAddress_courier(int page,int size){
        ArrayList<Address_courier>address_couriers=null;
        if (page>0&&size>0){
            int start=(page-1)*size;
            int max=size;
            //封装成map
            HashMap<String,Integer> map=new HashMap<>();
            map.put("start",start);
            map.put("max",size);
            //查询数据条数
            int total=cs.findAllAddress_courier1();
            //分页查询
            address_couriers=cs.findAllAddress_courierByLimit(map);
            //把总数给封装进对象
           address_couriers.get(0).setTotal(total);

        }
        return address_couriers;
    }
    //按照省搜索
    @RequestMapping("searchCourier.do")
    @ResponseBody
    public ArrayList<Address_courier> searchcourier(String type, String value){
        ArrayList<Address_courier> rs=null;
        if (value!=null&&type!=null){
            switch (type){
                case "id"://按照省份搜索
                    value="%"+value+"%";
                    rs=cs.findCourierById(value);
                    break;
            }
        }
        return rs;
    }
}
