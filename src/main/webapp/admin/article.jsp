<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="easyui-layout" data-options="fit:true">
        <!-- 搜索栏-->
        <div id="main_article_searchbox" style="height: 80px;padding: 10px" data-options="region:'north',collapsed:false,title:'检索栏'">
            <input id="main_article_search" style="width: 300px" class="easyui-searchbox" data-options="searcher:searchArticle,prompt:'请输入搜索关键字',menu:'#main_article_choice'">
            <div id="main_article_choice" style="width: 160px">
                <div data-options="name:'title',iconCls:'icon-ok'">标题</div>
                <div data-options="name:'text'">内容</div>
            </div>
        </div>
        <!-- 数据栏-->
        <div data-options="region:'center'">
            <div id="article_datagrid" data-options="title:'数据栏'"></div>
        </div>
    </div>
<!-- 添加文章弹窗-->
    <div style="width: 800px;height: 600px;" id="main_article_alert" class="easyui-window" data-options="closed:true,modal:true,title:'编辑文章'">
        <form id="main_article_form" class="form-group" style="margin: 10px">
           <input id="main_article_id" type="text" style="display:none" name="id" class="form-control" >
            <div class="input-group">
                <span class="input-group-addon" >标题</span>
                <input id="main_article_title" type="text" name="title" class="form-control">
            </div>
            <div class="input-group">
                <span class="input-group-addon">内容</span>
                <textarea rows="3" cols="3" id="article_text" name="article_text" ></textarea>
            </div>
        </form>
        <div style="display:flex;justify-content:center;margin-top: 10px;">
            <a class="easyui-linkbutton" href="javascript:saveArticle()" style="display: inline-block; width: 200px;height: 35px;">保 存</a>
        </div>
    </div>
    <script type="text/javascript">

        function  articleinit() {
            //表格
            $("#article_datagrid").datagrid({
                columns:[[
                    {field:"",title:"",width:100,checkbox:true},//添加选择框
                    {field:"title",title:"标题",width:300},
                    {field:"text",title:"内容简介",width:500}
                ]],
                toolbar:[
                    {
                        text:"添加",iconCls:"icon-add",handler:function () {
                        addArticle();
                    }
                    },
                    {
                        text:"修改",iconCls:"icon-edit",handler:function () {
                       editorArticle();
                    }
                    },
                    {
                        text:"删除",iconCls:"icon-remove",handler:function () {
                        removeArticle();
                    }
                    },
                ]
            });
            findArticle();
            //加载富文本编辑器
            CKEDITOR.replace('article_text');
        }
    $(articleinit());
        //读取数据
    function findArticle(){
        $.get("/findArticle.do",function (data) {
            var c=$.parseJSON(data);//字符串解析成对象
            $("#article_datagrid").datagrid("loadData",c);
        });
    }
    //添加文章
    function addArticle() {
        $("#main_article_title").val("");
        CKEDITOR.instances.article_text.setData("");
        $("#main_article_id").val(0);
        $("#main_article_alert").window('open');

    }
    //添加文章的保存按钮
    function saveArticle() {
        //获取word编辑器的值
        var x=CKEDITOR.instances.article_text.getData();
        //封装form中所有输入框的值
        var fd=new FormData($("#main_article_form")[0]);
        fd.append("text", x)
        //异步提交数据
        $.ajax({
            url:"/saveArticle.do",//发送的地址
            method:"post",//发送的方式
            data:fd,//发送的数据
            contentType: false,//发送数据到服务器时所使用的内容类型
            processData:false,//布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
            //发送成功后的回调函数
            success:function(data){
                var d=JSON.parse(data);
                if(d==1){
                    $("#main_article_alert").window("close");
                    findArticle();
                    $.messager.alert("系统提示", "添加/更新数据成功！");
                }else{
                    $.messager.alert("系统提示", "添加数据失败，请检查是否填写正确！");
                }
            }
        });

    }
    //修改文章
    function editorArticle() {
        var s=$("#article_datagrid").datagrid("getSelections");
        if(s.length==1){
            $("#main_article_id").val(s[0].id);
            $("#main_article_title").val(s[0].title);
            CKEDITOR.instances.article_text.setData(s[0].text);
            $("#main_article_alert").window('open')
        }else {
            $.messager.alert("系统提示","请只选择一条数据")
        }
    }
    //删除文章
    function removeArticle() {
        //获取要删除的数据
        var rows = $("#article_datagrid").datagrid("getSelections");
        if (rows != "") {
            //定义mid数组
            var ids = [];
            //循环封装id
            for (var i in rows) {
                ids[i] = rows[i].id
            }
            //转换成JSON数据
            var a = JSON.stringify(ids);
            //异步请求
            $.ajax({
                url: "/removeArticle.do",
                method: "post",
                data: a,
                contentType: "application/json",
                success: function (data) {
                    alert("删除数据成功!");
                    //重新加载数据
                    findArticle();
                }
            });
        } else {
            $.messager.alert("系统提示", "请至少选择一条数据！");
        }
    }
    //搜索文章
    function searchArticle(value,name) {
        $.getJSON("/searchArticle.do",{type:name,value:value},function (data) {
            $("#article_datagrid").datagrid("loadData",data);
        });
    }
    </script>
