<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>员工列表</title>
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
<div class="container">
    <%--title--%>
    <div class="row">
        <div class="col-lg-12">
            <h1>
                客户信息管理系统
            </h1>
        </div>
    </div>
    <%--button--%>
    <div class="row">
        <%--占4列 偏移10列--%>
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
        <%--显示客户列表--%>
        <div class="row">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list }" var="emp">
                <tr>
                    <th>${emp.empId }</th>
                    <th>${emp.empName }</th>
                    <th>${emp.gender=="M"?"男":"女" }</th>
                    <th>${emp.email }</th>
                    <th>${emp.department.deptName }</th>
                    <th>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                    </th>
                </tr>
                </c:forEach>
            </table>

        <%--分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前第 ${pageInfo.pageNum } 页,总 ${pageInfo.pages } 页,总 ${pageInfo.total } 记录
            </div>
            <%--分页条信息--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath }/emps?pn=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage }">
                            <li>
                                    <%--下一页为当前页码加-1直到无前页--%>
                                <a href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum }">
                                <%--当前页码加高亮状态不可点击--%>
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum }">
                                <%--当前页码请求--%>
                                <li><a href="${pageContext.request.contextPath }/emps?pn=${page_Num }">${page_Num }</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage }">
                            <li>
                                <%--下一页为当前页码加1--%>
                                <a href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pages }">末页</a></li>
                    </ul>

                </nav>
            </div>
        </div>
</div>
</body>
</html>
