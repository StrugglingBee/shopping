<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/28 0028
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <script>
        function init() {
            initdatagrid();
            $.getJSON("/findAllUserType.do",function (data) {
                console.log(data);
                var dg = $("#datagrid").datagrid({
                    data: data,
                });
            });
        }
        function  initdatagrid() {
            $("#datagrid").datagrid(
                //请求加载页面
                //url:user.do
                //列表的列
                {
                    columns:[[
                        {field:"",title:"",width:100,checkbox:true},//添加选择框
                        {field:"tid",title:"tid",width:100},
                        {field:"type_name",title:"会员类别",width:100},
                        {field:"integral_start",title:"需要消费",width:100},
                        {field:"integral_end",title:"升级金额",width:100 },
                        {field:"menber_power",title:"优惠",width:100},
                    ]],
                    //工具栏
                    toolbar:[
                        {text:"添加",iconCls:"icon-add",handler:function(){addUserType();}},
                        {text:"修改",iconCls:"icon-edit",handler:function(){editUserType();}},
                        {text:"删除",iconCls:"icon-remove",handler:function(){removeUserType();}},
//                        {text:"查找",iconCls:"icon-search",handler:function(){searchUserType();}}
                    ],


                });
        }

        $(init);
        //shanchu
        function removeUserType(){
            var rows= $("#datagrid").datagrid("getSelections");
//            alert(list);
            if(rows) {
                var ids = [];
                for (var i in rows) {
                    ids[i] = rows[i].tid;

                }
                var list = JSON.stringify(ids);
                console.log(ids);
                console.log(list);
//                $.post("/removeUserType.do",list,function (data) {
//                    init();
//                })
                $.ajax({
                    url:"/removeUserType.do",
                    method:"post",
                    data:list,
                    contentType:"application/json",
                   success:function (data) {

                      init()
                    }
                });
            }
            else{
                alert("请选择一条数据");
            }
        }
        //修改用户
        function editUserType(){
            var s=$("#datagrid").datagrid("getSelected");
            if(s){
                console.log(s);
                $("#type_name").val(s.type_name);
                $("#integral_start").val(s.integral_start);
                $("#integral_end").val(s.integral_end);
                $("#menber_power").val(s.menber_power);
                //隐藏
                $("#tid").val(s.tid);
                $("#user_type_window").window('open');
            }else {
                window.alert("妈的智障，请您选择一条数据！")
            }
        }
        //添加用户
        function addUserType() {
            $("#user_type_window").window('open');
            $("#tid").val(0);
        }
        //保存用户
        function saveUserType(){
            var a=$("#user_type_window_form").serialize();
            console.log(a);
            $.post("/saveUserType.do",a,function () {
                $("#user_type_window").window('close');
                init()

            })
        }
    </script>

            <div id="datagrid"></div>
            <div id="user_type_window" class="easyui-window " style="width: 300px ;padding:10px;" data-options="modal:true,closed:true" title="会员类型管理">
                <form id="user_type_window_form" method="post">
                    <input id="tid"type="text" name="tid" style="display: none">

                    会员类别：<input id="type_name" type="text" name="type_name" style="width:100%;height:30px;padding-left:5px"/>
                    <br>
                    需要消费： <input id="integral_start" type="text" name="integral_start" style="width:100%;height:30px ;padding-left:5px" />
                    <br>
                    升级金额：  <input id="integral_end" type="text" name="integral_end" style="width:100%;height:30px ; padding-left:5px"/>
                    <br>
                    优惠： <input id="menber_power" type="text" name="menber_power" style="width:100%;height:30px;padding-left:5px"/>
                    <br>
                    <a href="javascript:saveUserType()" class="easyui-linkbutton" >保存</a> <a href="#" class="easyui-linkbutton" >取消</a>
                </form>
            </div>



