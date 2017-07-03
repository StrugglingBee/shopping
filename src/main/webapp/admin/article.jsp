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
            <div id="article_grid" data-options="title:'数据栏'"></div>
        </div>
    </div>
<!-- 添加文章弹窗-->
    <div id="main_article_alert" class="easyui-window" data-options="closed:true,modal:true">
        <form id="main_article_form" class="form-group" style="margin: 10px">
           <input id="main_article_mid" type="hidden" name="id" class="form-control" >
            <div class="input-group">
                <span class="input-group-addon" style="width: 70px">标题</span>
                <input id="main_article_title" type="text" name="title" class="form-control">
            </div>
            <div class="input-group">
                <span class="input-group-addon" style="width: 70px">内容简介</span>
                <textarea rows="5" cols="20" name="text" class="ckeditor" />
            </div>
        </form>
        <button class="btn btn-danger" data-dismiss="modal">关闭</button>
        <button class="btn btn-success" onclick="saveArticle()">保存</button>
    </div>
    <script type="text/javascript">

        CKEDITOR.replace("text");

        function  articleinit() {
            //表格
            $("#article_grid").datagrid({
                columns:[[
                    {field:"id",title:"",width:200,checkbox:true},//添加选择框
                    {field:"text",title:"内容简介",width:200},
                    {field:"title",title:"标题",width:200}
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
        }
    $(articleinit());
    function searchArticle(value,name) {

    }
    </script>
