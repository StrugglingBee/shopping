package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Send_address;
import com.shoppingkitten.entity.Send_area_province;
import com.shoppingkitten.service.ExpressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class ExpressController {
    @Resource
    private ExpressService es;
    //添加物流信息
    @RequestMapping("saveOrUpdateExpress.do")
    @ResponseBody
    public int addSend_address(Send_address send_address){
        int rs=0;
        int id=send_address.getId();
        if (id==0){
//        System.out.println(pid);
            rs=es.addSend_address(send_address);
        }else{
            rs=es.updateSend_address(send_address);
        }
        return rs;
    }
    //查询数据库所有物流信息
    @RequestMapping("findAllExpress.do")
    @ResponseBody
    public ArrayList<Send_address> findAllExpress(){
        ArrayList<Send_address> list = es.findAllExpress();
//        for (Send_address s:list
//             ) {
//            System.out.println(s.toString());
//        }
        return list;
    }
    //修改物流信息

    //删除物流信息
    @RequestMapping("removeSend_express.do")
    @ResponseBody
    public int deleteSend_address(@RequestBody List<Integer>ids){
//        for (Integer i:ids
//             ) {
//            System.out.println(i);
//        }
        int rs=0;
        if(ids!=null){
            ArrayList<Integer>mids=(ArrayList<Integer>)ids;
            rs=es.deleteSend_address(mids);
        }
        return rs;
    }

    //分页
    @RequestMapping("express.do")
    @ResponseBody
    public ArrayList<Send_address> findAllSend_address(int page,int size){
        ArrayList<Send_address>send_addresses=null;
        if (page>0&&size>0){
            int start=(page-1)*size;
            int max=size;
            //封装成map
            HashMap<String,Integer>map=new HashMap<>();
            map.put("start",start);
            map.put("max",size);
            //查询数据条数
             int total=es.findAllSend_express();
            //分页查询
            send_addresses=es.findAllSend_addressByLimit(map);
            //把总数给封装进对象
            send_addresses.get(0).setTotal(total);

        }
       return send_addresses;
    }
    //按照省搜索
    @RequestMapping("searchExpress.do")
    @ResponseBody
    public ArrayList<Send_address> searchexpress(String type, String value){
        ArrayList<Send_address> rs=null;
        if (value!=null&&type!=null){
            switch (type){
                case "id"://按照省份搜索
                    value="%"+value+"%";
                    rs=es.findExpressById(value);
                    break;
            }
        }
        return rs;
    }
}
