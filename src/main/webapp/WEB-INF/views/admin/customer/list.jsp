<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="assignCustomerAPI" value="/api/customer/staffs"/>
<c:url var="customerAPI" value="/api/customer"/>

<html>
<head>
    <title>Danh sach khach hang</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <ul class="breadcrumbs">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>
                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form modelAttribute="modelSearch" action="${customerListURL}" id="listForm"
                                           method="GET">
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="fullName">Tên khách hàng</label>
                                                    <form:input path="fullName" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="phone">Số điện thoại </label>
                                                    <form:input path="phone" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="email">Email </label>
                                                    <form:input path="email" cssClass="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <label for="staffId">Chọn nhân viên phụ trách</label>
                                                    <form:select path="staffId">
                                                        <form:option value="-1" label="-----Chọn nhân viên-----"/>
                                                        <form:options items="${staffmaps}"/>
                                                    </form:select>
                                                </security:authorize>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-actions left">
                                                <button type="button" class="btn btn-primary" id="btnSearch">Tìm kiếm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div><!-- /.row -->
                </div>
            </div><!-- /.page-content -->
        </div>
        <div>
            <div class="pull-right">
                <a flag="info"
                   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                   data-toggle="tooltip"
                   title="Thêm khách hàng"
                   href='<c:url value='/admin/customer-edit'/>'>
                        <span>
                            <i class="fa fa-plus-circle bigger-110 purple"></i>
                        </span>
                </a>
                <button class="btn btn-white btn-warning btn bold  " data-toggle="tooltip" title="Xóa khách hàng"
                        id="btnDeleteBuilding">
                    <i class="fa fa-trash orange" aria-hidden="true"></i>
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="${customerListURL}" partialList="true" sort="external"
                                   size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"
                                   id="tableList" pagesize="${modelSearch.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column headerClass="text-left" property="fullName" title="Tên khách hàng"/>
                        <display:column headerClass="text-left" property="staffName" title="Nhân viên quản lý"/>
                        <display:column headerClass="text-left" property="phone" title="Di động"/>
                        <display:column headerClass="text-left" property="email" title="Email"/>
                        <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                        <display:column headerClass="text-left" property="createdBy" title="Người nhập"/>
                        <display:column headerClass="text-left" property="createdDate" title="Ngày nhập"/>
                        <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                        <display:column headerClass="col-actions" title="Thao tác">

                            <a href='<c:url value='/admin/customer-edit-${tableList.id}'/>'>
                                <button class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                        title="Cập nhật "
                                >
                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                </button>
                            </a>

                            <button class="btn btn-xs btn-info" data-toggle="tooltip"
                                    title="Giao khách hàng" onclick="assignmentCustomer(${tableList.id})">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </button>

                            <a href="<c:url value='/admin/customer-edit-${tableList.id}?mode=view'><</c:url>">
                                <button class="btn btn-primary " data-toggle="tooltip" title="Xem chi tiet">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-eye" viewBox="0 0 16 16">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                    </svg>
                                    <i class="bi bi-eye"></i>
                                </button>
                            </a>
                        </display:column>
                    </display:table>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.main-content -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>



<!-- assignmentCustomer -->
<div class="modal fade" id="assignmentCustomerModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" id="staffList">
                    <thead>
                    <tr>
                        <th>Chọn nhân viên</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" id="customerId" name="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng lại</button>
            </div>
        </div>
    </div>
</div>
</div> <!--[if !IE]> -->


<script>


    function assignmentCustomer(customerId) {
        openModalAssignmentCustomer();
        $('#customerId').val(customerId);
        console.log($('#customerId').val());
        loadStaff(customerId);
    }

    function loadStaff(buildingId) {
        $.ajax({
            type: "GET",
            url: "${assignCustomerAPI}?customer_id=" + buildingId + "",
            //data: JSON.stringify(data),
            dataType: "json",
            //contentType: 'application/json',
            success: function (response) {
                console.log('success');
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class = "text-center"><input type="checkbox" value=' + item.staffId + ' id ="checkbox_' + item.staffId + '" class = "check-box-element" ' + item.checked + '/></td>';
                    row += '<td class = "text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    }

    function openModalAssignmentCustomer() {
        $('#assignmentCustomerModal').modal();

    }

    $('#btnAssignCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        var staffs = [];
        data['customerId'] = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        assignStaff(data);
    });

    function assignStaff(data) {
        $.ajax({
            type: "POST",
            url: "${assignCustomerAPI}/assignment",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: 'application/json',
            success: function (response) {
                window.location.href = "<c:url value ='/admin/customer-list?message=assign_success'/>"
                console.log('success');
            },
            error: function (response) {
                window.location.href = "<c:url value ='/admin/customer-list?message=assign_success'/>"
                console.log('failed');
                console.log(response);
            }
        });
    }

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        var customerIds = [];
        var customerIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        /*var buildingIds = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();*/
        data['customerIds'] = customerIds;
        deleteBuilding(data);
    });

    function deleteBuilding(data) {
        $.ajax({
            type: "DELETE",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: 'application/json',
            success: function (response) {
                window.location.href = "<c:url value ='/admin/customer-list?message=delete_success'/>"
                //window.location = window.location
                console.log('success');
            },
            error: function (response) {
                window.location.href = "<c:url value ='/admin/customer-list?message=error_system'/>"
                console.log('failed');
                console.log(response);
            }
        });
    }

    $('#btnSearch').click(function (e) {
        e.preventDefault();
        console.log("Button clicked");
        $('#listForm').submit();
    });

</script>

</body>
</html>
