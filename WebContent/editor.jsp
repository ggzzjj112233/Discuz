<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="kindeditor-4.1.10/lang/zh-CN.js"></script>
<script>
	KindEditor.ready(function(K) {
		window.editor = K.create('#editor_id', {
			items : ['source', '|', 'undo', 'redo', '|', 'preview', 'print',
					'template', 'code', 'cut', 'copy', 'paste', 'plainpaste',
					'wordpaste', '|', 'justifyleft', 'justifycenter',
					'justifyright', 'justifyfull', 'insertorderedlist',
					'insertunorderedlist', 'indent', 'outdent', 'subscript',
					'superscript', 'clearhtml', 'quickformat', 'selectall',
					'|', 'fullscreen', '/', 'formatblock', 'fontname',
					'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
					'italic', 'underline', 'strikethrough', 'lineheight',
					'removeformat', '|', 'image', 'multiimage', 'flash',
					'media', 'insertfile', 'table', 'hr', 'emoticons',
					'baidumap', 'pagebreak', 'anchor', 'link', 'unlink', '|',
					'about'],
			uploadJson:"kindeditor-4.1.10/jsp/upload_json.jsp"
		});
	});
</script>
</head>
<body>
	<textarea id="editor_id" name="content"
		style="width: 700px; height: 300px;">

</textarea>
</body>
</html>