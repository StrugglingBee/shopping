package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Send_area_city;
import com.shoppingkitten.entity.Send_area_county;
import com.shoppingkitten.entity.Send_area_province;
import com.shoppingkitten.entity.Send_distribution;
import com.shoppingkitten.service.DistributionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class DistributionController {
    @Resource
    private DistributionService ds;
    //查询数据库地区信息
    @RequestMapping("findAllArea.do")
    @ResponseBody
    public ArrayList<Send_area_province> findAllArea(){
        ArrayList<Send_area_province> list =ds.findAllArea();
        System.out.println(list);
        return list;
    }
    //查询数据库地区信息
    @RequestMapping("findAllArea1.do")
    @ResponseBody
    public ArrayList<Send_area_city> findAllArea1(){
        ArrayList<Send_area_city> list1 =ds.findAllArea1();
        System.out.println(list1);
        return list1;
    }
    //查询数据库地区信息
    @RequestMapping("findAllArea2.do")
    @ResponseBody
    public ArrayList<Send_area_county> findAllArea2(){
        ArrayList<Send_area_county> list2 =ds.findAllArea2();
        System.out.println(list2);
        return list2;
    }
    //查询数据库所有物流信息
    @RequestMapping("findAllDistribution.do")
    @ResponseBody
    public ArrayList<Send_distribution> findAllDistribution(){
        ArrayList<Send_distribution> list = ds.findAllDistribution();
//        for (Send_distribution s:list
//             ) {
//            System.out.println(s.toString());
//        }
        return list;
    }
    //添加物流信息
    @RequestMapping("saveOrUpdateDistribution.do")
    @ResponseBody
    public int addSend_distribution(Send_distribution send_distribution){
        System.out.println(send_distribution.toString());

        int rs=0;
        int id=send_distribution.getId();
        if (id==0){
            rs=ds.addSend_distribution(send_distribution);
        }else{
            rs=ds.updateSend_distribution(send_distribution);
        }
        return rs;
    }
    //删除信息
    @RequestMapping("removeSend_distribution.do")
    @ResponseBody
    public int deleteSend_distribution(@RequestBody List<Integer>ids){
        int rs=0;
        if(ids!=null){
            ArrayList<Integer>mids=(ArrayList<Integer>)ids;
            rs=ds.deleteSend_distribution(mids);
        }
        return rs;
    }
    //分页
    @RequestMapping("distribution.do")
    @ResponseBody
    public ArrayList<Send_distribution> findAllSend_distribution(int page,int size){
        ArrayList<Send_distribution> send_distributions=null;
        if (page>0&&size>0){
            int start=(page-1)*size;
            int max=size;
            //封装成map
            HashMap<String,Integer> map=new HashMap<>();
            map.put("start",start);
            map.put("max",size);
            //查询数据条数
            int total=ds.findAllSend_distribution1();
            //分页查询
            send_distributions=ds.findAllSend_distributionByLimit(map);
            //把总数给封装进对象
            send_distributions.get(0).setTotal(total);

        }
        return send_distributions;
    }
    //按照省搜索
    @RequestMapping("searchDistribution.do")
    @ResponseBody
    public ArrayList<Send_area_province> searchdistribution(String type,String value){
        ArrayList<Send_area_province> rs=null;
        if (value!=null&&type!=null){
            switch (type){
                case "province"://按照省份搜索
                    value="%"+value+"%";
                    rs=ds.findDistributionByProvince(value);
                    break;

            }
        }
        return rs;
    }

}
