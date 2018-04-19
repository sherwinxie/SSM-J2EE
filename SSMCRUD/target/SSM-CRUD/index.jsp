<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>SherwinSSM</title>
    <%--<%--%>
    <%--pageContext.setAttribute("APP_PATH", request.getContextPath());--%>
    <%--%>--%>
    <!-- web路径：
        不以/开始的相对路径，以当前资源的路径为基准，容易出现问题
        以/开始的相对路径，资源以服务器的路径为标准
        比如(http://localhost:3360):需要加上项目名
        http://localhost:3306/crud
     -->
    <!-- Bootstrap -->
    <link
            href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath }/static/js/jquery-1.11.0.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 新增员工的模态框 -->
<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加信息</h4>
            </div>
            <div class="modal-body">
                    <%--表单内容  横排表单 提示占2列 输入占10列--%>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">Name：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="Name">
                                <%--校验信息显示--%>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="empName_email_input" class="col-sm-2 control-label">Email：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="email"  id="empName_email_input" placeholder="email@foxmail.com">
                                <%--校验信息显示--%>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Gender：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_input" value="F"> 女
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Department：</label>
                            <div class="col-sm-4">
                                <%--部门提交部门id即可--%>
                                <select class="form-control" name="dId" id="dept_add_select">

                                </select>
                            </div>
                        </div>


                    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工修改的模态框 -->
<!-- Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >修改信息</h4>
            </div>
            <div class="modal-body">
                <%--表单内容  横排表单 提示占2列 输入占10列--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">Name：</label>
                        <div class="col-sm-10">
                            <%--<input type="text" class="form-control" name="empName" id="empName_update_input" placeholder="Name">--%>
                            <p class="form-control-static" id="empName_update_static"></p>
                            <%--校验信息显示--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empName_email_input" class="col-sm-2 control-label">Email：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email"  id="email_update_input" placeholder="email@foxmail.com">
                            <%--校验信息显示--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender：</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Department：</label>
                        <div class="col-sm-4">
                            <%--部门提交部门id即可--%>
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 搭建显示页面 -->
<div class="container">
    <%--title--%>
    <div class="row">
        <div class="col-lg-12">
            <h1>
                SSM练手项目-CRUD(RESTful)
            </h1>
        </div>
    </div>
    <%--button--%>
    <div class="row">
        <%--占4列 偏移10列--%>
        <div class="col-md-4 col-md-offset-10">
            <button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--显示客户列表--%>
    <div class="row">
        <table class="table table-hover" id="emp_table">
            <thead>
                <tr>

                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            </tbody>

        </table>

        <%--分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6" id="page_info_area">

            </div>
            <%--分页条信息--%>
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>
        <script type="text/javascript">

            var totalRecord,currentNum;
            //1.页面加载完成后，直接发送一个Ajax请求，要到分页数据
            $(function(){
                //去首页
                to_page(1);


            });
            
            function to_page(pn) {
                $.ajax({
                    url:"${pageContext.request.contextPath }/emps",
                    data:"pn="+pn,
                    type:"GET",
                    success:function(result){
//                        console.log(result);
//                        1.解析并显示员工数据
                        build_emps_table(result);
//                        2.解析并显示分页信息
                        biuld_page_info(result);
//                        3.显示分页条
                        build_page_nav(result);


                    }
                });
            }

            function build_emps_table(result){
                //每次请求清空tobdy 防止append追加
                $("#emp_table tbody").empty();
                var emps = result.extend.pageInfo.list;
                $.each(emps,function(index,item){

                    var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var genderTd = $("<td></td>").append(item.gender =='M' ? "男":"女");
                    var emailTd = $("<td></td>").append(item.email);
                    var deptNameTd = $("<td></td>").append(item.department.deptName);
//                  <button class="btn btn-primary btn-sm">
//                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
//                    编辑
//                    </button>
//                    <button class="btn btn-danger btn-sm">
//                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
//                    删除
//                    </button>
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>")).addClass("glyphicon glyphicon-pencil")
                        .append("编辑");
//                  为editBtn添加一个自定义属性 便于员工按id查找
                    editBtn.attr("edit-id", item.empId);
                    var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")).addClass("glyphicon glyphicon-trash")
                        .append("删除");
//                    为delBtn添加一个自定义属性 便于员工按id删除  bug：多一句文字没注释 导致ajax直接无请求
                    delBtn.attr("del-id", item.empId);
                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
//                  每个append方法执行完成后还是返回TR  既多行 appento方法有双引号
                    $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd)
                        .append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emp_table tbody");
//
                });
            }
            //解析显示分页信息
            function biuld_page_info(result){
                $("#page_info_area").empty();

                $("#page_info_area").append("当前第 "+result.extend.pageInfo.pageNum+" 页,总 "+result.extend.pageInfo.pages+" 页,总 "+result.extend.pageInfo.total +" 记录");
                totalRecord = result.extend.pageInfo.total;
                currentNum = result.extend.pageInfo.pageNum;
            }

            //解析显示分页条
            function build_page_nav(result) {
                $("#page_nav_area").empty();
                var ul = $("<ul></ul>").addClass("pagination")
                //构建元素
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("herf","#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                if(result.extend.pageInfo.hasPreviousPage == false){
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                }else {
                    //为元素添加点击翻页的事件
                    firstPageLi.click(function () {
                        to_page(1);
                    });
                    prePageLi.click(function () {
                        to_page(result.extend.pageInfo.pageNum - 1);
                    });
                }



                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("herf","#"));
                if(result.extend.pageInfo.hasNextPage == false){
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                }else {//禁用页时不调用点击事件
                    nextPageLi.click(function () {
                        to_page(result.extend.pageInfo.pageNum + 1);

                    });
                    lastPageLi.click(function () {
                        to_page(result.extend.pageInfo.pages);
                    });
                }


