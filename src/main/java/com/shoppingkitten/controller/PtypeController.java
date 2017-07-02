package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Product_type;
import com.shoppingkitten.service.PtypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PtypeController {
    @Resource
    private PtypeService psc;//注入资源

    //查找所有分类
    @RequestMapping("findTypes.do")
    @ResponseBody
    public ArrayList<Product_type> findTypes(){
        return psc.findTypes();
    }

    //批量删除
    @RequestMapping("deletePtype.do")
    @ResponseBody
    public int deletePtype(@RequestBody List<Integer> id){
        int result=0;
        if(id!=null){
            //转化成ArrayList
            ArrayList<Integer> ids= (ArrayList<Integer>) id;
            result=psc.deletePtypes(ids);
        }
        return result;
    }
    //添加分类
    @RequestMapping("addType.do")
    @ResponseBody
    public int addType(Product_type pt){
        int result=0;
        if(pt!=null){
            int pid = pt.getPid();
            if (pid!=-1){//判断是添加、修改
                int rank = pt.getRank();
                if (rank==0){
                    result=psc.addType1(pt);//添加同级
                }else if(rank==1){
                    result=psc.addType2(pt);//添加子级
                }
            }else {
                result=psc.editType(pt);
            }

        }
        return result;
    }
    //查找所有分类木有组建父子关系
    @RequestMapping("findTypes2.do")
    @ResponseBody
    public ArrayList<Product_type> findTypes2(){
        return psc.findTypes2();
    }

    //搜索方法
    @RequestMapping("searchproduct_type.do")
    @ResponseBody
    public List<Product_type> searchManager(String type, String value){
        List<Product_type> result=null;
        if (value!=null&&type!=null){
            //判断按什么字段查找
            switch (type){
                case "text"://按照名称搜索
                    value="%"+value+"%";
                    result=psc.findProduct_typeByText(value);
                    break;
            }
        }
        return result;
    }
}
