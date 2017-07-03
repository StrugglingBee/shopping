<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div  class="easyui-layout" data-options="fit:true">
    <!-- 搜索框-->
   <div id="main_column_searchbox" style="height: 80px;padding: 10px" data-options="region:'north',collapsed:false,title:'检索栏'">
       <input data-options="searcher:searchcolumn,prompt:'请输入搜索关键字',menu:'#main_column_choice'" class="easyui-searchbox" id="main_column_search" style="width: 300px">
        <div id="main_column_choice" style="width: 120px">
            <div data-options="name:'name',iconCls:'icon-ok'">名称</div>
            <div data-options="name:'id'">ID</div>
        </div>
   </div>
<!-- 数据栏-->
    <div data-options="region:'center'">
        <div id="column_datagrid" data-options="title:'数据栏'"></div>
    </div>

</div>
<!--添加栏目的弹窗 -->
<div  title="栏目管理" data-options="modal:true,closed:true" id="column_window" class="easyui-window" style="width: 300px;padding: 10px;display: none">
<form id="column_window_form"  method="post">
    <input id="id" type="text" name="id" style="display: none">
    名称:<input id="cname" type="text" name="name" style="width: 100%;height: 30px;padding-left: 5px"><br>
    <a href="javascript:saveColumn()" class="easyui-linkbutton">保存</a>
    <a href="#" class="easyui-linkbutton">取消</a>
</form>
</div>
    <script >
        function  column_init() {
            $("#column_datagrid").datagrid(
                {
//                    pagination:true,

                    columns:[[
                        {field:"",title:"",width:100,checkbox:true},
                        {field:"id",title:"id",width:100},
                        {field:"name",title:"名称",width:200},
                    ]],
                    toolbar:[
                        {text:"添加",iconCls:"icon-add",handler:function () {addColumn();}},
                        {text:"修改",iconCls:"icon-edit",handler:function () {editColumn();}},
                        {text:"删除",iconCls:"icon-remove",handler:function () {removeColumn();}}
                    ]
                }
            );
//            findColumnByPage(1,5);
            findColumn();
        }
        $(column_init);
        //添加栏目
        function  addColumn(){
            $("#column_window").window('open');
            $("#id").val(0);
        }
        //添加弹窗里面的保存栏目按钮
        function saveColumn() {
            var a=$("#column_window_form").serialize();
//            alert(a);
            $.post("/saveColumn.do",a,function () {
                $("#column_window").window('close')
            });
        }
        //修改栏目
        function editColumn() {
            var s=$("#column_datagrid").datagrid("getSelected");
//            alert(s);
            if(s){
                console.log(s);
                $("#name").val(s.name);
                $("#id").val(s.id);
                $("#column_window").window('open');
            }else {
                window.alert("系统提示,请选择一条数据")
            }
        }

        //删除
        function removeColumn () {
            var list=$("#column_datagrid").datagrid("getSelected");
            alert(list);
            $.get("/removeColumn.do",list,function () {
                alert("删除成功");
            })
        }
        //搜索
        function  searchcolumn(value,name) {
            $.getJSON("/searchColumn.do",{type:name,value:value},function (data) {
                $("#column_datagrid").datagrid("loadData",data);
            });
        }

//        //开始查询弹出查询框
//        function searchColumn() {
//            $("#column_search").window('open');
//        }
//        //指定查询栏目
//        function searchColumnByAccount() {
//            var column_account=$("#column_search_account").val();
//            alert(column_account);
//            console.log(column_account);
//            $.post("/searchColumnByAccount.do",column_account,function (data) {
//                var d=$.parseJSON(data);
//                alert(d);
//                $("#column_datagrid").datagrid("loadData", d);
//                $("#column_search").window('close');
//            });
//        }
        function findColumn() {
            $.get("/findColumn.do",function (data) {
//                alert(data);
                var c=$.parseJSON(data)//字符串解析成对象
                //Stringify对象转字符串
                $("#column_datagrid").datagrid("loadData",c);
                $("#column_search").window('close');

            });
        }
//        function  findColumnByPage(p,z) {
//            $.get("/findColumnByPage.do",{page: p,size: z},function (data) {
//                var d=$.parseJSON(data);
//                $("#column_datagrid").datagrid("loadData",d);
//                //获取分页对象
//                console.log(d[0].counts);
//                var  pager=$("#column_datagrid").datagrid("getPager");
//                pager.pagination({
//                    total:d[0].counts,
//                    pageList:[5,10,15],
//                    pageNumber:p,
//                    pageSize:z,
//                    beforePageText:'第',
//                    afterPageText:'页  共{pages} 页',
//                    displayMsg:'共{total}条数据',
//                    onSelectPage:function (p,z) {
//                        $(this).pagination('loading');
//                        findColumnByPage(p,z);
//                        $(this).pagination('loaded');
//                    }
//                });
//            })
//        }

    </script>