//              添加首页的前一页的提示
                ul.append(firstPageLi).append(prePageLi);
                //遍历页码号12345
                $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                    var numLi = $("<li></li>").append($("<a></a>").append(item));
//                   判断是否是当前页
                    if(result.extend.pageInfo.pageNum == item){
                        numLi.addClass("active");
                    }
                    numLi.click(function () {
                        to_page(item); //点击去当前页码
                    });

                    ul.append(numLi);
                });
                //添加末页
                ul.append(nextPageLi).append(lastPageLi);
//              ur add to <nav>
                var navEle = $("<nav></nav>").append(ul)

                navEle.appendTo("#page_nav_area");
            }
//            点击新增按钮弹出模态框
            $("#emp_add_modal_btn").click(function(){
                reset_form("#empAddModal form");
//              弹出模态框 发送ajax请求查出部门信息 显示下拉列表
                getDepts("#dept_add_select");

                $("#empAddModal").modal({
                    backdrop:"static"
                });

            });
            //清空表单样式以及内容
            function reset_form(ele) {
                $(ele)[0].reset(); //[0]表示jQuery没有reset方法调用js对象的reset
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help_block").text("");
            }


//
            // 查出所有信息并显示在下拉列表中
            function getDepts(ele) {
                //清空所有下拉列表请求
                $(ele).empty();
                $.ajax({
                    url:"${pageContext.request.contextPath }/depts",
                    type:"GET",
                    success:function (result) {
//                        {"code":200,"msg":"处理成功","extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"人事部"},{"deptId":3,"deptName":"测试部"},{"deptId":6,"deptName":"手动阀"},{"deptId":7,"deptName":"市场部"}]}}
//                        console.log(result);
//                        $("#dept_add_select")
                        $.each(result.extend.depts,function () {
//                          function中无参数 默认可以用this 一个this指depts对象 {"deptId":1,"deptName":"开发部"} ;value是option标签的id
                            var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                            optionEle.appendTo(ele);
                        });
                    }
                });
            }
            function validate_add_form() {
//                1.拿到要校验的数据 进行正则表达式校验
                var empName = $("#empName_add_input").val();
                var regName = /(^[A-Za-z0-9]{5,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
                if(!regName.test(empName)){
//                    alert("用户名可以是2-5位汉字或者5-16位英文数字组合")
//                    $("#empName_add_input").parent.addClass("has-error");
//                    $("#empName_add_input").next("span").text("用户名可以是2-5位汉字或者5-16位英文数字组合")
                    show_validate_msg("#empName_add_input","error","用户名可以是2-5位汉字或者5-16位英文数字组合");
                    return false;
                }else {
//                    $("#empName_add_input").parent.addClass("has-success");
//                    $("#empName_add_input").next("span").text("可以使用")
                    show_validate_msg("#empName_add_input","success","");
                };
//                2.获取email校验
                var email = $("#empName_email_input").val();
                var regEmail = /^[a-zA-Z_]{1,}[0-9]{0,}@(([a-zA-z0-9]-*){1,}\.){1,3}[a-zA-z\-]{1,}$/;
                if(!regEmail.test(email)){
//                    alert("邮箱格式不正确@")
//                    $("#empName_email_input").parent.addClass("has-error");
//                    $("#empName_email_input").next("span").text("@邮箱格式不正确")
                    show_validate_msg("#empName_email_input","error","@邮箱格式不正确");
                    return false;
                }else {
//                    $("#empName_email_input").parent.addClass("has-success");
//                    $("#empName_email_input").next("span").text("可以使用")
                    show_validate_msg("#empName_email_input","success","");
                };
                return true;
            }

            //正则校验，代码抽取
            function show_validate_msg(ele, status, msg) {
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if ("success" == status) {
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                } else if ("error" == status) {
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }
//          校验用户名是否可用
            $("#empName_add_input").change(function () {
                var empName=this.value;//当前用户名
                $.ajax({
                    url:"${pageContext.request.contextPath }/checkuser",
                    data:"empName="+empName,
                    type:"POST",
                    success:function (result) {
                        if(result.code == 200){
                            show_validate_msg("#empName_add_input","success","用户名可以使用");
                            $("#emp_save_btn").attr("ajax-va","success")
                        }else {
                            show_validate_msg("#empName_add_input","error",result.extend.va_msg);//用户名已存在
                            $("#emp_save_btn").attr("ajax-va","error")
                        }
                    }
                });
            });

            //点击保存，保存员工数据
            $("#emp_save_btn").click(function () {
//                1模态框中对表单数据进行服务器的保存
//                1.1先对要提交得数据进行校验  用户名和邮箱等  校验成功后再发ajax请求保存
                if(!validate_add_form()){
                    return false;
                };
//                1.2判断ajax校验用户名是否成功 成功才可以保存
                if($(this).attr("ajax-va")=="error"){
                    return false;
                }

//                2发送ajax请求保存员工  表格序列化的数据即form post提交得数据
//                alert($("#empAddModal form").serialize());
                $.ajax({
                    url:"${pageContext.request.contextPath }/emp",
                    type:"POST",
                    data:$("#empAddModal form").serialize(),
                    success:function (result) {

//                        alert(result.msg);
//                        1.员工保存data数据成功 关闭模态框
                        if (result.code == 200){//代表JSR303校验成功
                            $("#empAddModal").modal('hide');
//                        2.来到最后一页查看刚才保存的数据 发送ajax请求显示最后一页数据即可 总记录数肯定比总页码大
                            to_page(totalRecord);
                        }else {
//                            console.log(result);
//                            有哪个字段的错误信息就显示哪个字段的  前端校验被绕过时 显示后端校验信息
                            if(undefined !=result.extend.errorFields.email){
                                //显示后端邮箱错误信息
                                show_validate_msg("#empName_email_input","error",result.extend.errorFields.email);
                            }
                            if(undefined !=result.extend.errorFields.empName){
                                //显示后端名字错误信息
                                show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);

                            }
                        }
                    }
                });
            });


            //          新版jQuery没有live 用on  在创建按钮后绑定事件用live或者on
            $(document).on("click",".edit_btn",function(){

//                1.查询员工id 并显示   ajax请求

                getEmp($(this).attr("edit-id"));
                //2. 模态框 发送ajax请求查出部门信息 显示下拉列表
                getDepts("#empUpdateModal select");
                //3.把员工id传递给模态框id按钮
                $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));//edit-id: id
                $("#empUpdateModal").modal({
                    backdrop:"static"
                });
            });

            //单个删除  新版jQuery没有live 用on  在创建按钮后绑定事件用live或者on
            $(document).on("click",".delete_btn",function(){
                //1.弹出是否确认删除对话框 获取td:eq(2)员工名  前端调试查询父元素下的td
                var empName = $(this).parents("tr").find("td:eq(2)").text();
                var empId = $(this).attr("del-id");
                if (confirm("确定要删除【"+empName+"】吗？")){
                    $.ajax({
                        url:"${pageContext.request.contextPath }/emp/"+empId,
                        type:"DELETE",
                        success:function (result) {
//                            alert(result.msg);

                            to_page(currentNum);
                        }

                    });

                }
            });



            function getEmp(id) {
                $.ajax({
                    url:"${pageContext.request.contextPath }/emp/"+id,
                    type:"GET",
                    success:function (result) {
//                        console.log(result);
                        var empData = result.extend.emp;
                        $("#empName_update_static").text(empData.empName);
                        $("#email_update_input").val(empData.email);
                        //type=radio
                        $("#empUpdateModal input[name=gender]").val([ empData.gender ]);
                        $("#empUpdateModal select").val([ empData.dId ]);
                    }
                });
            }
            
            //点击更新按钮事件
            $("#emp_update_btn").click(function () {
                //验证邮箱是否合法
                var email = $("#email_update_input").val();
                var regEmail = /^[a-zA-Z_]{1,}[0-9]{0,}@(([a-zA-z0-9]-*){1,}\.){1,3}[a-zA-z\-]{1,}$/;
                if(!regEmail.test(email)){
                    show_validate_msg("#email_update_input","error","@邮箱格式不正确");
                    return false;
                }else {
                    show_validate_msg("#email_update_input","success","");
                };
                //发送ajax请求保存更新的员工数据
                $.ajax({
                    url:"${pageContext.request.contextPath }/emp/"+$(this).attr("edit-id"),
                    type:"PUT",
                    data:$("#empUpdateModal form").serialize(),
                    success:function (result) {
//                        alert(result.msg);
                        $("#empUpdateModal").modal("hide");
                        to_page(currentNum);
                    }
                });

            });
            
            $("#check_all").click(function () {
                //attr 和prop 区别  HTML原生的用prop

                $(".check_item").prop("checked",$(this).prop("checked"));
            });

            //check_item
            $(document).on("click",".check_item",function () {
                var flag = $(".check_item:checked").length == $(".check_item").length;
                $("#check_all").prop("checked",flag);
            });

            //批量删除
            $("#emp_delete_all_btn").click(function () {
                //选中的checkbox 获取它的员工名
                var empNames ="";
                var del_id_str ="";
                $.each($(".check_item:checked"),function () {
                   empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                   //组装员工ids的字符串
                    del_id_str += $(this).parents("tr").find("td:eq(1)").text()+"-"; //td:eq(1)表示id
                });
                //去除empName最后的逗号 和del_id_str的-号
                empNames = empNames.substring(0, empNames.length-1);
                del_ids_str = del_id_str.substring(0, empNames.length-1);
                if(confirm("确认删除【"+empNames+"】吗？")){
//                    发送ajax请求来删除员工
                    $.ajax({
                        url:"${pageContext.request.contextPath }/emp/"+del_ids_str,
                        type:"DELETE",
                        success:function (result) {
                            alert(result.msg);
                            to_page(currentNum);
                        }
                    });


                }
            });
        </script>
</body>
</html>
