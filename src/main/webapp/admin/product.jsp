<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div  class="easyui-layout" data-options="fit:true">
    <%--左侧类型栏--%>
    <div id="main_product_left" style="width: 15%;" data-options="region:'west',collapsed:false,title:'类型栏'">
        <div>
            <ul id="main_product_type_alltypes" class="easyui-tree" data-options="url:'/findTypes.do'">
            </ul>
        </div>
    </div>

    <div data-options="region:'center'" style="width:85%;">
        <div class="easyui-layout" data-options="fit:true">
            <%--搜索栏--%>
            <div id="main_product_searchbox" style="height: 80px;padding: 10px;" data-options="region:'north',collapsed:false,title:'检索栏'">
                <input id="main_product_search" style="width:300px;" class="easyui-searchbox" data-options="searcher:searchproduct,prompt:'请输入关键词',menu:'#main_product_choice'"></input>
                <div id="main_product_choice" style="width:120px;">
                    <div data-options="name:'name',iconCls:'icon-ok'">名称</div>
                </div>
            </div>
            <%--数据栏--%>
            <div data-options="region:'center'" >
                <div id="main_product_data" data-options="title:'数据栏'"></div>
            </div>
        </div>
    </div>

</div>

<%--添加商品的弹窗--%>
<div id="main_product_alert" class="easyui-window" data-options="closed:true,modal:true,title:'编辑商品'" style="width: 800px;height:650px;">
    <form class="form-group" id="main_product_form">
        <div style="width: 300px;display: inline-block;vertical-align: top">
            <div class="input-group" style="margin: 10px;">
                <span class="input-group-addon">类别</span>
                <select id="main_product_tid" class="form-control" name="tid">

                </select>
            </div>
            <div class="input-group" style="margin: 10px;">
                <span class="input-group-addon">名称</span>
                <input id="main_product_name" type="text" class="form-control" name="name">
            </div>
            <div class="input-group" style="margin: 10px;">
                <span class="input-group-addon">售价</span>
                <input id="main_product_sale_price" type="number" class="form-control" name="sale_price">
            </div>
        </div>
        <div style="width: 300px;display: inline-block;vertical-align: top">
            <div class="input-group" style="margin: 10px;">
                <span class="input-group-addon">进价</span>
                <input id="main_product_price" type="number" class="form-control" name="price">
            </div>

            <div class="input-group" style="margin: 10px;">
                <span class="input-group-addon">库存</span>
                <input id="main_product_stock" type="number" class="form-control" name="stock">
            </div>
            <div class="input-group" style="margin: 10px;">
                <span class="input-group-addon">图片</span>
                <input type="file" name="face_image" onchange="file_pre(this)"/>
            </div>
        </div>
        <div style="width: 150px;display: inline-block;vertical-align: top">
            <span id="main_product_face"></span>
        </div>
        <div class="input-group" style="margin: 10px;">
            <span class="input-group-addon">描述</span>
            <textarea rows="2" cols="2" id="product_descripe" name="product_descripe" ></textarea>
        </div>
        <input id="main_product_id" type="hidden" class="form-control" name="id">
    </form>

    <div style="display:flex;justify-content:center;margin-top: 10px;">
        <a class="easyui-linkbutton" href="javascript:productaddsave()" style="display: inline-block; width: 200px;height: 35px;">保 存</a>
    </div>
</div>

