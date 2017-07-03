<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="margin:20px 0;"></div>
<input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm',searcher:searchcourier" style="width:300px"></input>
<div id="mm">
    <div data-options="name:'name',iconCls:'icon-ok'">名称</div>
    <%--<div data-options="name:'city'">市区</div>--%>
    <%--<div data-options="name:'county'">县</div>--%>
    <%--<div data-options="name:'id'">ID</div>--%>
    <%--<div data-options="name:'uid'">UID</div>--%>

</div>

<div id="courier_grid"></div>



<!--添加弹出窗口-->
<div id="courier_alert" style="width: 350px;height: 300px;" class="easyui-window" data-options="closed:true,modal:true">
    <form id="courier_form" class="form-group" style="margin: 10px;">

        <input id="courier_id" type="hidden" name="id" class="form-control">

        <div class="input-group">
            <span class="input-group-addon">快递名称：</span>
            <input id="courier_name" type="text" name="name" class="form-control">
        </div>
    </form>
    <div style="display:flex;justify-content:center;margin-top: 10px;">
        <a class="easyui-linkbutton" href="javascript:courier_save()" style="display: inline-block; width: 200px;height: 35px;">保 存</a>
    </div>
</div>

<script>
    var uid=0;
    function init(){
        $("#courier_grid").datagrid({
            pagination: true,//显示分页属性
            columns:[[

                {field:"",width:100,checkbox:true},
                {field:"name",title:"快递名称",width:100},
                {field:"time",title:"时间",width:200}

            ]],
            toolbar:[
                {text:"添加",iconCls:"icon-add",handler:function (){addAddress_courier();}},
                {text:"修改",iconCls:"icon-edit",handler:function (){editAddress_courier();}},
                {text:"删除",iconCls:"icon-remove",handler:function(){removeAddress_courier();}},
                {text:"",iconCls:"icon-inquire",handler:function(){inquireAddress_courier();}}
            ]
        });
        //加载数据库信息
        inquireAddress_courier();
        //
        loadexpress(1,5);
    }
    //加载账号数据
    function loadexpress(p,z) {
        //异步获取对象
        $.getJSON("/courier.do",{page:p,size:z},function (data) {
            //将数据加载到表格
            $("#courier_grid").datagrid("loadData",data);
            //获取分页器
            var pager=$("#courier_grid").datagrid("getPager");
            pager.pagination({
                total:data[0].total,//显示总的数据条数
                pageNumber:p,//设置当前页码
                pageSize:z,//设置显示信息条数
                pageList:[5,10,15],//设置页面尺寸，显示信息条数
                //获取分页控制器事件page：当前页码，size:显示数据数量
                onSelectPage:function (page, size) {
                    loadexpress(page,size);//加载信息
                }
            });
        });
    }

    //添加
    function addAddress_courier(){
        $("#courier_id").val(0);
        $("#courier_name").val("");
        $("#courier_alert").window("open");

    }
    //查询
    function inquireAddress_courier() {
        $.get("/findAllourier.do",function (list) {
            var data=$.parseJSON(list);
//            console.log(data);
            $("#courier_grid").datagrid("loadData",data);
        })

    }
    //修改
    function editAddress_courier() {
        var a=$("#courier_grid").datagrid("getSelected");//获取数据库里被选中的信息
        if(a){
            $("#courier_id").val(a.id);
            $("#courier_name").val(a.name);
            $("#courier_alert").window("open");
        }else {
            $.messager.alert("系统提示","请选择一条数据!");
        }
    }
    //删除
    function removeAddress_courier(){
        //获取要删除的数据
        var rows=$("#courier_grid").datagrid("getSelections");
        if(rows!=""){
            alert(rows);
            //定义zid数组
            var ids=[];
            //封装
            for (var i in rows){
                ids[i]=rows[i].id
                console.log(ids[i]);
            }
            //转换成json
            var a=JSON.stringify(ids);
            //异步请求
            console.log(a+1);
            $.ajax({
                url:"/removeAddress_courier.do",
                method:"post",
                data:a,
                contentType:"application/json",
                success:function (data) {

                    init();
                }
            });
        }else {
            $.messager.alert("系统提示","请选择一条数据");
        }
    }


    //添加保存
    function courier_save() {
        var a=$("#courier_form").serialize();//序列化from里面的表单
        $.get("/saveOrUpdateCourier.do",a,function (d) {
            $("#courier_alert").window("close");//关闭弹窗
            init();
        });
    }
    //    //异步请求数据并加载
    //    function loadExpress() {
    //            $.getJSON("/send_address.do",function(data){
    //                $("#express_grid").datagrid("loadData",data);
    //            });
    //    }
    //搜索功能
    function searchcourier(value, name) {
        $.getJSON("/searchCourier.do",{type:name,value:value},function (data) {
            $("#courier_grid").datagrid("loadData",data);
        });
    }
    $(init);
</script>

