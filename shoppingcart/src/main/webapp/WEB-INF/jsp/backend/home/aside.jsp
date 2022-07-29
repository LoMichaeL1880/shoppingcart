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
                    <li class="list-group-item mousehand" id="memberlist">會員列表</li>
                    <li class="list-group-item mousehand" id="memberupdate">帳號權限修改</li>
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
                    <li class="list-group-item mousehand" id="addp">單一商品上架</li>
                    <li class="list-group-item mousehand" id="sellingproduct">販售中商品</li>
                    <li class="list-group-item mousehand" id="stopsellingproduct">已下架商品</li>
                    <li class="list-group-item mousehand" id="productlist">所有商品</li>
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
                    <li class="list-group-item mousehand" id="order">單一訂單查詢</li>
                    <li class="list-group-item mousehand" id="orderlist">訂單列表</li>
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
                    <li class="list-group-item mousehand" id="bannerlist">Banner列表</li>
                    <li class="list-group-item mousehand" id="bannerinsert">新增Banner</li>
                </ul>
            </div>
        </div>
    </div>

</div>
</body>
</html>