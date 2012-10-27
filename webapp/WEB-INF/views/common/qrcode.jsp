<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="main">
<title>二维码生成</title>
</head>
<body>
	<table style="border:0px;width:100%;margin-bottom:100px;">
		<tr>
			<td width="40%"><textarea id="qrcode" style="width:300px;height:200px;">http://www.feiyan35488.com/common/qrcode</textarea></td>
			<td width="20%" align="center"><button onclick="createqrcode()">生成</button>
			<td width="40%" id="display"></td>
		</tr>
	</table>
<script type="text/javascript" language="javascript" src="${base }/js/qrcode.js"></script>
<script type="text/javascript" language="javascript">
	function create_qrcode(text,typeNumber,errorLevel){
			var qr = qrcode(typeNumber || 4,errorLevel || 'L');
			qr.addData(text);
			qr.make();
			return qr.createImgTag(6);
	}
	function createqrcode(){
		var qrcode = document.getElementById("qrcode");
		if(qrcode != null && qrcode.value !=''){
			var code = qrcode.value.replace(/^[\s\u3000]+|[\s\u3000]+$/g, '');
			document.getElementById("display").innerHTML = create_qrcode(code);
		}
		
	}
	createqrcode();
</script>
</body>
</html>