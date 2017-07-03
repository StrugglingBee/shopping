<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm',searcher:searchaddress_area" style="width:300px"></input>
<div id="mm">
    <div data-options="name:'name',iconCls:'icon-ok'">名称</div>
    <%--<div data-options="name:'city'">市区</div>--%>
    <%--<div data-options="name:'county'">县</div>--%>
    <%--<div data-options="name:'id'">ID</div>--%>
    <%--<div data-options="name:'uid'">UID</div>--%>

</div>

<div id="address_area"></div>
<!-- 添加角色弹窗 -->
<div id="address_area_alert" class="easyui-window" data-options="closed:true,modal:true,title:'编辑类型'" style="width: 300px;height: 200px;">
    <form id="address_area_form" class="form-group" style="margin: 10px;">
        <input id="address_area_id" type="hidden" name="id" class="form-control">
        <div class="input-group" style="margin-top: 20px;">
            <span class="input-group-addon">名称：</span>
            <input id="address_area_name" type="text" name="name" class="form-control">
        </div>
        <div id="addrss_area_rank" class="input-group" style="margin-top: 20px;margin-bottom: 10px;">
            <span class="input-group-addon">级别：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="rank" type="radio" value="0" checked >&nbsp;&nbsp;同级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="rank" type="radio" value="1" >&nbsp;&nbsp;子级
        </div>
        <input id="address_area_pid" type="hidden" name="pid" class="form-control">
    </form>
    <div style="display:flex;justify-content:center;margin-top: 10px;">
        <a class="easyui-linkbutton" href="javascript:address_area_save()" style="display: inline-block; width: 200px;height: 35px;">保 存</a>
    </div>

</div>
<script>
    //初始化
    function init() {
        $("#address_area").treegrid({
            title:"配送地区管理",
//            url:"/findAllAe.do",
            idField:"id",
            treeField:"name",
            rownumbers:true,
            singleSelect:false,
            columns:
                [[
                    {field:"id",title:"",width:100,checkbox:true},
                    {field:"name",title:"类别",width:500}
                ]],
            toolbar:[
                {text:"添加",iconCls:"icon-add",handler:function(){addArea();}},
                {text:"修改",iconCls:"icon-edit",handler:function(){editArea();}},
                {text:"删除",iconCls:"icon-remove",handler:function(){deleteArea();}}
            ]
        });
        inquireArea();
    }
    $(init);
    //查询
    function inquireArea() {
        $.getJSON("/findAllAe.do",function (data) {
            $("#address_area").treegrid("loadData",data);
        })

    }
    //删除分类
    function deleteArea(){
        //获取选择的数据
        var x=  $("#address_area").treegrid("getSelected");
        //x非空,就是选择了要删除的数据
        if(x){
            $.get("/deleteArea.do",{id:x.id},function(d){
                inquireArea();
            });
        }else{
            //提示框
            $.messager.alert("系统提示","请选择要删除的数据");
        }
    }
    //添加分类

    function addArea() {
        //获取选择的数据
        var x=  $("#address_area").treegrid("getSelections");
        //x非空,就是选择了要添加分类
        if(x.length==1){
            $("#address_area_id").val(x[0].id);
            $("#address_area_name").val("");
            $("#address_area_pid").val(x[0].pid);
            $("#addrss_area_rank").show();
            //显示window
            $("#address_area_alert").window("open");
        }else{
            //提示框
            $.messager.alert("系统提示","请选择一个分类");
        }
    }

    //添加保存分类
    function address_area_save(){
        var y= $("#address_area_form").serialize();
        $.post("/addarea.do",y,function(d){
            //加载数据
            inquireArea();
            $("#address_area_alert").window("close");

        });
    }
    //修改分类
    function editArea() {
        //获取选择的数据
        var x=  $("#address_area").treegrid("getSelections");
        //x非空,选择修改
        if(x.length==1){
            $("#address_area_id").val(x[0].id);
            $("#address_area_name").val(x[0].name);
            $("#address_area_pid").val(-1);
            $("#addrss_area_rank").hide();
            //显示window
            $("#address_area_alert").window("open");
        }else{
            //提示框
            $.messager.alert("系统提示","请选择一个分类");
        }

    }
    //搜索功能
    function searchaddress_area(value, name) {
        $.getJSON("/searchaddress_area.do",{type:name,value:value},function (data) {
            $("#address_area").treegrid("loadData",data);
        });

    }
</script>