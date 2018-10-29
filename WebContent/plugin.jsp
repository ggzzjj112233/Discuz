<%@page import="java.util.*"%>
<%@page import="com.javaweb.model.Userdate"%>
<%@page import="com.javaweb.model.Post"%>
<%@page import="com.javaweb.model.Category"%>
<%@page import="com.javaweb.model.Bigblock"%>
<%@page import="com.javaweb.model.Smallblock"%>
<%@page import="com.javaweb.model.Reply"%>
<%@page import="com.javaweb.dao.IPostDaoable"%>
<%@page import="com.javaweb.daoImpl.PostDaoImpl"%>
<%@page import="com.javaweb.dao.ICategoryDaoable"%>
<%@page import="com.javaweb.daoImpl.CategoryDaoImpl"%>
<%@page import="com.javaweb.dao.IBigblockDaoable"%>
<%@page import="com.javaweb.daoImpl.BigblockDaoImpl"%>
<%@page import="com.javaweb.dao.IReplyDaoable"%>
<%@page import="com.javaweb.daoImpl.ReplyDaoImpl"%>
<%@page import="com.javaweb.dao.ISmallblockDaoable"%>
<%@page import="com.javaweb.daoImpl.SmallblockDaoImpl"%>
<%@page import="com.javaweb.dao.IUserdateDaoable"%>
<%@page import="com.javaweb.daoImpl.UserdateDaoImpl"%>
<%@page import="com.javaweb.service.Replyable"%>
<%@page import="com.javaweb.service.Categoryable"%>
<%@page import="com.javaweb.service.Userdateable"%>
<%@page import="com.javaweb.service.Postable"%>
<%@page import="com.javaweb.service.Bigblockable"%>
<%@page import="com.javaweb.service.Pageable"%>
<%@page import="com.javaweb.service.Registable"%>
<%@page import="com.javaweb.service.Smallblockable"%>
<%@page import="com.javaweb.serviceImpl.ReplyImpl"%>
<%@page import="com.javaweb.serviceImpl.CategoryImpl"%>
<%@page import="com.javaweb.serviceImpl.UserdateImpl"%>
<%@page import="com.javaweb.serviceImpl.PostImpl"%>
<%@page import="com.javaweb.serviceImpl.BigblockImpl"%>
<%@page import="com.javaweb.serviceImpl.PageImpl"%>
<%@page import="com.javaweb.serviceImpl.RegistImpl"%>
<%@page import="com.javaweb.serviceImpl.SmallblockImpl"%>
<%@page import="com.javaweb.servlet.PluginServlet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/plugin.css" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/plugin.js" type="text/javascript" charset="utf-8"></script>
<script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="kindeditor-4.1.10/lang/zh-CN.js"></script>
<script>
	KindEditor.ready(function(K) {
		window.editor = K.create('#editor_id', {
			items : [ 'bold', 'forecolor', 'image', 'link', 'insertfile',
					'emoticons', ],
			uploadJson : "kindeditor-4.1.10/jsp/upload_json.jsp"
		});
	});
