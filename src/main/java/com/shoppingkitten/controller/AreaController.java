package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Address_area;
import com.shoppingkitten.service.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AreaController {
    @Resource
    private AreaService as;
    //查询数据库所有物流信息
    @RequestMapping("findAllAe.do")
    @ResponseBody
    public ArrayList<Address_area> findAllArea4(){
        ArrayList<Address_area> list = as.findAllArea4();
        for (Address_area s:list
             ) {
            System.out.println(s.toString());
        }
        return list;
    }
    //刷新
    @RequestMapping("findArea1.do")
    @ResponseBody
    public ArrayList<Address_area> findAllArea5(){
        return as.findAllArea5();
    }
    //删除
    @RequestMapping("deleteArea.do")
    @ResponseBody
    public int deletePtype(int id){
        return as.deleteArea(id);
    }
    //添加分类
    @RequestMapping("addarea.do")
    @ResponseBody
    public int addArea(Address_area aa){
        int result=0;
        if (aa!=null){
            int pid=aa.getPid();
            if (pid!=-1){
                int rank=aa.getBank();
                if (rank==0){
                    result=as.addArea(aa);
                }else{
                    result=as.addArea1(aa);
                }
            }else {
                result=as.editArea(aa);
            }
        }
        return result;
    }

    //搜索方法
    @RequestMapping("searchaddress_area.do")
    @ResponseBody
    public List<Address_area> searchManager(String type, String value){
        List<Address_area> result=null;
        if (value!=null&&type!=null){
            //判断按什么字段查找
            switch (type){
                case "name"://按照名称搜索
                    value="%"+value+"%";
                    result=as.findAddress_areaByName(value);
                    break;
            }
        }
        return result;
    }
}