<script type="text/javascript">
    function productinit() {
        //表格
        $("#main_product_data").datagrid({
            //请求数据，加载数据
            //url:"/manager.do",
            //表格的列
            pagination: true,//显示分页属性
            columns: [[
                {field:"id",title:"",width:100,checkbox:true},
                {field:"face_image",title:"图片",width:100,align:'left',formatter:imgFormatter},
                {field:"name",title:"名称",width:100},
//                {field:"descripe",title:"描述",width:100},
                {field:"sale_price",title:"售价",width:100},
                {field:"price",title:"进价",width:100},
                {field:"stock",title:"库存",width:100},
                {field:"sale_total",title:"已售",width:100},
                {field:"create_time",title:"上架时间",width:150}
            ]],
            //工具栏
            toolbar: [
                {
                    text: "添加", iconCls: "icon-add", handler: function () {
                    addproduct();
                }
                },
                {
                    text: "修改", iconCls: "icon-edit", handler: function () {
                    editproduct();
                }
                },
                {
                    text: "删除", iconCls: "icon-remove", handler: function () {
                    removeproduct();
                }
                }

            ]

        });
        product_typeinit();//商品类型树初始化
        loadproductdata(1, 5);
        main_product_alert_typeinit();//弹窗商品类型下拉框初始化
        //加载富文本编辑器
        CKEDITOR.replace('product_descripe');
    }
    //加载商品类型数据
    function product_typeinit() {
        $("#main_product_type_alltypes").tree({
            onClick: function (node) {
                var tid = node.id;
                loadProductByType(tid,1, 5);//加载信息
            }
        });
    }

    function loadProductByType(t,p,z) {
        //异步获取对象
        $.getJSON("/findProductByType.do", {tid:t,page: p, size: z}, function (data) {
            //把数据加载到表格中
            $("#main_product_data").datagrid("loadData", data);
            //获取分页器
            var pager = $("#main_product_data").datagrid("getPager");
            pager.pagination({
                total: data[0].total,//一共显示多少条数据
                pageNumber: p,//设置当前页码
                pageSize: z,//设置显示信息条数
                pageList: [5, 10, 15],//设置页面尺寸，显示多少条信息
                //获取分页控制器事件page：当前页码，size:显示数据数量
                onSelectPage: function (page, size) {
                    loadProductByType(t,page, size);//加载信息
                }
            });
        });
    }
    //添加商品弹窗初始化
    function main_product_alertinit() {
        $("#main_product_id").val("");
        $("#main_product_name").val("");
        $("#main_product_sale_price").val("");
        $("#main_product_price").val("");
        $("#main_product_stock").val("");
        $("#main_product_face").html("");
        CKEDITOR.instances.product_descripe.setData("");
    }
    //弹窗类型初始化
    function main_product_alert_typeinit() {
        $.getJSON("/findTypes2.do",function (d) {
            var option;
            for(var i in d){
                var a="<option  name='tid' value="+d[i].id+">"+d[i].text+"</option>"
                option=option+a;
            }
            $("#main_product_tid").html(option);
        });
    }
    //添加商品
    function addproduct() {
        main_product_alertinit();
        $("#main_product_id").val(0);
        $("#main_product_alert").window("open");
    }
    //修改商品
    function editproduct() {
        var ps = $("#main_product_data").datagrid("getSelections");
        if (ps.length == 1) {
            $("#main_product_id").val(ps[0].id);
            $("#main_product_name").val(ps[0].name);
            $("#main_product_sale_price").val(ps[0].sale_price);
            $("#main_product_price").val(ps[0].price);
            $("#main_product_stock").val(ps[0].stock);
            $("#main_product_tid").val(ps[0].tid);
           CKEDITOR.instances.product_descripe.setData(ps[0].descripe);
           var html="<img src='"+"http://127.0.0.1:8080/upload/product_image/"+ps[0].face_image+"' style='width:150px;height:150px;'/>";
           $("#main_product_face").html(html);
            $("#main_product_alert").window("open");
        } else {
            $.messager.alert("系统提示", "请选择一条数据！");
        }
    }

    //添加或修改保存
    function productaddsave() {
        //获取word编辑器的值
        var x=CKEDITOR.instances.product_descripe.getData();
        //封装form中所有输入框的值
        var fd=new FormData($("#main_product_form")[0]);
        fd.append("descripe", x)
        //异步提交数据
        $.ajax({
            url:"/addproduct.do",//发送的地址
            method:"post",//发送的方式
            data:fd,//发送的数据
            contentType: false,//发送数据到服务器时所使用的内容类型
            processData:false,//布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
            //发送成功后的回调函数
            success:function(data){
                var d=JSON.parse(data);
                if(d==1){
                    $("#main_product_alert").window("close");
                    loadproductdata(1, 5);
                    $.messager.alert("系统提示", "添加/更新数据成功！");
                }else{
                    $.messager.alert("系统提示", "添加数据失败，请检查是否填写正确！");
                }
            }
        });
    }
    function removeproduct() {
        //获取要删除的数据
        var rows = $("#main_product_data").datagrid("getSelections");
        if (rows != "") {
            //定义mid数组
            var ids = [];
            //循环封装mid
            for (var i in rows) {
                ids[i] = rows[i].id
            }
            //转换成JSON数据
            var a = JSON.stringify(ids);
            //异步请求
            $.ajax({
                url: "/removeproduct.do",
                method: "post",
                data: a,
                contentType: "application/json",
                success: function (data) {
                    alert("删除数据成功!");
                    //重新加载数据
                    loadproductdata(1, 5);
                }
            });
        } else {
            $.messager.alert("系统提示", "请至少选择一条数据！");
        }
    }
    //搜索功能
    function searchproduct(value, name) {
        $.getJSON("/searchProduct.do",{type:name,value:value},function (data) {
            $("#main_product_data").datagrid("loadData",data);
        });
    }
    //选择图片，立马显示
    function file_pre(path){
        var first=path.files[0];
        var x= URL.createObjectURL(first);
        var html="<img src='"+x+"' style='width:150px;height:150px'/>";
        $("#main_product_face").html(html);
    }
    //表格中显示图片信息
    function imgFormatter(value,row,index) {
        //value：该字段的值
        //row：一行对象
        //index:数组下标
        return  "<img src='http://127.0.0.1:8080/upload/product_image/"+value+"' style='width:50px;height:50px;'/>";
    }
    //分页查找所有的商品
    function loadproductdata(p, z) {
        //异步获取对象
        $.getJSON("/productdata.do", {page: p, size: z}, function (data) {
            //把数据加载到表格中
            $("#main_product_data").datagrid("loadData", data);
            //获取分页器
            var pager = $("#main_product_data").datagrid("getPager");
            pager.pagination({
                total: data[0].total,//一共显示多少条数据
                pageNumber: p,//设置当前页码
                pageSize: z,//设置显示信息条数
                pageList: [5, 10, 15],//设置页面尺寸，显示多少条信息
                //获取分页控制器事件page：当前页码，size:显示数据数量
                onSelectPage: function (page, size) {
                    loadproductdata(page, size);//加载信息
                }
            });
        });
    }
    $(productinit);
</script>


