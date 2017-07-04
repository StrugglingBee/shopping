package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Resource2;
import com.shoppingkitten.service.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ResourceController {
    @Resource
    private ResourceService rs;//注入资源

    //根据权限ID查找根节点资源
    @RequestMapping("findResourceByRole.do")
    @ResponseBody
    public List<Resource2> findResourceByRole(int rid){
        ArrayList<Resource2> resources = rs.findResourceByRole(rid);
        return resources;
    }


    //根据父节点ID查找子节点资源
    @RequestMapping("findResourceByPid.do")
    @ResponseBody
    public ArrayList<Resource2> findResourceByPid(int parent_id){
        return rs.findResourceByPid(parent_id);
    }

    //根据角色ID查找拥有的资源
    @RequestMapping("findResourceByRoleID.do")
    @ResponseBody
    public List<Resource2> findResourceByRoleID(int rid){
        //定义结果集
        List<Resource2> result=null;
        if(rid>0){
            result=rs.findResourceByRoleID(rid);
        }
        return result;
    }

    //根据说有的资源
    @RequestMapping("resource.do")
    @ResponseBody
    public List<Resource2> findAllResource(){
          return rs.findAllResource();
    }

    //添加角色
    @RequestMapping("saveOrUpdateResource.do")
    @ResponseBody
    public int addResource(Resource2 resource){
        int result=0;
        if (resource!=null){
            int parent_id =resource.getParent_id();
            if (parent_id!=-1){
                int rank=resource.getRank();
                if(rank==0){
                    result=rs.addResource1(resource);//添加同级资源
                }else {
                    result=rs.addResource2(resource);//添加子级资源
                }
            }else {
                result=rs.updateResource(resource);//更新资源
            }
        }

        return result;
    };
    //删除管理员
    @RequestMapping("removeresource.do")
    @ResponseBody
    public int removeresources(@RequestBody List<Integer> resource_id){
        int result=0;
        if(resource_id!=null){
            //转化成ArrayList
            ArrayList<Integer> resource_ids= (ArrayList<Integer>) resource_id;
            result=rs.deleteResources(resource_ids);
        }
        return result;
    }



    //搜索方法
    @RequestMapping("searchResource.do")
    @ResponseBody
    public List<Resource2> searchManager(String type, String value){
        List<Resource2> result=null;
        if (value!=null&&type!=null){
            //判断按什么字段查找
            switch (type){
                case "text"://按照名称搜索
                    value="%"+value+"%";
                    result=rs.findResourceByText(value);
                    break;
                case "url"://按照名称搜索
                    value="%"+value+"%";
                    result=rs.findResourceByUrl(value);
                    break;
            }
        }
        return result;
    }

}
