<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'submitInfor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <% 
	HashMap<String, String> colums = new HashMap<String, String>();
	colums.put("painting","绘画专栏");
	colums.put("calligraphy","书法专栏");
	colums.put("sculpture","雕刻专栏");
	colums.put("contemporary","当代工艺");
	request.setAttribute("colums",colums);
	
	HashMap<String, String> locations = new HashMap<String, String>();
	locations.put("info_location1","资讯栏一");
	locations.put("info_location2","资讯栏二");
	request.setAttribute("locations",locations);
	
	HashMap<Integer, String> poses1 = new HashMap<Integer, String>();
	poses1.put(1, "1");
	poses1.put(2, "2");
	poses1.put(3, "3");
	poses1.put(4, "4");
	request.setAttribute("poses1",poses1);
	
	HashMap<Integer, String> poses2 = new HashMap<Integer, String>();
	poses2.put(1, "1");
	poses2.put(2, "2");
	poses2.put(3, "3");
	request.setAttribute("poses2",poses2);
	
%>
  <div id="registration-form">
                                                        <form action="submitInfo" method="POST" enctype="multipart/form-data">
                                                            <div class="form-title">
                                                                	资讯
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail2">标题</label>
                                                                        <span class="input-icon icon-right">
                                                                            <s:textfield cssClass="form-control" name="information.title"/>
                                                                            <i class="fa fa-envelope palegreen"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                 <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                       <!--  <label for="exampleInputEmail2">上传图片</label> -->
                                                                        <span class="input-icon icon-right">
                                                                            <s:file name="pic" cssClass="form-control" label="uploadfile"/>
                                                                        </span>
                                                                    </div>
                                                                </div> 
                                                            </div>
                                                             <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail2">开始时间</label>
                                                                        <div class="input-group">
                                                							<!-- <input type="date" class="form-control date-picker" id="id-date-picker-1" name="information.startTime"/> -->
                                                							<input class="form-control" id="id-date-picker-1" type="date" data-date-format="yyyy-mm-dd" name="information.startTime"/>
                                                							<span class="input-group-addon">
                                                    							<i class="fa fa-calendar"></i>
                                                							</span>
                                                						</div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail2">结束时间</label>
                                                                        <div class="input-group">
                                                							<!-- <input type="date" class="form-control" id="id-date-picker-1" name="information.endTime"/> --> 
                                                							<input class="form-control" id="id-date-picker-1" type="date" data-date-format="yyyy-mm-dd" name="information.endTime"/> 
                                                							<span class="input-group-addon">
                                                    							<i class="fa fa-calendar"></i>
                                                							</span>
                                                						</div>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail2">版块位置</label>
                                                                        <span class="input-icon icon-right">
                                                                            <s:select  style="width:100%;" name="datePos.location" list="#request.locations" listKey="key" listValue="value"/>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail2">板内序号</label>
                                                                        <span class="input-icon icon-right">
                                                                            <s:select  style="width:100%;" name="datePos.pos" list="#request.poses1" listKey="key" listValue="value"/>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputName2">栏目</label>
                                            							<s:select style="width:100%;" name="datePos.colum" list="#request.colums" listKey="key" listValue="value"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputName2">价格</label>
                                                                        <span class="input-icon icon-right">
                                                                            <s:textfield cssClass="form-control" name="information.expense"/>
                                                                            <i class="fa fa-calendar blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail2">资讯内容</label>                                                                       	
                                                                         <span class="input-icon icon-right">
                                                                            <textarea rows="10" width="100%" class = "form-control" name="information.content"></textarea>
                                                                        </span>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <button type="submit" class="btn btn-danger">提交</button>
                                                        </form>
                                                    </div>
                                                    
                                                    <!--Basic Scripts-->
	<script src="assets/js/jquery-2.0.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script> 

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>

    <!--Page Related Scripts-->
    <!--Jquery Select2-->
    <script src="assets/js/select2/select2.js"></script>
    <!--Bootstrap Tags Input-->
    <script src="assets/js/tagsinput/bootstrap-tagsinput.js"></script>

    <!--Bootstrap Date Picker-->
    <script src="assets/js/datetime/bootstrap-datepicker.js"></script>
    
    <!--Google Analytics::Demo Only-->
    <script>
    	//--Jquery Select2--
        $("#e1").select2();
        $("#e2").select2({
            placeholder: "Select a State",
            allowClear: true
        });

        //--Bootstrap Date Picker--
        $('.date-picker').datepicker();
    
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-52103994-1', 'auto');
        ga('send', 'pageview');

    </script>
	  
  </body>
</html>
