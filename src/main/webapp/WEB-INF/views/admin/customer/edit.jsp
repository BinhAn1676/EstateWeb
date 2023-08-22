<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var = "customerAPI" value ="/api/customer"/>
<c:url var = "transactionAPI" value ="/api/transaction"/>
<c:url var ="customerEditURL" value="/admin/customer-edit"/>
<html>
<head>
    <title>Chỉnh sửa người dùng</title>

</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <form:form modelAttribute="modelAdd" action="${customerEditURL}" id="formEdit" method="POST">
                        <input type="hidden" id="id" name="id" value="${modelAdd.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="fullName"> Họ và tên</label>
                            <div class="col-sm-9">
                                <form:input path="fullName" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="phone"> Số điện thoại </label>
                            <div class="col-sm-9">
                                <form:input path="phone" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="Email"> Email </label>
                            <div class="col-sm-9">
                                <form:input path="email" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="companyName"> Tên Công Ty</label>
                            <div class="col-sm-9">
                                <form:input path="companyName" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="demand"> Nhu Cầu </label>
                            <div class="col-sm-9">
                                <form:input path="demand" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="note"> Ghi chú </label>
                            <div class="col-sm-9">
                                <form:input path="note" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <%String mode = request.getParameter("mode");%>
                                <c:choose>
                                    <c:when test="${param.mode eq 'view'}">
                                        <!-- Do not show the button in view mode -->
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Show the button in other modes (e.g., list, edit, or add) -->
                                        <button type="button" class="btn btn-primary" id="btnAddCustomer"
                                                onclick="addCustomer(${formEdit.id})">Thêm Khách Hàng</button>
                                    </c:otherwise>
                                </c:choose>
                                <a href='<c:url value='/admin/customer-list'/>'>
                                    <button type="button" class="btn btn-primary">Hủy</button>
                                </a>
                            </div>
                        </div>
                    </form:form>
                    <%--TRANSACTION--%>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-12">
                                <div id="transactions-container">
                                    <c:forEach items="${enumTransactions}" var="entry">
                                        <div class="table-container" data-enum-type="${entry.key}">
                                            <h2>${entry.key}
                                                <%String mode = request.getParameter("mode");%>
                                                <c:choose>
                                                    <c:when test="${param.mode eq 'view'}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="add-transaction-button" data-toggle="tooltip"
                                                                title="Thêm Giao dịch"
                                                                id="btnAddTransaction">
                                                            <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h2>
                                            <table id="transactionList" class="table table-striped table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th>Date</th>
                                                    <th>Note</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${entry.value}" var="transaction">
                                                    <tr>
                                                        <td>${transaction.date}</td>
                                                        <td>${transaction.note}</td>
                                                    </tr>
                                                </c:forEach>
                                                <tr class="transaction-row2" >
                                                    <td></td>
                                                    <td>
                                                        <input type="text" class="note-input" name="transactionNotes" placeholder="Add Note">
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <br>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<script>

    var imageBase64 = '';
    var imageName = '';
    function disableAddButton() {
        document.getElementById("btnAddBuilding").disabled = true;
    }
    function disableAddTransactionButton() {
        document.getElementById("btnAddTransaction").disabled = true;
    }

    $(document).ready(function() {
        $(document).on('click', '.add-transaction-button', function() {
            //lấy thông tin từ ô nhập input
            var $transactionContainer = $(this).closest(".table-container");
            var enumType = $transactionContainer.data("enum-type");
            var note = $transactionContainer.find(".note-input").val();
            //lấy id tòa nhà
            const hiddenInput = document.getElementById("id");
            const hiddenId = hiddenInput.value;

            /*var transactionData = {
                enumType: enumType,
                note: note
            };*/
            var transactionData = {
                type: enumType,
                note: note
            };

            $.ajax({
                url: "${transactionAPI}?customer_id="+hiddenId+"",
                method: "POST",
                data: JSON.stringify(transactionData),
                contentType: "application/json",
                success: function(response) {
                   /* window.location.href = "/admin/customer-edit-" + {hiddenId};*/
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    window.location.href = "/admin/customer-list";
                }
            });
        });
    });

    /*$('#btnAddTransaction').click(function (e){
        var $transactionContainer = $(this).closest(".table-container");
        var enumType = $transactionContainer.data("enum-type");
        var note = $transactionContainer.find(".note-input").val();

        e.preventDefault();
        const hiddenInput = document.getElementById("id");
        const hiddenId = hiddenInput.value;

        var transactionData = {
            enumType: enumType,
            note: note
        };

        $.ajax({
            url: "${transactionAPI}?customer_id="+hiddenId+"",
            method: "POST",
            data: JSON.stringify(transactionData),
            contentType: "application/json",
            success: function(response) {
                window.location.href = "/admin/customer-edit-" + {hiddenId};

            },
            error: function(xhr, status, error) {
                window.location.href = "/admin/customer-list";
            }
        });
    })*/


    $('#btnAddCustomer').click(function (e) {
        e.preventDefault();
        const hiddenInput = document.getElementById("id");
        const hiddenId = hiddenInput.value;
        console.log(hiddenId);
        var data = {};
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, v) {
            data["" + v.name + ""] = v.value;
        });
        var customerId = data['id'];
        if(hiddenId==null || hiddenId == ""){
            $.ajax({
                type: 'POST',
                url: '${customerAPI}',
                data: JSON.stringify(data),
                dataType: "json",
                contentType: 'application/json',
                success: function (response) {
                    window.location.href = "/admin/customer-list";
                },
                error: function (response) {
                    var redirectUrl = (null === customerId) ? "" : "/admin/customer-edit-" + {customerId};
                    showMessageConfirmation("Thất bại", "Đã có lỗi xảy ra! Vui lòng kiểm tra lại.", "warning", redirectUrl);
                }
            });
        }else{
            $.ajax({
                type: 'PUT',
                url: "${customerAPI}/"+hiddenId+"",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: 'application/json',
                success: function (response) {
                    window.location.href = "/admin/customer-list";
                },
                error: function (response) {
                    var redirectUrl = (null === customerId) ? "" : "/admin/customer-edit-" + {customerId};
                    showMessageConfirmation("Thất bại", "Đã có lỗi xảy ra! Vui lòng kiểm tra lại.", "warning", redirectUrl);
                }
            });
        }
    })

</script>
</body>
</html>
