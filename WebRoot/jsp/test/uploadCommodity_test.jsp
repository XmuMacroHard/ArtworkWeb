<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server"> 
<title>upload</title> 
<link href="upload.css" rel="Stylesheet" /> 
</head> 
<body> 
<form> 
<ul> 
<li> 
<button id="SubUpload" onclick="TSubmitUploadImageFile();return false;"> 
确定上传</button>   
<button id="CancelUpload" class="ManagerButton" onclick="javascript:history.go(-1);"> 
取消</button>   
<button id="AddUpload" class="ManagerButton" onclick="TAddFileUpload();return false;"> 
增加</button> 
</li> 
</ul> 
<ul id="loadimage"> 
<li> 
<div class="imagelabel"> 
图片1:</div> 
<div class="imagepath"> 
<input name="" size="45" id="uploadImg1" type="file" /></div> 
<div class="loadinfo"> 
<span id="uploadImgState1"></span> 
</div> 
</li> 
</ul> 
</form> 
</body> 
</html> 
<script type="text/javascript" src="http://www.cnblogs.com/JS/jquery-1.3.2-vsdoc.js"></script> 
<script type="text/javascript"> 
var TfileUploadNum = 1; //记录图片选择框个数 
var Tnum = 1; //ajax上传图片时索引 
//增加上传按钮 
function TAddFileUpload() { 
var idnum = TfileUploadNum + 1; 
var str = "<li>"; 
str += "<div class='imagelabel'>图片" + idnum + ":</div>"; 
str += "<div class='imagepath'><input name='' size='45' id='uploadImg" + idnum + "' type='file' /></div>"; 
str += "<div class='loadinfo'><span id='uploadImgState" + idnum + "'></span></div>"; 
str += "</li>"; 
$("#loadimage").append(str); 
TfileUploadNum += 1; 
} 
//开始上传 
function TSubmitUploadImageFile() { 
document.getElementById("SubUpload").disabled = true; 
document.getElementById("CancelUpload").disabled = true; 
document.getElementById("AddUpload").disabled = true; 
setTimeout("TajaxFileUpload()", 1000); //此为关键代码 
} 
//Ajax上传方法 
function TajaxFileUpload() { 
if (Tnum < TfileUploadNum + 1) { 
//准备提交处理 
$("#uploadImgState" + Tnum).html("<img src='/gif/upfileloader.gif'/>"); 
//开始提交 
$.ajax({ 
type: "POST", 
url: "Handler.ashx", 
data: { upfile: $("#uploadImg" + Tnum).val()}, 
success: function(data, status) { 
var stringArray = data.split("|"); 
//stringArray[0]　　　 成功状态(1为成功，0为失败) 
//stringArray[1]　　　 上传成功的文件名 
//stringArray[2]　　　 消息提示 
if (stringArray[0] == "1") { 
//上传成功 
	$("#uploadImgState" + Tnum).html("<img src='/gif/Success.gif' />" + stringArray[1] + "--" + stringArray[2]); 
} 
else { 
//上传出错 
$("#uploadImgState" + Tnum).html("<img src='/gif/Error.gif' />" + stringArray[1] + "--" + stringArray[2]); 
} 
Tnum++; 
setTimeout("TajaxFileUpload()", 1000); 
} 
}); 
} 
else { 
document.getElementById("SubUpload").disabled = false; 
document.getElementById("CancelUpload").disabled = false; 
document.getElementById("AddUpload").disabled = false; 
} 
}　　　　　　　　 
</script> 
