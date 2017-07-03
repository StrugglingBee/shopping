package com.shoppingkitten.dao;

import com.shoppingkitten.entity.Send_address;
import com.shoppingkitten.entity.Send_area_province;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface ExpressDao {
    //根据ID查询
    ArrayList<Send_address> findExpressById(String id);
    //添加物流信息
    int addSend_address(Send_address send_address);
    //查询数据库所有物流信息
    ArrayList<Send_address> findAllExpress();
    //修改物流信息
    int updateSend_address(Send_address send_address);
    //删除物流信息
    int deleteSend_address(ArrayList<Integer> ids);
    //分页查询
    ArrayList<Send_address> findAllSend_address(HashMap<String, Integer> map);
    //查询有多少个物流信息地址
    int findAllSend_express();
}
