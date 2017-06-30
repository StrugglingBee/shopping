package com.shoppingkitten.service;


import com.shoppingkitten.dao.PrivilegeDao;
import com.shoppingkitten.entity.Privilege;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class PrivilegeService {
    @Resource
    private PrivilegeDao pd;//注入资源

    //查找所有的权限数据
    public ArrayList<Privilege> findAllPrivilege(){
        return pd.findAllPrivilege();
    };

    //根据角色ID查找拥有的权限
    public ArrayList<Privilege> findPrivilegeByRoleID(int rid){
        return  pd.findPrivilegeByRoleID(rid);
    };

    //查询所有的权限有多少个
    public int findPrivilegeCount(){
        return pd.findPrivilegeCount();
    };
    //分页查询
    public ArrayList<Privilege> findPrivilegeByLimit(HashMap<String,Integer> map){
        return pd.findPrivilegeByLimit(map);
    };

    //添加权限
    public int addPrivilege(Privilege privilege){
        return  pd.addPrivilege(privilege);
    };

    //更新权限
    public int updatePrivilege(Privilege privilege){
        return pd.updatePrivilege(privilege);
    };

    //批量删除权限
    public int deletePrivileges(ArrayList<Integer> pids){
        return pd.deletePrivileges(pids);
    };

    //根据名称搜索
    public ArrayList<Privilege> findPrivilegeByp_name(String p_name){
        return pd.findPrivilegeByp_name(p_name);
    };

    //根据备注搜索
    public ArrayList<Privilege> findPrivilegeByp_remark(String p_remark){
        return pd.findPrivilegeByp_remark(p_remark);
    };
}
