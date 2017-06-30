package com.shoppingkitten.dao;

import com.shoppingkitten.entity.Privilege;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface PrivilegeDao {

    //查找所有的权限数据
    ArrayList<Privilege> findAllPrivilege();
    //根据角色ID查找拥有的权限
    ArrayList<Privilege> findPrivilegeByRoleID(int rid);

    //查询所有的权限有多少个
    int findPrivilegeCount();
    //分页查询
    ArrayList<Privilege> findPrivilegeByLimit(HashMap<String, Integer> map);
    //添加权限
    int addPrivilege(Privilege privilege);
    //更新权限
    int updatePrivilege(Privilege privilege);

    //批量删除权限
    int deletePrivileges(ArrayList<Integer> pids);

    //根据名称搜索
    ArrayList<Privilege> findPrivilegeByp_name(String p_name);

    //根据备注搜索
    ArrayList<Privilege> findPrivilegeByp_remark(String p_remark);



}
