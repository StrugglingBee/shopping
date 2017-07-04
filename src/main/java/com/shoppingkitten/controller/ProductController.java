package com.shoppingkitten.controller;

import com.shoppingkitten.entity.Product;
import com.shoppingkitten.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Controller
public class ProductController {
    @Resource
    private ProductService ps;

    //点击分类根据tid分页查找商品
    @RequestMapping("findProductByType.do")
    @ResponseBody
    public ArrayList<Product> findProductByType(int tid, int page, int size) {
        ArrayList<Product> products = null;
        if (tid > 0 && page > 0 && size > 0) {
            int start = (page - 1) * size;
            int max = size;
            //封装成map
            HashMap<String, Integer> map = new HashMap<String, Integer>();
            map.put("tid", tid);
            map.put("start", start);
            map.put("max", size);
            //查询数据条数
            int total = ps.findProductCountByType(tid);
            //分页查询
            products = ps.findProductByTypeAndLimit(map);
            //把总条数给封装进对象
            products.get(0).setTotal(total);
        }
        return products;

    }


    //添加商品
    @RequestMapping("addabcdefg.do")
    @ResponseBody
    public int addProduct(@RequestParam("face_image") MultipartFile file, HttpServletRequest req,
                          String id, String tid, String name, String sale_price, String price, String stock, String descripe) {
        int result = 0;
        //判断商品基本信息是否为空
        if (id != "" && tid != "" && name != "" && sale_price != "" && price != "" && stock != "" && descripe != "") {
            //获取服务器的根目录
            String rootPath = req.getServletContext().getRealPath("/upload/product_image/");
            //获取日历
            Calendar cal = Calendar.getInstance();
            //获取月份
            int month = cal.get(Calendar.MONTH) + 1;
            //获取年份
            int year = cal.get(Calendar.YEAR);
            String ym ="" +year + month + "/";
            //文件路径
            String filePath = rootPath + ym;
            //创建文件
            File dir = new File(filePath);
            //判断该目录是否存在
            if (!dir.isDirectory()) {
                dir.mkdirs();
            }

            //定义封面图片名
            String face_image = null;
            if (file != null && file.getOriginalFilename() != null && file.getOriginalFilename().length() > 0) {
                //获取上传文件的名字
                String fileOriginalName = file.getOriginalFilename();
                //创建新的文件名称
                String newFileName = UUID.randomUUID() + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
                //文件存入目录
                face_image = ym + newFileName;
                File file2 = new File(filePath + newFileName);
                //文件写入磁盘
                try {
                    file.transferTo(file2);
                } catch (Exception e) {
                    //文件存储出错
                }
            }
            int nid = Integer.parseInt(id);
            //把数据封装入对象
            Product product = new Product();
            product.setId(nid);//id
            product.setTid(Integer.parseInt(tid));//类型ID
            product.setName(name);//商品名称
            product.setSale_price(Double.parseDouble(sale_price));//销售价格
            product.setPrice(Double.parseDouble(price));//进货价格
            product.setStock((int) Double.parseDouble(stock));//库存
            product.setDescripe(descripe);//商品描述

            //判断是添加还是修改
            if (nid == 0) {
                product.setFace_image(face_image);
                result = ps.addProduct(product);//添加商品
            } else {
                if (face_image != null) {
                    product.setFace_image(face_image);
                } else {
                    Product singleProduct = ps.findSingleProduct(nid);//根据ID查询商品信息
                    product.setFace_image(singleProduct.getFace_image());//设置封皮图片名称
                }
                result = ps.updateproduct(product);//修改商品
            }
        }
        return result;
    }

    //删除管理员
    @RequestMapping("removeproduct.do")
    @ResponseBody
    public int removeproducts(@RequestBody List<Integer> id) {
        int rs = 0;
        if (id != null) {
            //转化成ArrayList
            ArrayList<Integer> ids = (ArrayList<Integer>) id;
            rs = ps.deleteproducts(ids);
        }
        return rs;
    }

    //分页查找所有的商品
    @RequestMapping("productdata.do")
    @ResponseBody
    public ArrayList<Product> findAllManager(int page, int size) {
        ArrayList<Product> products = null;
        if (page > 0 && size > 0) {
            int start = (page - 1) * size;
            int max = size;
            //封装成map
            HashMap<String, Integer> map = new HashMap<String, Integer>();
            map.put("start", start);
            map.put("max", size);
            //查询数据条数
            int total = ps.findAllProduct();
            //分页查询
            products = ps.findProductByLimit(map);
            //把总条数给封装进对象
            products.get(0).setTotal(total);

        }
        return products;
    }

    //搜索方法
    @RequestMapping("searchProduct.do")
    @ResponseBody
    public List<Product> searchManager(String type, String value){
        List<Product> result=null;
        if (value!=null&&type!=null){
            System.out.println(type+"---"+value);
            //判断按什么字段查找
            switch (type){
                case "name"://按照名称搜索
                    value="%"+value+"%";
                    result=ps.findProductByName(value);
                    break;
            }
        }
        return result;
    }

}
