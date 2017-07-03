<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/easyui.css">
    <link rel="stylesheet" href="css/icon.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui.js"></script>
    <script type="text/javascript">
        function aaaaa() {
                //可行的上传方法
//            $("#form").form("submit",{
//                success:function (data) {
//                    alert(data);
//                }
//            });
            var c=new FormData($("#form")[0]);
            //异步提交数据
            $.ajax({
                url:"/123456.do",//发送的地址
                method:"post",//发送的方式
                data:c,//发送的数据
                contentType: false,//发送数据到服务器时所使用的内容类型
                processData:false,//布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
                //发送成功后的回调函数
                success:function(d){
                    alert(d);

                }
            });
        }
    </script>
</head>
<body>
    <div>
        <div id="msg"></div>
        <form id="form" action="123456.do" method="post" enctype="multipart/form-data">
            账号：<input type="text" name="account"><br>
            密码：<input type="password" name="pwd"><br>
            <input type="file" name="f1">
            <input type="submit" value="登录">
        </form>
        <a href="javascript:aaaaa()">提交数据</a>
    </div>
</body>
</html>
