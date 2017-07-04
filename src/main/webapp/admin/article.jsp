<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="easyui-layout" data-options="fit:true">
        <!-- 搜索栏-->
        <div id="main_article_searchbox" style="height: 80px;padding: 10px" data-options="region:'north',collapsed:false,title:'检索栏'">
            <input id="main_article_search" style="width: 300px" class="easyui-searchbox" data-options="searcher:searchArticle,prompt:'请输入搜索关键字',menu:'#main_article_choice'">
            <div id="main_article_choice" style="width: 160px">
                <div data-options="name:'id',iconCls:'icon-ok'">ID</div>
                <div data-options="name:'text'">简介</div>
                <div data-options="name:'title'">标题</div>
            </div>
        </div>
        <!-- 数据栏-->
        <div data-options="region:'center'">
            <div id="article_datagrid" data-options="title:'数据栏'"></div>
        </div>
    </div>
<!-- 添加文章弹窗-->
    <div id="main_article_alert" class="easyui-window" data-options="closed:true,modal:true">
        <form id="main_article_form" class="form-group" style="margin: 10px">
           <input id="main_article_id" type="text" style="display:none" name="id" class="form-control" >
            <div class="input-group">
                <span class="input-group-addon" style="width: 150px">标题</span>
                <input id="main_article_title" type="text" name="title" class="form-control">
            </div>
            <div class="input-group">
                <span class="input-group-addon" style="width: 150px">内容简介</span>
                <textarea id="main_article_text" rows="2" cols="2" name="text" class="ckeditor" />
            </div>
        </form>
        <button class="btn btn-success" onclick="saveArticle()">保存</button>
        <button class="btn btn-danger" data-dismiss="modal">关闭</button>
    </div>
    <script type="text/javascript">

        CKEDITOR.replace("text");

        function  articleinit() {
            //表格
            $("#article_datagrid").datagrid({
                columns:[[
                    {field:"",title:"",width:200,checkbox:true},//添加选择框
                    {field:"title",title:"标题",width:100},
                    {field:"text",title:"内容简介",width:200}

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

        $("#main_article_id").val(0);
        $("#main_article_alert").window('open');

    }
    //添加文章的保存按钮
    function saveArticle() {
//        var x=CKEDITOR.instances.text.getData();
        var a=$("#main_article_form").serialize();
        $.post("/saveArticle.do",a,function () {
            //重新加载数据
            findArticle();
            $("#main_article_alert").window('close');
        });
    }
    //修改文章
    function editorArticle() {
        var s=$("#article_datagrid").datagrid("getSelected");
        if(s){
            $("#main_article_id").val(s.id);
            $("#main_article_title").val(s.title);

            $("#main_article_alert").window('open')
        }else {
            $.messager.alert("系统提示","请选择一条数据")
        }
    }
    //删除文章
    function removeArticle() {
        var list=$("#article_datagrid").datagrid("getSelected");
        $.get("/removeArticle.do",list,function () {
            //重新加载数据
            findArticle();
            $.messager.alert("系统提示","删除成功");
        });
    }
    //搜索文章
    function searchArticle(value,name) {
        $.getJSON("/searchArticle.do",{type:name,value:value},function (data) {
            $("#article_datagrid").datagrid("loadData",data);
        });
    }
    </script>
