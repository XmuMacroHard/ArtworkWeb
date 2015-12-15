<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
    <title></title>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.leanModal.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#aOpen').leanModal({ top: 100, closeButton: ".modal_close" });
            $('a[rel*=leanModal]').leanModal({ top: 100, closeButton: ".modal_close" });
        });
    </script>
    <style type="text/css">
        #lean_overlay { position: fixed; z-index: 100; top: 0px; left: 0px; height: 100%; width: 100%; background: #000; display: none; }
        #OpenWindow { background: none repeat scroll 0 0 #FFFFFF; border-radius: 5px 5px 5px 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.7); display: none; padding-bottom: 2px; width: 404px; z-index: 11000; left: 50%; margin-left: -202px; opacity: 1; position: fixed; top: 200px; }
        .modal_close { background: url("Image/modal_close.png") repeat scroll 0 0 transparent; display: block; height: 14px; position: absolute; right: 12px; top: 12px; width: 14px; z-index: 2; }
        body { font-size: 13px; }
        #OpenWindow .txt-fld { border-bottom: 1px solid #EEEEEE; padding: 14px 20px; position: relative; text-align: right; width: 364px; }
        #OpenWindow .txt-fld input { background: none repeat scroll 0 0 #F7F7F7; border-color: #CCCCCC #E7E6E6 #E7E6E6 #CCCCCC; border-radius: 4px 4px 4px 4px; border-style: solid; border-width: 1px; color: #222222; font-family: "Helvetica Neue"; font-size: 1.2em; outline: medium none; padding: 8px; width: 244px; }
        #OpenWindow .txt-fld input.good_input { background: url("Image/good.png") no-repeat scroll 236px center #DEF5E1; }
        #OpenWindow .btn-fld { overflow: hidden; padding: 12px 20px 12px 130px; width: 254px; }
        button { background: none repeat scroll 0 0 #3F9D4A; border: medium none; border-radius: 4px 4px 4px 4px; color: #FFFFFF; float: right; font-family: Verdana; font-size: 13px; font-weight: bold; overflow: visible; padding: 7px 10px; text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4); width: auto; }
    </style>
</head>
<body>
    <div style="text-align: center">
        <a id="aOpen" href="javascript:void(0)" rel="leanModal" onclick="document.getElementById('OpenWindow').scrollIntoView();">打开登陆窗口</a>
    </div>
    <div id="OpenWindow">
        <div id="signup-ct">
            <form action="">
            <div class="txt-fld">
                <label for="">
                    Email address</label>
                <input type="text" name="" id="" />
            </div>
            <div class="txt-fld">
                <label for="">
                    Password</label>
                <input type="text" name="" id="" />
            </div>
            <div class="btn-fld">
                <button type="submit">
                    Sign Up »</button>
            </div>
            </form>
        </div>
    </div>
</body>
</html>

