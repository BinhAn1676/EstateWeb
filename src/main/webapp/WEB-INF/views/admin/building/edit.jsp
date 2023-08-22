<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var = "buildingAPI" value ="/api/building"/>
<c:url var ="buildingEditURL" value="/admin/building-edit"/>
<html>
<head>
    <title>Chinh sua toa nha</title>
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
                    <form:form modelAttribute="modelAdd" action="${buildingEditURL}" id="formEdit" method="POST">
                    <%--<form class="form-horizontal" role="form" id="formEdit">--%>
                        <input type="hidden" id="id" name="id" value="${modelAdd.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="name"> Tên tòa nhà</label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="name" class="form-control" name="name" value=""/>--%>
                                <form:input path="name" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="district" class="col-sm-3 control-label">Quận </label>
                            <form:select path="district">
                                <form:option value ="-1" label="-----Chọn quận-----"/>
                                <form:options items="${districtmaps}" />
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="ward"> Phường </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="ward" class="form-control" name="ward" value=""/>--%>
                                <form:input path="ward" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="street"> Đường </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="street" class="form-control" name="street" value=""/>--%>
                                <form:input path="street" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="structure"> Kết cấu</label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="structure" class="form-control" name="structure" />--%>
                                <form:input path="structure" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="numberOfBasement"> Số
                                tầng hầm </label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control"
                                       name="numberOfBasement" value="${modelAdd.numberOfBasement}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="floorArea"> Diện tích
                                sàn </label>
                            <div class="col-sm-9">
                                <input type="number" id="floorArea" class="form-control" name="floorArea"
                                       value="${modelAdd.floorArea}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="direction"> Hướng
                            </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="direction" class="form-control" name="direction" />--%>
                                <form:input path="direction" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rank"> Hạng </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="rank" class="form-control" name="rank" />--%>
                                <form:input path="rank" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentArea"> Diện tích thuê </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="rentArea" class="form-control" name="rentArea" />--%>
                                <form:input path="rentArea" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentAreaDescription"> Mô
                                tả diện tích </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="rentAreaDescription" class="form-control"--%>
                                       <%--name="rentAreaDescription" />--%>
                                <form:input path="rentAreaDescription" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentPrice"> Giá thuê
                            </label>
                            <div class="col-sm-9">
                                <input type="number" id="rentPrice" class="form-control" name="rentPrice"
                                       value="${modelAdd.rentPrice}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentPriceDescription">
                                Mô tả giá </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="rentPriceDescription" class="form-control"--%>
                                       <%--name="rentPriceDescription" />--%>
                                <form:input path="rentPriceDescription" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="serviceFee"> Phí dịch vụ
                            </label>
                            <div class="col-sm-9">
                                <input type="number" id="serviceFee" class="form-control" name="serviceFee"
                                       value="${modelAdd.servicefee}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="carFee"> Phí ô tô
                            </label>
                            <div class="col-sm-9">
                                <input type="number" id="carFee" class="form-control" name="carFee"
                                       value="${modelAdd.carFee}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="motoFee"> Phí mô tô
                            </label>
                            <div class="col-sm-9">
                                <input type="number" id="motoFee" class="form-control"
                                       name="motoFee" value="${modelAdd.motoFee}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="overtimeFee"> Phí ngoài
                                giờ </label>
                            <div class="col-sm-9">
                                <input type="number" id="overtimeFee" class="form-control" name="overtimeFee"
                                       value="${modelAdd.overtimeFee}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="electricityFee"> Tiền
                                điện </label>
                            <div class="col-sm-9">
                                <input type="number" id="electricityFee" class="form-control"
                                       name="electricityFee" value="${modelAdd.electricityFee}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="deposit"> Đặt cọc </label>
                            <div class="col-sm-9">
                                <input type="number" id="deposit" class="form-control"
                                       name="deposit" value="${modelAdd.deposit}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="payment"> Thanh toán </label>
                            <div class="col-sm-9">
                                <input type="number" id="payment" class="form-control"
                                       name="payment" value="${modelAdd.payment}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="rentTime"> Thời gian thuê </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="rentTime" class="form-control"--%>
                                       <%--name="rentTime" value="${modelAdd.rentTime}"/>--%>
                                <form:input path="rentTime" cssClass="form-control"/>
                            </div>
                        </div><div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="decorationTime"> Thời gian trang trí </label>
                        <div class="col-sm-9">
                            <%--<input type="text" id="decorationTime" class="form-control"--%>
                                   <%--name="decorationTime" />--%>
                                <form:input path="decorationTime" cssClass="form-control"/>
                        </div>
                    </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="managerName"> Tên quản lý </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="managerName" class="form-control"--%>
                                       <%--name="managerName" />--%>
                                <form:input path="managerName" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="managerPhone"> Số điện thoại quản lý </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="managerPhone" class="form-control"--%>
                                       <%--name="managerPhone" />--%>
                                <form:input path="managerPhone" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="brokerageFee"> Phí môi giới </label>
                            <div class="col-sm-9">
                                <input type="number" id="brokerageFee" class="form-control"
                                       name="brokerageFee" value="${modelAdd.brokeRageFee}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="buildingTypes"> Loại tòa nhà </label>
                                <form:checkboxes path="buildingTypes" items="${typemaps}" delimiter = " " />
                        </div>
                        <%--<div class = "form-group">
                            <form>
                                <div class="checkbox">
                                    <label><input type="checkbox" value="">Nội thất</label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" value="">Nguyên căn</label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" value="">Tầng trệt</label>
                                </div>
                            </form>
                        </div>--%>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="note"> Ghi chú </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="note" class="form-control" name="note" />--%>
                                <form:input path="note" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="linkOfBuilding"> Link sản phẩm </label>
                            <div class="col-sm-9">
                                <%--<input type="text" id="linkBuilding" class="form-control" name="linkBuilding" />--%>
                                <form:input path="linkOfBuilding" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                            <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                            <div class="col-sm-9">
                                <c:if test="${not empty modelAdd.image}">
                                    <c:set var="imagePath" value="/repository${modelAdd.image}"/>
                                    <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                </c:if>
                                <c:if test="${empty modelAdd.image}">
                                    <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                </c:if>
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
                                        <button type="button" class="btn btn-primary" id="btnAddBuilding"
                                                onclick="addBuilding(${formEdit.id})">Thêm tòa nhà</button>
                                    </c:otherwise>
                                </c:choose>
                                <%--<button type="button" class="btn btn-primary" id="btnAddBuilding"
                                        onclick="addBuilding(${formEdit.id})">Thêm tòa nhà</button>--%>
                                <a href='<c:url value='/admin/building-list'/>'>
                                    <button type="button" class="btn btn-primary">Hủy</button>
                                </a>
                            </div>
                        </div>
                    <%--</form>--%>
                    </form:form>
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
    /*
    function addNewBuilding(buildingId){
        //e.preventDefault();
        var data = {};
        var buildingTypes = [];
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, v) {
            if (v.name == 'buildingTypes') {
                buildingTypes.push(v.value)
            } else {
                data["" + v.name + ""] = v.value;
            }
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        });
        data['buildingTypes'] = buildingTypes;
        var buildingId = data['id'];
        $('#loading_image').show();
        $.ajax({
            type: 'POST',
            url: '${buildingAPI}',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: 'application/json',
            success: function (response) {
                window.location.href = "/admin/building-list";
                $('#loading_image').hide();
            },
            error: function (response) {
                $('#loading_image').hide();
                var redirectUrl = (null === buildingId) ? "" : "/admin/building-edit-" + {buildingId};
                showMessageConfirmation("Thất bại", "Đã có lỗi xảy ra! Vui lòng kiểm tra lại.", "warning", redirectUrl);
            }
        });
    }*/

    $('#btnAddBuilding').click(function (e) {
        e.preventDefault();
        const hiddenInput = document.getElementById("id");
        const hiddenId = hiddenInput.value;
        console.log(hiddenId);
        var data = {};
        var buildingTypes = [];
        var formData = $('#formEdit').serializeArray();
        $.each(formData, function (index, v) {
            if (v.name == 'buildingTypes') {
                buildingTypes.push(v.value)
            } else {
                data["" + v.name + ""] = v.value;
            }
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        });
        data['buildingTypes'] = buildingTypes;
        var buildingId = data['id'];
        $('#loading_image').show();
        if(hiddenId==null || hiddenId == ""){
            $.ajax({
                type: 'POST',
                url: '${buildingAPI}',
                data: JSON.stringify(data),
                dataType: "json",
                contentType: 'application/json',
                success: function (response) {
                    window.location.href = "/admin/building-list";
                    $('#loading_image').hide();
                },
                error: function (response) {
                    $('#loading_image').hide();
                    var redirectUrl = (null === buildingId) ? "" : "/admin/building-edit-" + {buildingId};
                    showMessageConfirmation("Thất bại", "Đã có lỗi xảy ra! Vui lòng kiểm tra lại.", "warning", redirectUrl);
                }
            });
        }else{
            $.ajax({
                type: 'PUT',
                url: "${buildingAPI}/"+hiddenId+"",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: 'application/json',
                success: function (response) {
                    window.location.href = "/admin/building-list";
                    $('#loading_image').hide();
                },
                error: function (response) {
                    $('#loading_image').hide();
                    var redirectUrl = (null === buildingId) ? "" : "/admin/building-edit-" + {buildingId};
                    showMessageConfirmation("Thất bại", "Đã có lỗi xảy ra! Vui lòng kiểm tra lại.", "warning", redirectUrl);
                }
            });
        }

    })

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
