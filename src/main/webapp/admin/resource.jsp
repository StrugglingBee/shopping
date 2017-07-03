<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div  class="easyui-layout" data-options="fit:true">
    <%--搜索栏--%>
    <div id="main_resource_searchbox" style="height: 80px;padding: 10px;" data-options="region:'north',collapsed:false,title:'检索栏'">
        <input id="main_resource_search" style="width:300px;" class="easyui-searchbox" data-options="searcher:searchresource,prompt:'请输入关键词',menu:'#main_resource_choice'"></input>
        <div id="main_resource_choice" style="width:120px;">
            <div data-options="name:'text',iconCls:'icon-ok'">名称</div>
            <div data-options="name:'url'">url</div>
        </div>
    </div>
    <%--数据栏--%>
    <div data-options="region:'center'">
        <div id="resource_grid" data-options="title:'数据栏'"></div>
    </div>
</div>

<!-- 添加资源弹窗 -->
<div id="main_resource_alert" class="easyui-window" data-options="closed:true,modal:true,title:'编辑资源'">
    <form id="main_resource_form" class="form-group" style="margin: 10px;">
        <input id="main_resource_resource_id" type="hidden" name="resource_id" class="form-control">
        <div class="input-group">
            <span class="input-group-addon">名称：</span>
            <input id="main_resource_text" type="text" name="text" class="form-control">
        </div>
        <div class="input-group">
            <span class="input-group-addon">URL：</span>
            <input id="main_resource_url" type="text" name="url" class="form-control">
        </div>
        <div id="main_resource_type_rank" class="input-group" style="margin-top: 20px;margin-bottom: 10px;">
            <span class="input-group-addon">级别：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="rank" type="radio" value="0" checked >&nbsp;&nbsp;同级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="rank" type="radio" value="1" >&nbsp;&nbsp;子级
        </div>
        <input id="main_resource_parent_id" type="hidden" name="parent_id" class="form-control">
    </form>
    <div style="display:flex;justify-content:center;margin-top: 10px;">
        <a class="easyui-linkbutton" href="javascript:resourcesave()" style="display: inline-block; width: 200px;height: 35px;">保 存</a>
    </div>

</div>

<script type="text/javascript">
    function resourceinit() {
        //表格
        $("#resource_grid").treegrid({
            //请求数据，加载数据
            //url:"/manager.do",
            //表格的列
            idField:"resource_id",
            treeField:"text",
            rownumbers:true,//是否显示行号
            singleSelect:false,//单选,设置成true为单选
            columns:[[
                {field:"resource_id",title:"",width:100,checkbox:true},
                {field:"text",title:"资源名称",width:200},
                {field:"url",title:"资源路径",width:200}

            ]],
            onLoadSuccess:function (rows,data) {
                $.each(data,function (idex,val) {//遍历根节点
                    $("#resource_grid").treegrid("collapseAll", val.resource_id);//关闭所有子节点
                });
            },
            //工具栏
            toolbar: [
                {
                    text: "添加", iconCls: "icon-add", handler: function () {
                    addresource();
                }
                },
                {
                    text: "修改", iconCls: "icon-edit", handler: function () {
                    editresource();
                }
                },
                {
                    text: "删除", iconCls: "icon-remove", handler: function () {
                    removeresource();
                }
                }
            ]

        });
        loadresource();
    }
    //加载资源数据
        function loadresource() {
            //异步获取对象
            $.getJSON("/resource.do", function (data) {
                //把数据加载到表格中
                $("#resource_grid").treegrid("loadData", data);
            });
        }
        function main_resource_alertinit() {
            $("#main_resource_resource_id").val("");//给ID赋值
            $("#main_resource_text").val("");//给ID赋值
            $("#main_resource_url").val("");//给ID赋值
            $("#main_resource_parent_id").val("");//给parent_id赋值
            $("#main_resource_type_rank").show();//显示级别
        }
        //添加资源
        function addresource() {
            var a = $("#resource_grid").treegrid("getSelections");//获取选中的数据
            if (a.length==1) {
                main_resource_alertinit();//弹窗初始化
                $("#main_resource_parent_id").val(a[0].parent_id);//给parent_id赋值
                $("#main_resource_resource_id").val(a[0].resource_id);//给ID赋值
                $("#main_resource_alert").window("open");//让弹窗显示
            } else {
                $.messager.alert("系统提示", "请只选择一条数据！");
            }
        }
        //保存或更新角色
        function resourcesave(){
            var a = $("#main_resource_form").serialize();//序列化form表单中的数据
            $.get("/saveOrUpdateResource.do", a, function (d) {//异步请求
                $("#main_resource_alert").window("close");//关闭弹窗
                //重新加载数据
                loadresource();
                $.messager.alert("系统提示", "添加/更新数据成功！");

            });
        }
        //修改资源
        function editresource() {
            var a = $("#resource_grid").datagrid("getSelections");//获取选中的数据
            if (a.length==1) {
                $("#main_resource_resource_id").val(a[0].resource_id);//给ID赋值
                $("#main_resource_text").val(a[0].text);//给名称赋值
                $("#main_resource_url").val(a[0].url);//给url输入框赋值
                $("#main_resource_parent_id").val(-1);//给parent_id输入框赋值
                $("#main_resource_type_rank").hide();
                $("#main_resource_alert").window("open");//让弹窗显示
            } else {
                $.messager.alert("系统提示", "请只选择一条数据！");
            }
        }
        function removeresource() {
            //获取要删除的数据
            var rows = $("#resource_grid").treegrid("getSelections");
            if (rows != "") {
                //定义rid数组
                var resource_ids = [];
                //循环封装rid
                for (var i in rows) {
                    resource_ids[i] = rows[i].resource_id;
                }
                //转换成JSON数据
                var a = JSON.stringify(resource_ids);
                //异步请求
                $.ajax({
                    url: "/removeresource.do",
                    method: "post",
                    data: a,
                    contentType: "application/json",
                    success: function (data) {
                        loadresource();
                        $.messager.alert("系统提示", "删除数据成功！");
                    }
                });
            } else {
                $.messager.alert("系统提示", "请至少选择一条数据！");
            }
        }
    //搜索功能
    function searchresource(value, name) {
        $.getJSON("/searchResource.do",{type:name,value:value},function (data) {
            $("#resource_grid").treegrid("loadData",data);
        });
    }
    $(resourceinit);
</script>