package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Privilege;
import com.shoppingkitten.service.PrivilegeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class PrivilegeController {
    @Resource
    private PrivilegeService ps;//注入资源


    //查找所有的权限数据
    @RequestMapping("findAllPrivilege.do")
    @ResponseBody
    public ArrayList<Privilege> findAllPrivilege(){
        return ps.findAllPrivilege();
    };

    //根据角色ID查找拥有的权限
    @RequestMapping("findPrivilegeByRoleID.do")
    @ResponseBody
    public ArrayList<Privilege> findPrivilegeByRoleID(int rid){
        ArrayList<Privilege> result=null;
        if (rid>0){
            result=ps.findPrivilegeByRoleID(rid);
        }
        return result;
    };

    //分页查询管理员
    @RequestMapping("privilege.do")
    @ResponseBody
    public ArrayList<Privilege> findAllManager(int page, int size){
        ArrayList<Privilege> privileges=null;
        if (page>0&&size>0){
            int start=(page-1)*size;
            int max=size;
            //封装成map
            HashMap<String, Integer> map = new HashMap<String, Integer>();
            map.put("start",start);
            map.put("max",size);
            //查询数据条数
            int total = ps.findPrivilegeCount();
            //分页查询
            privileges= ps.findPrivilegeByLimit(map);
            //把总条数给封装进对象
            privileges.get(0).setTotal(total);

        }
        return privileges;
    };

    //添加权限
    @RequestMapping("saveOrUpdatePrivilege.do")
    @ResponseBody
    public int addPrivilege(Privilege privilege){
        int result=0;
        if (privilege!=null){
            int pid =privilege.getPid();
            if (pid==0){
                result= ps.addPrivilege(privilege);
            }else {
                result=ps.updatePrivilege(privilege);
            }
        }
        return result;
    };

    //删除权限
    @RequestMapping("removeprivilege.do")
    @ResponseBody
    public int removePrivileges(@RequestBody List<Integer> pid){
        int result=0;
        if(pid!=null){
            //转化成ArrayList
            ArrayList<Integer> pids= (ArrayList<Integer>) pid;
            result=ps.deletePrivileges(pids);
        }
        return result;
    }

    //搜索方法
    @RequestMapping("searchPrivilege.do")
    @ResponseBody
    public ArrayList<Privilege> searchManager(String type, String value){
        ArrayList<Privilege> result=null;
        if (value!=""&&type!=""){
            //判断按什么字段查找
            switch (type){
                case "p_name"://按照名称搜索
                    value="%"+value+"%";
                    result=ps.findPrivilegeByp_name(value);
                    break;
                case "p_remark"://按照备注搜索
                    value="%"+value+"%";
                    result=ps.findPrivilegeByp_remark(value);
                    break;
            }
        }
        return result;

    }
}
