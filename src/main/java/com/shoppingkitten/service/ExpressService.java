package com.shoppingkitten.service;

import com.shoppingkitten.dao.ExpressDao;
import com.shoppingkitten.entity.Send_address;
import com.shoppingkitten.entity.Send_area_province;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class ExpressService {
    @Resource
    private ExpressDao ed;
    //根据省查询
    public ArrayList<Send_address> findExpressById(String id){
        return ed.findExpressById(id);
    };
    //添加物流信息
    public int addSend_address(Send_address send_address){return ed.addSend_address(send_address);};
    //查询数据库所有信息
    public ArrayList<Send_address> findAllExpress(){
       ArrayList<Send_address> list= ed.findAllExpress();
//        for (Send_address s:list
//                ) {
//            System.out.println(s.toString()+222);
//        }
       return list;
    }
    //修改物流信息
   public int updateSend_address(Send_address send_address){return ed.updateSend_address(send_address);};
   //删除物流信息
    public int deleteSend_address(ArrayList<Integer>ids){return ed.deleteSend_address(ids);};
    //分页
    public ArrayList<Send_address> findAllSend_addressByLimit(HashMap<String,Integer>map){
        return ed.findAllSend_address(map);
    };
    //查询有多少物流信息
    public int findAllSend_express(){
        return ed.findAllSend_express();
    };
}
