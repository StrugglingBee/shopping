package com.shoppingkitten.dao;

import com.shoppingkitten.entity.User;
import com.shoppingkitten.entity.User_type;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface User_TypeDao {
    //查询所有的会员类型
    ArrayList<User_type> findAllUserType();
    //保存会员的类型
    int saveUserType(User_type user_type);
    //更新会员的类型
    int updateUserType(User_type user_type);
    //删除会员的类型
    int removeUserType(ArrayList<Integer> list);
}
