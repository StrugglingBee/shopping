package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Manager;
import com.shoppingkitten.entity.Role;
import com.shoppingkitten.service.ManagerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class ManagerController {
    @Resource
    private ManagerService ms;

    //管理员登录验证
    @RequestMapping("mangerlogin.do")
    @ResponseBody
    public String managerLogin(Manager m, HttpServletRequest req){
        HttpSession session = req.getSession();
        String rs="error";
        if(m!=null&&m.getAccount()!=""&&m.getPwd()!=""){
            //获取安全验证主体
            Subject subject = SecurityUtils.getSubject();
            //获取令牌
            UsernamePasswordToken token=new UsernamePasswordToken(m.getAccount(),m.getPwd());
            try {
                //登录验证
                subject.login(token);
                //获取管理员拥有的所有的角色

                ArrayList<Role> roles = ms.findRolesByManager(m);
                //把角色数组存入session中
                session.setAttribute("roles",roles);
                rs="success";
            } catch (AuthenticationException e) {
                rs="error";
            }
        }
        return rs;
    }
    //退出登录
    @RequestMapping("exitAdmin.do")
    public String exitAdmin(HttpSession session){
        //销毁session
        session.invalidate();
        //跳转到主页
        return "index";
    }
    //分页查询管理员
    @RequestMapping("manager.do")
    @ResponseBody
//    @RequiresRoles("超级管理员")//角色权限
    @RequiresPermissions({"manager:manager:select"})
    public ArrayList<Manager> findAllManager(int page,int size){
        ArrayList<Manager> managers=null;
        if (page>0&&size>0){
                int start=(page-1)*size;
                int max=size;
                //封装成map
                HashMap<String, Integer> map = new HashMap<String, Integer>();
                map.put("start",start);
                map.put("max",size);
            //查询数据条数
            int total = ms.findAllManager();
            //分页查询
            managers=ms.findManagerByLimit(map);
            //把总条数给封装进对象
            managers.get(0).setTotal(total);

        }
        return managers;
    };

    //添加管理员
    @RequestMapping("saveOrUpdateManager.do")
    @ResponseBody
//    @RequiresPermissions({"manager:manager:add"})
    public int addManager(Manager manager){
        int rs=0;
        int mid = manager.getMid();
        if (mid==0){
            rs= ms.addManager(manager);
        }else {
            rs=ms.updateManager(manager);
        }
        return rs;
    };

    //删除管理员
    @RequestMapping("removemanager.do")
    @ResponseBody
//    @RequiresPermissions({"manager:manager:remove"})
    public int removeManagers(@RequestBody List<Integer> mid){
        int rs=0;
        if(mid!=null){
            //转化成ArrayList
            ArrayList<Integer> mids= (ArrayList<Integer>) mid;
            rs=ms.deleteManagers(mids);
        }
        return rs;
    }

    //分配角色
    @RequestMapping("insertRoleByManagerID.do")
    @ResponseBody
//    @RequiresPermissions({"manager:manager:role"})
    public int insertRoleByManagerID(@RequestBody ArrayList<HashMap<String, Integer>> maps){
        int rs=0;
        int rid=maps.get(0).get("rid");
        if(rid>0){
            rs=ms.insertRoleByManagerID(maps);
        }else {
            rs=ms.delectRoleByManagerID(maps.get(0).get("mid"));
        }
        return rs;
    }

    //搜索方法
    @RequestMapping("searchManager.do")
    @ResponseBody
//    @RequiresPermissions({"manager:manager:search"})
    public ArrayList<Manager> searchManager(String type,String value){
        ArrayList<Manager> rs=null;
        if (value!=null&&type!=null){
            //判断按什么字段查找
            switch (type){
                case "account"://按照账号搜索
                    value="%"+value+"%";
                    rs=ms.findManagerByAccount(value);
                    break;
                case "nick_name"://按照昵称搜索
                    value="%"+value+"%";
                    rs=ms.findManagerByNick_name(value);
                    break;
                case "phone"://按照电话搜索
                    value="%"+value+"%";
                    rs=ms.findManagerByPhone(value);
                    break;
                case "id_code"://按照身份证号搜索
                    value="%"+value+"%";
                    rs=ms.findManagerById_code(value);
                    break;
            }
        }
        return rs;
    };
}
