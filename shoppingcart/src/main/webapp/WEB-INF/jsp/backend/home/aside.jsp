<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<!--aside-->
<div class="col-md-3" id="aside">
    <div class="card">
        <div class="card-header">
            <a class="card-link" data-toggle="collapse" href="#menu_account">
                Account
            </a>
        </div>
        <div id="menu_account" class="collapse show" data-parent="#aside">
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">�|���C��</li>
                    <li class="list-group-item">�b���v���ק�</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-header">
            <a class="card-link" data-toggle="collapse" href="#menu_product">
                Product
            </a>
        </div>
        <div id="menu_product" class="collapse" data-parent="#aside">
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">��@�ӫ~�W�U�[</li>
                    <li class="list-group-item">�ӫ~�C��</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-header">
            <a class="card-link" data-toggle="collapse" href="#menu_orders">
                Oreders
            </a>
        </div>
        <div id="menu_orders" class="collapse" data-parent="#aside">
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">��@�q��d��</li>
                    <li class="list-group-item">�q��C��</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-header">
            <a class="card-link" data-toggle="collapse" href="#menu_banner">
                Banner Managerment
            </a>
        </div>
        <div id="menu_banner" class="collapse" data-parent="#aside">
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" id="banner">Banner�C��</li>
                </ul>
            </div>
        </div>
    </div>

</div>
</body>
</html>