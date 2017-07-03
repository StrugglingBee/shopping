<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div  class="easyui-layout" data-options="fit:true">
    <%--搜索栏--%>
    <div id="main_product_type_searchbox" style="height: 80px;padding: 10px;" data-options="region:'north',collapsed:false,title:'检索栏'">
        <input id="main_product_type_search" style="width:300px;" class="easyui-searchbox" data-options="searcher:searchproduct_type,prompt:'请输入关键词',menu:'#main_product_type_choice'"></input>
        <div id="main_product_type_choice" style="width:120px;">
            <div data-options="name:'text',iconCls:'icon-ok'">名称</div>
        </div>
    </div>
    <%--数据栏--%>
    <div data-options="region:'center'">
        <div id="main_product_type_any" data-options="title:'数据栏'"></div>
    </div>
</div>

<!-- 添加角色弹窗 -->
<div id="main_product_type_alert" class="easyui-window" data-options="closed:true,modal:true,title:'编辑类型'" style="width: 300px;height: 200px;">
    <form id="main_product_type_form" class="form-group" style="margin: 10px;">
        <input id="main_product_type_id" type="hidden" name="id" class="form-control">
        <div class="input-group" style="margin-top: 20px;">
            <span class="input-group-addon">名称：</span>
            <input id="main_product_type_text" type="text" name="text" class="form-control">
        </div>
        <div id="main_product_type_rank" class="input-group" style="margin-top: 20px;margin-bottom: 10px;">
            <span class="input-group-addon">级别：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="rank" type="radio" value="0" checked >&nbsp;&nbsp;同级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="rank" type="radio" value="1" >&nbsp;&nbsp;子级
        </div>
        <input id="main_product_type_pid" type="hidden" name="pid" class="form-control">
    </form>
    <div style="display:flex;justify-content:center;margin-top: 10px;">
        <a class="easyui-linkbutton" href="javascript:product_typesave()" style="display: inline-block; width: 200px;height: 35px;">保 存</a>
    </div>

</div>


    <script type="text/javascript">
        //初始化
        function product_typeinit() {
            $("#main_product_type_any").treegrid({
//                url:"/findTypes.do",
                idField:"id",
                treeField:"text",
                rownumbers:true,//是否显示行号
                singleSelect:false,//单选,设置成true为单选
                columns:
                    [[
                        {field:"id",title:"",width:100,checkbox:true},
                        {field:"text",title:"类别",width:500}
                    ]],
                toolbar:[
                    {text:"添加",iconCls:"icon-add",handler:function(){addproduct_type();}},
                    {text:"修改",iconCls:"icon-edit",handler:function(){editproduct_type();}},
                    {text:"删除",iconCls:"icon-remove",handler:function(){deleteproduct_type();}}
                ]
            });
            //加载类型数据
            loadproduct_type();
        }
        //加载数据
        function loadproduct_type() {
            $.getJSON("/findTypes.do",function (data) {
                $("#main_product_type_any").treegrid("loadData",data);
            })
        }
        //添加商品分类
        function addproduct_type() {
            //获取选择的数据
            var x=  $("#main_product_type_any").treegrid("getSelections");
            //x非空,就是选择了要添加分类
            if(x.length==1){
                $("#main_product_type_id").val(x[0].id);
                $("#main_product_type_text").val("");
                $("#main_product_type_pid").val(x[0].pid);
                $("#main_product_type_rank").show();//让级别DIV显示
                //显示window
                $("#main_product_type_alert").window("open");
            }else{
                //提示框
                $.messager.alert("系统提示","请选择一个分类");
            }
        }
        //添加保存商品分类
        function product_typesave(){
            var y= $("#main_product_type_form").serialize();
            $.post("/addType.do",y,function(d){
                $("#main_product_type_alert").window("close");
                //加载类型数据
                loadproduct_type();
            });
        }

        //修改商品分类
        function editproduct_type() {
            //获取选择的数据
            var x=  $("#main_product_type_any").treegrid("getSelections");
            //x非空,选择修改
            if(x.length==1){
                $("#main_product_type_id").val(x[0].id);
                $("#main_product_type_text").val(x[0].text);
                $("#main_product_type_pid").val(-1);
                $("#main_product_type_rank").hide();
                //显示window
                $("#main_product_type_alert").window("open");
            }else{
                //提示框
                $.messager.alert("系统提示","请选择一个分类");
            }
        }

        //删除商品分类
        function deleteproduct_type(){
            //获取选择的数据
            var rows=  $("#main_product_type_any").treegrid("getSelections");
            if (rows != "") {
                //定义id数组
                var ids = [];
                //循环封装id
                for (var i in rows) {
                    ids[i] = rows[i].id;
                }
                //转换成JSON数据
                var a = JSON.stringify(ids);
                //异步请求
                $.ajax({
                    url: "/deletePtype.do",
                    method: "post",
                    data: a,
                    contentType: "application/json",
                    success: function (data) {
                        loadproduct_type();
                        $.messager.alert("系统提示", "删除数据成功！");
                    }
                });
            } else {
                $.messager.alert("系统提示", "请至少选择一条数据！");
            }
        }
        //搜索功能
        function searchproduct_type(value, name) {
            $.getJSON("/searchproduct_type.do",{type:name,value:value},function (data) {
                $("#main_product_type_any").treegrid("loadData",data);
            });
        }
        $(product_typeinit);
    </script>



