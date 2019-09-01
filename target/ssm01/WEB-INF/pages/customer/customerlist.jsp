<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/22
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="/WEB-INF/pages/common/head.jsp"%>
<script type="text/javascript">
    /*存入给后面的外置js文件取值*/
    /*总的记录数*/
    var totalCount =${totalCount};
    /*当前页面*/
    var cp =${currentPage};
    var path="${pageContext.request.contextPath}";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/customer/D.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/customer/check.js"></script>
<c:set var="cashDate" value="${cashDate}"/>
<c:if test="${cashDate==null}">
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/customer/rollpage.js"></script>
</c:if>
<c:if test="${cashDate!=null}">
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/customer/queryRollpage.js"></script>
</c:if>
<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <div>
                                <label>你现在的位置是：
                                    <a href="#">会员管理</a></label>
                            </div>
                        </div>
                    </div>
                </div><!-- /# column -->
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <div id="div1"></div>
                            </ol>
                        </div>
                    </div>
                </div><!-- /# column -->
            </div><!-- /# row -->
            <div class="main-content">
                <div>
                    <form  action="${pageContext.request.contextPath}/customer/customerQuery">
                        <label>会员卡姓名:
                            <input type="text" id="customerName" name="customerName" placeholder="会员姓名"  value="${customerName}"></label>
                        <input type="submit" id="queryButton" value="查询">
                    </form>
                    <p><a href = "JavaScript:void(0)" onclick = "openDialog()">添加会员信息</a></p>
                </div>
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>会员编码</th>
                        <th>会员姓名</th>
                        <th>联系电话</th>
                        <th>办理人</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="list">
                    <c:forEach items="${customers}" var="c">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.customerCode}</td>
                            <td>${c.customerName}</td>
                            <td>${c.customerPhone}</td>
                            <td>${c.staff.staffName}</td>
                            <td>
                                <a href = "JavaScript:void(0)" onclick = "customerCheck(${c.id});openEditDialog()"><i class="ti-pencil"></i></a>
                                <a href="${pageContext.request.contextPath}/customer/recycle?id=${c.id}" onclick = "delete_confirm()"><i class="ti-close"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%@include file="/WEB-INF/pages/common/rollpage.jsp" %>
        </div><!-- /# container-fluid -->
    </div><!-- /# main -->
</div><!-- /# content wrap -->
<%@include file="/WEB-INF/pages/customer/customeradd.jsp" %>
<%@include file="/WEB-INF/pages/customer/customercheck.jsp" %>
<%@include file="/WEB-INF/pages/customer/customeredit.jsp" %>
<%@include file="/WEB-INF/pages/common/foot.jsp" %>
