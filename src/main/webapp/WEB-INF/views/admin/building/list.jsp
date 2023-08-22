<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="assignStaffAPI" value="/api/user"/>
<html>
<head>
    <title>Title</title>
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
                                <form:form modelAttribute="modelSearch" action="${buildingListURL}" id="listForm"
                                           method="GET">
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div>
                                                    <label for="name">Tên tòa nhà</label>
                                                    <form:input path="name" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div>
                                                    <label for="floorArea">Diện tích sàn</label>
                                                    <input type="number" id="floorArea" name="floorArea"
                                                           value="${modelSearch.floorArea}" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <label for="ward">Quận </label>
                                                <form:select path="district">
                                                    <form:option value="" label="-----Chọn quận-----"/>
                                                    <form:options items="${districtmaps}"/>
                                                </form:select>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="ward">Phường</label>
                                                    <form:input path="ward" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="street">Đường</label>
                                                    <form:input path="street" cssClass="form-control"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="numberOfBasement">Số tầng hầm</label>
                                                    <input type="number" id="numberOfBasement" name="numberOfBasement"
                                                           value="${modelSearch.numberOfBasement}"
                                                           class="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="direction">Hướng</label>
                                                    <form:input path="direction" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="rank">Hạng</label>
                                                    <form:input path="rank" cssClass="form-control"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="rentAreaFrom">Diện tích từ</label>
                                                    <input type="number" id="rentAreaFrom" class="form-control"
                                                           name="rentAreaFrom" value="${modelSearch.rentAreaFrom}"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="rentAreaTo">Diện tích đến</label>
                                                    <input type="number" id="rentAreaTo" class="form-control"
                                                           name="rentAreaTo" value="${modelSearch.rentAreaTo}"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="rentFrom">Giá thuê từ</label>
                                                    <input type="number" id="rentFrom" class="form-control"
                                                           name="rentFrom" value="${modelSearch.rentFrom}"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div>
                                                    <label for="rentTo">Giá thuê đến</label>
                                                    <input type="number" id="rentTo" class="form-control"
                                                           name="rentTo" value="${modelSearch.rentTo}"/>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="managerName">Tên quản lý</label>
                                                    <form:input path="managerName" cssClass="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div>
                                                    <label for="managerPhone">Số điện thoại quản lý</label>
                                                    <form:input path="managerPhone" cssClass="form-control"/>
                                                </div>
                                            </div>
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
                                            <div class="col-xs-3">
                                                <form:checkboxes path="buildingTypes" items="${typemaps}"
                                                                 delimiter=" "/>
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
                <%--title='<spring:message code="label.user.add"/>'--%>
                   title="Thêm tòa nhà"
                   href='<c:url value='/admin/building-edit'/>'>
                        <span>
                            <i class="fa fa-plus-circle bigger-110 purple"></i>
                        </span>
                </a>
                <%--<a href='<c:url value='/admin/building-edit'/>'>
                    <button class="btn btn-white btn-info btn bold " data-toggle="tooltip" title="Thêm tòa nhà"
                            id="btnAddBuilding">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                    </button>
                </a>--%>

                <button class="btn btn-white btn-warning btn bold  " data-toggle="tooltip" title="Xóa tòa nhà"
                        id="btnDeleteBuilding">
                    <i class="fa fa-trash orange" aria-hidden="true"></i>
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="${buildingListURL}" partialList="true" sort="external"
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
                        <display:column headerClass="text-left" property="name" title="Tên sản phẩm"/>
                        <display:column headerClass="text-left" property="numberOfBasement" title="Số tầng hầm"/>
                        <display:column headerClass="text-left" property="address" title="Địa chỉ"/>
                        <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                        <display:column headerClass="text-left" property="managerPhone" title="Số điện thoại"/>
                        <display:column headerClass="text-left" property="floorArea" title="Diện tích sàn"/>
                        <display:column headerClass="text-left" property="rentPrice" title="Giá thuê"/>
                        <display:column headerClass="text-left" property="serviceFee" title="Phí dịch vụ"/>
                        <display:column headerClass="col-actions" title="Thao tác">

                            <a href='<c:url value='/admin/building-edit-${tableList.id}'/>'>
                                <button class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                        title="Cập nhật "
                                        <%--onclick="editBuilding(${tableList.id})"--%>
                                >
                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                </button>
                                <%--2 controller--%>
                            </a>
                            <%--1controller--%>
                            <%--<a href="<c:url value='/admin/building-edit'><c:param name='id' value='${tableList.id}'/></c:url>">--%>
                            <%--<a href="<c:url value='/admin/building-edit?id=${tableList.id}'><</c:url>">
                                <button class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                        title="Cập nhật "
                                >
                                    <i class="ace-icon fa fa-pencil "></i>
                                </button>
                            </a>--%>


                            <button class="btn btn-xs btn-info" data-toggle="tooltip"
                                    title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </button>

                            <a href="<c:url value='/admin/building-edit-${tableList.id}?mode=view'><</c:url>">
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
</div><!-- /.main-container -->

<!-- basic scripts -->

<!-- assignmentBuilding -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
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
                    <<%--tr>
                        <td><input type="checkbox" value="2" id="checkbox_2"/></td>
                        <td>Nguyễn Văn B</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" value="3" id="checkbox_3"/></td>
                        <td>Nguyễn Văn C</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" value="4" id="checkbox_4"/></td>
                        <td>Nguyễn Văn D</td>
                    </tr>--%>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng lại</button>
            </div>
        </div>
    </div>
</div>
</div> <!--[if !IE]> -->


<script>
    function editBuilding(buildingId) {
        // console.log(buildingId);
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + "",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: 'application/json',
            success: function (response) {
                console.log('success');
            },
            error: function (response) {
                console.log('failed');
                console.log(response);
            }
        });
    }

    function assignmentBuilding(buildingId) {
        openModalAssignmentBuilding();
        $('#buildingId').val(buildingId);
        console.log($('#buildingId').val());
        loadStaff(buildingId);
    }

    function loadStaff(buildingId) {
        $.ajax({
            type: "GET",
            //url: "${buildingAPI}/" + buildingId + "/staffs",
            url: "${assignStaffAPI}/staffs?building_id="+buildingId+"",
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

    function openModalAssignmentBuilding() {
        $('#assignmentBuildingModal').modal();

    }

    $('#btnAssignBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        var staffs = [];
        //staffs.push();
        data['buildingId'] = $('#buildingId').val();
        //$('#staffList').find('tbody input[type=checkbox]')
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        assignStaff(data);
    });

    function assignStaff(data) {
        $.ajax({
            type: "POST",
            url: "${assignStaffAPI}/staffs/assignment",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: 'application/json',
            success: function (response) {
                window.location.href = "<c:url value ='/admin/building-list?message=assign_success'/>"
                console.log('success');
            },
            error: function (response) {
                window.location.href = "<c:url value ='/admin/building-list?message=assign_success'/>"
                console.log('failed');
                console.log(response);
            }
        });
    }

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        var buildingIds = [];
        var buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['buildingIds'] = buildingIds;
        deleteBuilding(data);
    });

    function deleteBuilding(data) {
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: 'application/json',
            success: function (response) {
                window.location.href = "<c:url value ='/admin/building-list?message=delete_success'/>"
                //window.location = window.location
                console.log('success');
            },
            error: function (response) {
                window.location.href = "<c:url value='/admin/building-list?message=error_system'/>";
                console.log('failed');
                console.log(response);
            }
        });
    }

    $('#btnSearch').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });

</script>

</body>
</html>