</script>
</head>
<body>
	<%
		List<Post> posts = (List<Post>) request.getAttribute("posts");
	%>
	<%
		Categoryable cga = new CategoryImpl();
	%>
	<%
		Userdateable uda = new UserdateImpl();
	%>
	<%
		Replyable rpa = new ReplyImpl();
	%>
	<%
		Postable psa = new PostImpl();
	%>
	<!--顶部-->
	<div class="divtop">
		<div>
			<a href="">设为首页</a> <a href="">收藏本站</a>
		</div>
	</div>
	<!--顶部-->

	<!--主体框架-->
	<div class="divbody">
		<!--注册登录-->
		<div class="divhead">
			<div class="divlogo">
				<a href=""> <img src="img/logo.png" alt="logo" />
				</a>
			</div>
			<div class="divwx">
				<a href=""> <img src="img/wx.png" alt="微信" />
				</a>
				<p>扫一扫，访问微社区</p>
			</div>
			<div class="divqq">
				<a href=""> <img src="img/qq_login.gif" alt="QQ" />
				</a>
				<p>只需一步，快速开始</p>
			</div>
			<%
				Object object = session.getAttribute("userdate");
			%>
			<%
				Userdate userdate = new Userdate();
				if (object == null) {
			%>
			<div class="divlgn">
				<table>
					<tr>
						<td>用户名</td>
						<td><input type="text" style="width: 160px;" /></td>
						<td><label><input type="checkbox" name="" id=""
								value="" style="vertical-align: -3px;" />自动登录</label></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><input type="password" style="width: 160px;" /></td>
						<td>
							<button style="width: 60px; height: 20px;">
								<em>登录</em>
							</button>
						</td>
					</tr>
				</table>
			</div>
			<%
				} else {
					userdate = (Userdate) object;
			%>
			<div class="divlgn">
				<div style="margin: 20px 50px;">
					欢迎会员：<a href=""><%=userdate.getUser_name()%></a>
				</div>
			</div>
			<%
				}
			%>
			<div class="divfindpwd">
				<p>
					<a href="">找回密码</a>
				</p>
				<p>
					<a href="member.html">立即注册</a>
				</p>
			</div>
		</div>

		<!--注册登录-->
		<nav id="nav1">
			<ul>
				<li style="width: 86px;">
					<div>
						<a href="">论坛首页</a>
					</div>
				</li>
				<li style="width: 86px;" id="li2">
					<div>
						<a href="">文档资料</a>
					</div>
					<div id="doc">
						<ul>
							<li><a href="">
									<div>&nbsp;教程</div>
							</a></li>
							<li><a href="">
									<div>&nbsp;开发文档</div>
							</a></li>
						</ul>
					</div>
				</li>
				<li style="width: 100px;">
					<div>
						<a href="">腾讯云主机</a>
					</div>
				</li>
				<li style="width: 127px;">
					<div>
						<a href="">Discuz!实验室</a>
					</div>
				</li>
				<li style="width: 86px;">
					<div>
						<a href="">服务购买</a>
					</div>
				</li>
				<li style="width: 86px;" id="li6">
					<div>
						<a href="">应用中心</a>
					</div>
					<div id="doc1">
						<ul>
							<li><a href="">
									<div>&nbsp;Discuz！应用中心</div>
							</a></li>
							<li><a href="">
									<div>&nbsp;Discuz！开发平台</div>
							</a></li>
						</ul>
					</div>
				</li>
				<li style="width: 72px;" id="li7">
					<div>
						<a href="">微社区</a>
					</div>
					<div id="doc2">
						<ul>
							<li><a href="">
									<div>&nbsp;Discuz！打通版</div>
							</a></li>
							<li><a href="">
									<div>&nbsp;标准版</div>
							</a></li>
							<li><a href="">
									<div>&nbsp;本地化部署版(第三方)</div>
							</a></li>
						</ul>
					</div>
				</li>
				<li style="width: 86px;">
					<div>
						<a href="">在线体验</a>
					</div>
				</li>
			</ul>
			<div id="kjmenuList">
				<a href="">
					<div>快捷导航</div>
				</a>
				<!--快捷导航-->
				<div id="kjmenu">
					<div>
						<div>
							请 <a href="login.html">登录</a> 后使用快捷导航<br>没有帐号？ <a
								href="member.html">立即注册</a>
						</div>
					</div>
					<div>
						<div class="sousuo">
							搜索版块: <input type="text">
						</div>
						<ul class="sousuobk">
							<li>
								<p class="xg1">所有版块</p>
								<p class="xg2">
									<a href="">Comsenz 公司动态</a>
								</p>
								<p class="xg3">
									<a href="">Discuz! 程序发布</a>
								</p>
								<p class="xg3">
									<a href="">Discuz! 实验室</a>
								</p>
								<p class="xg2">
									<a href="">Discuz! 交流与讨论</a>
								</p>
								<p class="xg3">
									<a href="">Discuz!-插件</a>
								</p>
								<p class="xg3">
									<a href="">Discuz!-模板</a>
								</p>
								<p class="xg3">
									<a href="">Discuz!-应用中心</a>
								</p>
								<p class="xg3">
									<a href="">Discuz!-安装使用</a>
								</p>
								<p class="xg3">
									<a href="">站长帮</a>
								</p>
								<p class="xg3">
									<a href="">Discuz!-BUG反馈</a>
								</p>
								<p class="xg2">
									<a href="">关联技术专区</a>
								</p>
								<p class="xg3">
									<a href="">PHP技术讨论版</a>
								</p>
								<p class="xg3">
									<a href="">ECShop 交流与讨论</a>
								</p>
								<p class="xg3">
									<a href="">Discuz! 腾讯云</a>
								</p>
							</li>

							<li>
								<p class="xg1">最近浏览</p>
							</li>
							<li>
								<p class="xg1">我的收藏</p>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</nav>

		<!--搜索-->
		<div class="search">
			<form id="srchform" method="" autocomplete="off" action="" target="">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td><input type="text" id="srchtxt" placeholder="请输入搜索内容"
							autocomplete="off" /></td>
						<td><img src="img/帖子下拉.png" style="margin-left: -2px;"
							/ id="tiezi"></td>
						<td><a href=""><img src="img/搜索.png" id="srchimg" /></a></td>
						<td class="scbar_hot_td">
							<div id="scbar_hot">
								<strong class="xw1">热搜:</strong> <a href="">网页游戏</a> <a href="">婚纱
								</a> <a href="">推广</a> <a href="">聊天室</a> <a href="">游戏</a> <a
									href="">婚纱摄影</a> <a href="">积分商城</a> <a href="">搬家</a> <a
									href="">同城交友</a> <a href="">客户端</a> <a href="">旅游</a> <a
									href="">招聘</a>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<!--版规-->
		<div id="divBG" class="divBG">

			<div class="divbgh">
				<div>
					<img src="img/fav.gif" style="vertical-align: -2px;" /> <a href=""
						style="color: #333;">收藏本版<span
						style="color: #F26C4F; font-weight: bold;">（383）</span></a> <img
						src="img/collapsed_no.gif" id="collapsed"
						style="vertical-align: -4px;" />
				</div>
				<p>
				<h1 class="xs2">
					<a href="plugin.html"
						style="color: #333; font-size: 14px; font-weight: 900;">
						Discuz!-插件 </a> <span style="padding-left: 10px; color: #444;">今日:
						<strong style="color: #F26C4F; font-weight: bold;">1</strong><img
						src="img/下降.png"
						style="width: 19px; height: 22px; vertical-align: middle; display: inline-block; margin-left: 5px; margin-right: 1px;" /><b>&nbsp;</b><span
						style="color: #CCC; margin: 0 5px;">|</span>主题: <strong
						style="color: #F26C4F; font-weight: bold;">1254312</strong><span
						style="color: #CCC; margin: 0 5px;">|</span>排名: <strong
						style="color: #F26C4F; font-weight: bold;">3</strong><b>&nbsp;</b>
					</span>
				</h1>
				</p>
				<p style="color: #444;">
					版主: <a href="" style="color: #369;">民审K星客,</a> <a href=""
						style="color: #369;">民审-小源,</a> <a href="" style="color: #369;">民审大大,</a>
					<a href="" style="color: #369;">民审员乙,</a> <a href=""
						style="color: #369;">民审x</a>
				</p>
			</div>
			<div id="client" class="divbgb">
				1. 本版讨论 Discuz!
				的插件开发、安装、使用、需求、问题反馈。发布其他无关内容将直接删帖，并根据情节轻重进行积分扣减、警告，直至禁言或封杀帐号。 <br />
				2. <span style="color: #ff0000">发帖请严格按照分类进行发帖，插件发布帖严格要求上传插件或提供应用中心下载地址</span>，分类错误将直接删帖，情节严重者将受到更严重的处罚。
				<br /> 3.
				对于有严重缺陷或者问题并直接威胁论坛安全的插件，官方接到举报后，将对该插件发布贴停止浏览或屏蔽，直至插件补丁发布并且附件更新。 <br />
				4. 安装插件有风险, Discuz! 官方、团队不对因安装插件产生的任何后果(如不良影响)负责 <br /> 5.
				插件的版权归插件作者所有, 尊重作者是基本的道德。<span style="color: #ff0000">禁止诋毁、抄袭、盗用版权或未经作者同意转载、转发插件作品的行为</span>，情节严重者永久封闭帐号。
				<br /> 6. 鼓励网友积极对喜欢的插件和优秀的插件进行评分，大家的评分是插件作者继续前进的动力，版主也<span
					style="color: #ff0000">将对优秀插件进行金币奖励和适当的高亮推荐</span>。 <br /> 7.
				其他未尽事宜，请随时关注版主的相关公告贴
			</div>
		</div>

		<div class="divft">
			<div>
				<a href=""><img src="img/发帖.png" /></a>
			</div>
			<div>
				<%
					int smallid = (int) request.getAttribute("smallid");
				%>
				<%
					int pages = (int) request.getAttribute("pages");
				%>
				<%
					int pagenumber = (int) request.getAttribute("pagenumber");
				%>
				<div class="fanhui" onmouseover="this.style.borderColor = 'grey'"
					onmouseout="this.style.borderColor = '#C2D5E3'">
					<a href="ForumServlet" style="color: #333;"><img
						src="http://www.discuz.net/static/image/common/arw_l.gif"
						style="vertical-align: middle;" />返 回</a>
				</div>
				<%
					for (int j = 0; j < pages; j++) {
				%>
				<div class="epage" onmouseover="this.style.borderColor = 'grey'"
					onmouseout="this.style.borderColor = '#C2D5E3'">
					<a href="PluginServlet?smallid=<%=smallid%>&pagenum=<%=j + 1%>"
						style="color: #333;"><%=j + 1%></a>
				</div>
				<%
					}
				%>
				<div class="nthpage">
					<input type="text" value="1" style="width: 25px; height: 16px;" />
					/<%=pages%>页
				</div>
				<div class="nxpage" onmouseover="this.style.borderColor = 'grey'"
					onmouseout="this.style.borderColor = '#C2D5E3'">
					<a
						href="PluginServlet?smallid=<%=smallid%>&pagenum=<%=pagenumber + 1%>"
						style="color: #333;">下一页<img
						src="http://www.discuz.net/static/image/common/arw_r.gif"
						style="vertical-align: middle;" /></a>
				</div>
			</div>
		</div>

		<%
			int count1 = (int) request.getAttribute("count1");
		%>
		<%
			int count2 = (int) request.getAttribute("count2");
		%>
		<%
			int count3 = (int) request.getAttribute("count3");
		%>
		<%
			int count4 = (int) request.getAttribute("count4");
		%>
		<%
			int count5 = (int) request.getAttribute("count5");
		%>
		<div class="ulshow">
			<div>
				<a href="">
					<div
						style="width: 50px; height: 24px; background: #E5EDF2; color: #369; font-weight: 700; border: 1px solid #369; margin-left: -5px;">全部</div>
				</a>
			</div>
			<div onmouseover="this.style.borderColor = '#369'"
				onmouseout="this.style.borderColor = '#CDCDCD'"
				style="border: 1px solid #CDCDCD;">
				<a href="">
					<div
						style="width: 88px; height: 24px; color: green; font-weight: 700;">
						发布 <span
							style="background: #999999; color: white; border-radius: 5px;">&nbsp;<%=count1%>&nbsp;
						</span>
					</div>
				</a>
			</div>
			<div onmouseover="this.style.borderColor = '#369'"
				onmouseout="this.style.borderColor = '#CDCDCD'"
				style="border: 1px solid #CDCDCD;">
				<a href="">
					<div
						style="width: 88px; height: 24px; color: green; font-weight: 700;">
						修改 <span
							style="background: #999999; color: white; border-radius: 5px;">&nbsp;<%=count2%>&nbsp;
						</span>
					</div>
				</a>
			</div>
			<div onmouseover="this.style.borderColor = '#369'"
				onmouseout="this.style.borderColor = '#CDCDCD'"
				style="border: 1px solid #CDCDCD;">
				<a href="">
					<div style="width: 88px; height: 24px; color: darkorange;">
						求助 <span
							style="background: #999999; color: white; border-radius: 5px;">&nbsp;<%=count3%>&nbsp;
						</span>
					</div>
				</a>
			</div>
			<div onmouseover="this.style.borderColor = '#369'"
				onmouseout="this.style.borderColor = '#CDCDCD'"
				style="border: 1px solid #CDCDCD;">
				<a href="">
					<div style="width: 88px; height: 24px; color: #333;">
						展示 <span
							style="background: #999999; color: white; border-radius: 5px;">&nbsp;<%=count4%>&nbsp;
						</span>
					</div>
				</a>
			</div>
			<div onmouseover="this.style.borderColor = '#369'"
				onmouseout="this.style.borderColor = '#CDCDCD'"
				style="border: 1px solid #CDCDCD;">
				<a href="">
					<div style="width: 88px; height: 24px; color: #333;">
						商业 <span
							style="background: #999999; color: white; border-radius: 5px;">&nbsp;<%=count5%>&nbsp;
						</span>
					</div>
				</a>
			</div>
			<div
				style="width: 2px; height: 27px; background: #C2D5E3; color: transparent; margin-left: 10px; margin-right: 5px;">|</div>
			<div onmouseover="this.style.borderColor = '#369'"
				onmouseout="this.style.borderColor = '#CDCDCD'"
				style="border: 1px solid #CDCDCD;">
				<a href="">
					<div style="width: 105px; height: 24px; color: #333;">
						插件发布 <span
							style="background: #999999; color: white; border-radius: 5px;">&nbsp;2080&nbsp;</span>
					</div>
				</a>
			</div>
		</div>
		<div class="divtz">
			<div>
				<div style="margin-left: 10px;">
					<a href="" style="color: #369;">全部主题 </a>
				</div>
				<div style="margin-left: 30px;">
					<a href="" style="color: #369;">最新</a> <a href=""
						style="color: #369;">热门</a> <a href="" style="color: #369;">热帖</a>
					<a href="" style="color: #369;">精华</a> <a href=""
						style="color: #369;">更多</a>
				</div>
				<div style="margin-left: 400px; color: #336699;">
					<label><input type="checkbox"
						style="float: left; margin-top: 13px;" />&nbsp;新窗</label>
				</div>
				<div style="margin-left: 20px;">作者</div>
				<div style="margin-left: 80px;">回复/查看</div>
				<div style="margin-left: 10px;">最后发表</div>
			</div>
			<div>
				<table id="tztable">
					<%
						for (int i = 0; i < posts.size(); i++) {
					%>
					<tr>
						<td class="tzlx"><img src="img/folder_new.gif"
							style="float: left;" /> &nbsp;&nbsp; <span
							style="color: blue; font-size: 13px;">[</span><span
							style="color: green; font-weight: 700;"><%=cga.getCategoryname(posts.get(i).getCid())%></span><span
							style="color: blue; font-size: 13px;">]</span></td>
						<td class="tzbt"><a
							href="ThreadServlet?postid=<%=posts.get(i).getPid()%>"
							class="tznr"><%=posts.get(i).getPname()%></a></td>
						<td class="tzxc"><a href="" id="yulan1">预览</a></td>
						<td class="tzzz"><span style="font-size: 12px; color: #333;"><%=psa.getPusername(posts.get(i).getPid())%></span>
							<br /> <span style="font-size: 11px; color: #999;"><%=posts.get(i).getPtime()%></span></td>
						<td class="tzhul"><span style="font-size: 12px; color: #333;"><%=rpa.getCount(posts.get(i).getPid())%></span>
							<br /> <span style="font-size: 11px; color: #999;">40</span></td>
						<td><span style="font-size: 12px; color: #333;"><%=rpa.getReplyName(posts.get(i).getPid())%></span>
							<br /> <span style="font-size: 11px; color: #999;"><%=rpa.getReplyTime(posts.get(i).getPid())%></span></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<div id="nextpg">
			<a
				href="PluginServlet?smallid=<%=smallid%>&pagenum=<%=pagenumber + 1%>">
				<div class="nextpg" onmouseover="this.style.backgroundColor='white'"
					onmouseout="this.style.backgroundColor='#F2F2F2'">下一页 »</div>
			</a>
		</div>
		<div class="divft">
			<div>
				<a href=""><img src="img/发帖.png" /></a>
			</div>
			<div>
				<%
					int smallid2 = (int) request.getAttribute("smallid");
				%>
				<%
					int pages2 = (int) request.getAttribute("pages");
				%>
				<%
					int pagenumber2 = (int) request.getAttribute("pagenumber");
				%>
				<div class="fanhui" onmouseover="this.style.borderColor = 'grey'"
					onmouseout="this.style.borderColor = '#C2D5E3'">
					<a href="ForumServlet" style="color: #333;"><img
						src="http://www.discuz.net/static/image/common/arw_l.gif"
						style="vertical-align: middle;" />返 回</a>
				</div>
				<%
					for (int j = 0; j < pages2; j++) {
				%>
				<div class="epage" onmouseover="this.style.borderColor = 'grey'"
					onmouseout="this.style.borderColor = '#C2D5E3'">
					<a href="PluginServlet?smallid=<%=smallid2%>&pagenum=<%=j + 1%>"
						style="color: #333;"><%=j + 1%></a>
				</div>
				<%
					}
				%>
				<div class="nthpage">
					<input type="text" value="1" style="width: 25px; height: 16px;" />
					/<%=pages2%>页
				</div>
				<div class="nxpage" onmouseover="this.style.borderColor = 'grey'"
					onmouseout="this.style.borderColor = '#C2D5E3'">
					<a
						href="PluginServlet?smallid=<%=smallid2%>&pagenum=<%=pagenumber2 + 1%>"
						style="color: #333;">下一页<img
						src="http://www.discuz.net/static/image/common/arw_r.gif"
						style="vertical-align: middle;" /></a>
				</div>
			</div>
		</div>
		<div class="ksft">
			<div>&nbsp;&nbsp;快速发帖</div>
			<%
				if (object == null) {
			%>
			<div>
				<form action="" method="post">
					<div>
						<div>
							<select name="主题" style="width: 103px; height: 25px;">
								<option value="">选择主题分类</option>
								<option value="">发布</option>
								<option value="">修改</option>
								<option value="">求助</option>
								<option value="">展示</option>
								<option value="">商业</option>
							</select>
						</div>
						<input type="text"
							style="width: 306px; height: 23px; border: 1px solid; border-color: #848484 #E0E0E0 #E0E0E0 #848484;" />
						还可输入 80 个字符
					</div>
					<div>
						<div></div>
						<div>
							您需要登录后才可以发帖 <a href="">登录</a> | <a href="">立即注册</a> <a href=""><img
								src="img/qq_login.gif" /></a> <a href=""><img src="img/wx.png" /></a>
						</div>
					</div>
					<div>
						验证码 <input type="text"
							style="width: 106px; height: 21px; border: 1px solid; border-color: #848484 #E0E0E0 #E0E0E0 #848484;" />
						<a href="" style="color: #369;">换一个</a>
					</div>
					<div>
						<button type="submit"
							style="width: 70px; height: 26px; border: 1px solid #235994; background-color: #06C; background-position: 0 -48px; color: #FFF; font-size: 13px; font-weight: 700;">发表帖子</button>
						<div>
							<a href="" style="color: #333;">本版积分规则</a>
						</div>
					</div>
				</form>
			</div>
			<%
				} else {
					Userdate userdate1 = (Userdate) object;
					int userid1 = userdate1.getUser_id();
			%>
			<div>
				<form action="PostServlet" method="post">
					<div>
						<div>
							<select name="theme" style="width: 103px; height: 25px;">
								<option value="">选择主题分类</option>
								<option value="1">发布</option>
								<option value="2">修改</option>
								<option value="3">求助</option>
								<option value="4">展示</option>
								<option value="5">商业</option>
							</select>
						</div>
						<input type="text" name="postname"
							style="width: 306px; height: 23px; border: 1px solid; border-color: #848484 #E0E0E0 #E0E0E0 #848484;" />
						还可输入 80 个字符
					</div>
					<div>
						<div>
							<textarea id="editor_id" name="content"
								style="resize: none;"></textarea>
							<input type="hidden" name="puid" value="<%=userid1%>" />
							<input type="hidden" name="sid" value="<%=smallid%>" />
						</div>
					</div>
					<div>
						验证码 <input type="text"
							style="width: 106px; height: 21px; border: 1px solid; border-color: #848484 #E0E0E0 #E0E0E0 #848484;" />
						<a href="" style="color: #369;">换一个</a>
					</div>
					<div>
						<button type="submit"
							style="width: 70px; height: 26px; border: 1px solid #235994; background-color: #06C; background-position: 0 -48px; color: #FFF; font-size: 13px; font-weight: 700;">发表帖子</button>
						<div>
							<a href="" style="color: #333;">本版积分规则</a>
						</div>
					</div>
				</form>
			</div>
			<%
				}
			%>
		</div>
		<dl class="bottom">
			<dd>
				<div>
					<span>Powered by </span> <span><a href=""
						style="color: black; font-weight: 900;">Discuz!</a></span> <span>X3.3</span>
					<br /> <span>© 2001-2017</span> <span><a href=""
						style="color: black;">Comsenz Inc.</a></span>
				</div>
				<div>
					<ul>
						<li style="width: 50px;">
							<div>
								<a href="">小黑屋</a>
							</div>
						</li>
						<li style="width: 50px;">
							<div>
								<a href="">手机版</a>
							</div>
						</li>
						<li style="width: 60px;">
							<div>
								<a href="">Archiver</a>
							</div>
						</li>
						<li style="width: 190px; border: none;">
							<div>
								<a href="">Comsenz</a> <a href=""> ( 粤B2-20090059-165 )</a>
							</div>
						</li>
						<li style="border: none;"><img src="img/底部1.gif" /></li>
						<li style="border: none;"><img src="img/底部2.png" /></li>
					</ul>
					<div>GMT+8, 2018-8-16 14:17</div>
				</div>
			</dd>
		</dl>
	</div>
</body>
</html>