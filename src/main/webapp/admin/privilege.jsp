<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div  class="easyui-layout" data-options="fit:true">
    <%--搜索栏--%>
    <div id="main_privilege_searchbox" style="height: 80px;padding: 10px;" data-options="region:'north',collapsed:false,title:'检索栏'">
        <input id="main_privilege_search" style="width:300px;" class="easyui-searchbox" data-options="searcher:searchprivilege,prompt:'请输入关键词',menu:'#main_privilege_choice'"></input>
        <div id="main_privilege_choice" style="width:120px;">
            <div data-options="name:'p_name',iconCls:'icon-ok'">名称</div>
            <div data-options="name:'p_remark'">备注</div>
        </div>
    </div>
    <%--数据栏--%>
    <div data-options="region:'center'">
        <div id="privilege_grid" data-options="title:'数据栏'"></div>
    </div>
</div>

<!-- 添加权限弹窗 -->
<div id="main_privilege_alert" class="easyui-window" data-options="closed:true,modal:true,title:'编辑权限'">
    <form id="main_privilege_form" class="form-group" style="margin: 10px;">
        <input id="main_privilege_pid" type="hidden" name="pid" class="form-control">
        <div class="input-group">
            <span class="input-group-addon">名称：</span>
            <input id="main_privilege_P_name" type="text" name="P_name" class="form-control">
        </div>
        <div class="input-group">
            <span class="input-group-addon">备注：</span>
            <input id="main_privilege_P_remark" type="text" name="P_remark" class="form-control">
        </div>
    </form>
    <div style="display:flex;justify-content:center;margin-top: 10px;">
        <a class="easyui-linkbutton" href="javascript:privilegesave()" style="display: inline-block; width: 200px;height: 35px;">保 存</a>
    </div>
</div>

<script type="text/javascript">
    function privilegeinit() {
        //表格
        $("#privilege_grid").datagrid({
            //请求数据，加载数据
            //url:"/manager.do",
            //表格的列
            pagination: true,//显示分页属性
            columns: [[
                {field: "pid", title: "", width: 100, checkbox: true},//添加选择框
                {field: "p_name", title: "名称", width: 200},
                {field: "p_remark", title: "备注", width: 300}
            ]],
            //工具栏
            toolbar: [
                {
                    text: "添加", iconCls: "icon-add", handler: function () {
                    addprivilege();
                }
                },
                {
                    text: "修改", iconCls: "icon-edit", handler: function () {
                    editprivilege();
                }
                },
                {
                    text: "删除", iconCls: "icon-remove", handler: function () {
                    removeprivilege();
                }
                }
            ]

        });
        loadprivilege(1,5);
    }
    //加载账号数据
    function loadprivilege(p, z) {
        //异步获取对象
        $.getJSON("/privilege.do", {page: p, size: z}, function (data) {
            //把数据加载到表格中
            $("#privilege_grid").datagrid("loadData", data);
            //获取分页器
            var pager = $("#privilege_grid").datagrid("getPager");
            pager.pagination({
                total: data[0].total,//一共显示多少条数据
                pageNumber: p,//设置当前页码
                pageSize: z,//设置显示信息条数
                pageList: [5, 10, 15],//设置页面尺寸，显示多少条信息
                //获取分页控制器事件page：当前页码，size:显示数据数量
                onSelectPage: function (page, size) {
                    loadprivilege(page, size);//加载信息
                }
            });
        });
    }
    //权限弹窗输入框初始化
    function main_privilege_alert_init() {
        $("#main_privilege_pid").val("");
        $("#main_privilege_P_name").val("");
        $("#main_privilege_P_remark").val("");
    }
    //添加权限
    function addprivilege() {
        main_privilege_alert_init();//初始化弹窗
        $("#main_privilege_pid").val(0);//给mid输入框赋值
        $("#main_privilege_alert").window("open");//让弹窗显示
    }
    //保存或更新角色
    function privilegesave(){
        var a = $("#main_privilege_form").serialize();//序列化form表单中的数据
        $.get("/saveOrUpdatePrivilege.do", a, function (d) {//异步请求
            $("#main_privilege_alert").window("close");//关闭弹窗
            //重新加载数据
            loadprivilege(1,5);
            $.messager.alert("系统提示", "添加/修改成功！");
        });
    }
    function editprivilege() {
        var a = $("#privilege_grid").datagrid("getSelected");//获取选中的数据
        if (a) {
            $("#main_privilege_pid").val(a.pid);//给pid赋值
            $("#main_privilege_P_name").val(a.p_name);//给名称赋值
            $("#main_privilege_P_remark").val(a.p_remark);//给名称赋值
            $("#main_privilege_alert").window("open");//让弹窗显示
        } else {
            $.messager.alert("系统提示", "请只选择一条数据！");
        }
    }
    function removeprivilege() {
        //获取要删除的数据
        var rows = $("#privilege_grid").datagrid("getSelections");
        if (rows != "") {
            //定义rid数组
            var pids = [];
            //循环封装rid
            for (var i in rows) {
                pids[i] = rows[i].pid
            }
            //转换成JSON数据
            var a = JSON.stringify(pids);
            //异步请求
            $.ajax({
                url: "/removeprivilege.do",
                method: "post",
                data: a,
                contentType: "application/json",
                success: function (data) {
                    //重新加载数据
                    loadprivilege(1,5);
                    $.messager.alert("系统提示", "删除数据成功！");
                }
            });
        } else {
            $.messager.alert("系统提示", "请至少选择一条数据！");
        }
    }
    //搜索功能
    function searchprivilege(value, name) {
        $.getJSON("/searchPrivilege.do",{type:name,value:value},function (data) {
            $("#privilege_grid").datagrid("loadData",data);
        });
    }
    $(privilegeinit);
</script>