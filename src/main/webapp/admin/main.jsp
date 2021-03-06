<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html>
<head>
    <title>后台管理页面</title>
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/icon.css"/>
    <link rel="stylesheet" href="/css/easyui.css"/>
    <%--主页面的CSS样式--%>
    <link rel="stylesheet" href="/admin_css/main.css"/>
    <%--管理员页面CSS样式--%>
    <link rel="stylesheet" href="/admin_css/main_manager.css">
    <%--角色管理页面Css样式--%>
    <link rel="stylesheet" href="/admin_css/main_role.css">
    <%--权限管理页面Css样式--%>
    <link rel="stylesheet" href="/admin_css/main_privilege.css">
    <%--资源管理页面Css样式--%>
    <link rel="stylesheet" href="/admin_css/main_resource.css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/easyui.js"></script>
    <%--引入富文本编辑器--%>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        //初始化操作。
        function init() {
            //获取管理员拥有的权限数量
            var x =${roles.size()};
            //如果数量大于1就显示弹窗
            if (x > 1) {
                $("#main-alert").window("open");//让弹窗显示
            } else if (x == 1) {
                loaddata(${roles.get(0).rid});
            }
//            loaddata(1);

        }

        function loaddata(a) {
            //根据权限查找拥有的资源
            $.getJSON("/findResourceByRole.do", {rid: a}, function (data) {
                for (var i in data) {
                    $("#main_left").accordion("add", {
                        //添加
                        title: data[i].text,
                        content: "<ul class='easyui-tree' data-options=\"url:'/findResourceByPid.do?parent_id=" + data[i].resource_id + "'\"></ul>"
                    });
                }
                ;
                //给所有的树添加点击检测事件
                $(".easyui-tree").tree({
                    onClick: function (node) {
                        //判断是工作区是否存在该节点
                        var isExists = $("#main_work").tabs("exists", node.text);
                        if (isExists) {
                            //如果存在，就选择该节点
                            $("#main_work").tabs("select", node.text);
                        } else {
                            //如果不存在，就添加该节点
                            $("#main_work").tabs("add", {
                                title: node.text,
                                closable: true,
                                href: node.url
                            });
                        }
                    }
                });
            });
        }
        //选择角色
        function select() {
            //获取选择的角色ID
            var a = $("#manger_role").val();
            $("#main-alert").window("close");//让弹窗关闭
            //把角色ID传递出去
            loaddata(a);
        }
        $(init);

    </script>
</head>
<body>
<!-- 布局:把页面分为上下左右中 -->
<div id="main" class="easyui-layout">
    <div id="main_header" data-options="region:'north'">
        欢迎使用商城后台管理系统
        <%--判断是否登录--%>
        <shiro:authenticated>
            <div style="display: inline-block;float: right;font-size: 16px;margin-top: 20px;margin-right: 20px;color: orange">
                欢迎：<shiro:principal/>
                <a href="/exitAdmin.do">退出系统</a>
            </div>
        </shiro:authenticated>
    </div>
    <div id="main_left" class="easyui-accordion" data-options="region:'west'">

    </div>
    <div id="main_work" class="easyui-tabs" data-options="region:'center'">

    </div>
</div>

<!-- 添加弹窗 -->
<div id="main-alert" class="easyui-window" data-options="closed:true,modal:true,title:'请选择一个角色'">
    <h3>您有多个角色身份</h3>
    <h3>请选择一个角色进入工作页面</h3>
    <div class="input-group">
        <span class="input-group-addon">角色:</span>
        <select id="manger_role" class="form-control" name="manger_role">
            <c:forEach items="${roles }" var="r">
                <option value="${r.rid}">${r.name }</option>
            </c:forEach>
        </select>
    </div>
    <div style="display:flex;justify-content:center;margin-top: 10px;">
        <a class="easyui-linkbutton" href="javascript:select()"
           style="display: inline-block; width: 200px;height: 35px;">保 存</a>
    </div>
</div>
</body>
</html>
