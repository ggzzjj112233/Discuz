<%@page import="com.javaweb.model.Userdate"%>
<%@page import="com.javaweb.serviceImpl.ReplyImpl"%>
<%@page import="com.javaweb.service.Replyable"%>
<%@page import="com.javaweb.service.Userdateable"%>
<%@page import="com.javaweb.serviceImpl.UserdateImpl"%>
<%@page import="com.javaweb.model.Reply"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/thread.css" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/thread.js" type="text/javascript" charset="utf-8"></script>
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
					int userid = userdate.getUser_id();
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
				<li style="width: 86px;" onmouseover="showDoc(this)"
					onmouseout="hideDoc(this)";>
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
				<li style="width: 86px;" onmouseover="showDoc1(this)"
					onmouseout="hideDoc1(this)";>
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
				<li style="width: 72px;" onmouseover="showDoc2(this)"
					onmouseout="hideDoc2(this)";>
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
			<div onmouseover="showList(this)" onmouseout="hideList(this)">
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
		<%
			String bigSectionName = (String) request.getAttribute("bsname");
		%>
		<%
			String smallSectionName = (String) request.getAttribute("ssname");
		%>
		<%
			String postName = (String) request.getAttribute("postName");
		%>
		<div class="fjshow">
			<div>
				<a href=""><img src="img/主页房子.png"
					style="position: relative; top: 5px" /> </a>&nbsp;<em>></em>&nbsp; <a
					href="">论坛首页</a>&nbsp; <em>></em>&nbsp; <a href=""><%=bigSectionName%></a>&nbsp;
				<em>></em>&nbsp; <a href=""><%=smallSectionName%></a>&nbsp; <em>></em>&nbsp;
				<a href=""><%=postName%></a>
			</div>
		</div>
		<div class="divft">
			<div>
				<a href=""><img src="img/发帖.png" /></a>
			</div>
			<div>
				<div>
					<a href="" style="color: #333;"><img
						src="http://www.discuz.net/static/image/common/arw_l.gif"
						style="vertical-align: middle;" />返回列表</a>
				</div>
			</div>
		</div>
		<%
			String className = (String) request.getAttribute("className");
		%>
		<%
			String userName = (String) request.getAttribute("userName");
		%>
		<%
			String postTime = (String) request.getAttribute("postTime");
		%>
		<%
			int countAll = (int) request.getAttribute("countAll");
		%>
		<%
			int pid = (int) request.getAttribute("pid");
		%>
		<div class="floor">
			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td>
							<div>
								<span style="color: #999">查看:</span> <span
									style="color: #F26C4F">162</span> <span
									style="margin: 0 5px; color: #CCC;">|</span> <span
									style="color: #999">回复:</span> <span style="color: #F26C4F"><%=countAll%></span>
							</div>
						</td>
						<td>
							<div>
								<div class="y">
									<a href=""><img src="img/print.png" class="vm"></a> <a
										href=""><img src="img/thread-left.png" class="vm"></a> <a
										href=""><img src="img/thread-right.png" class="vm"></a>
								</div>
								<div class="z">
									<a href=""> [<span
										style="color: darkorange; font-size: 16px; font-weight: 700;"><%=className%></span>]
									</a> <span style="font-size: 16px; font-weight: 700;"><%=postName%></span>
									<span> <a href="" style="color: #999">[复制链接]</a>
									</span>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" class="rowblue">
				<tbody>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div class="up">
				<table border="0" cellspacing="0" cellpadding="0" id="table1">
					<tbody>
						<tr>
							<td>
								<div id="touxiang">
									<div>
										<div>
											<a href="" style="font-weight: 700; color: #333;"><%=userName%></a>
										</div>
									</div>
									<div>
										<div>
											<a href=""><img src="img/头像.gif"
												style="padding: 5px 5px 8px; background: #FFF" /></a>
										</div>
									</div>
								</div>
							</td>
							<td>
								<div>
									<div>
										<label for="dt"
											style="float: left; margin-right: 4px; margin-top: 9px;">电梯直达</label>
										<input type="text" id="dt"
											style="width: 35px; height: 16px; border: 1px solid; border-color: #848484 #E0E0E0 #E0E0E0 #848484; float: left; margin-right: 4px; margin-top: 9px;" />
										<a href="" style="float: left; margin-top: 9px;"><img
											src="img/dt.png" /></a>
									</div>
									<div>
										<img src="img/online_member.gif"
											style="float: left; margin-top: 2px; margin-right: 5px;" />
										<span
											style="float: left; margin-top: 2px; margin-right: 10px;">发表于
											<%=postTime%></span> <span
											style="color: #CCC; float: left; margin-top: 2px; margin-right: 10px;">|</span>
										<a href=""
											style="color: #333; float: left; margin-top: 2px; margin-right: 10px;">只看该作者
										</a> <span
											style="color: #CCC; float: left; margin-top: 2px; margin-right: 10px;">|</span>
										<a href=""
											style="color: #333; float: left; margin-top: 2px; margin-right: 5px;">只看大图</a>
										<img src="img/arw_r.gif" style="float: left; margin-top: 3px;" />
										<a href=""
											style="color: red; font-weight: 700; float: left; margin-top: 1px; margin-left: 250px;">楼主</a>
									</div>
								</div> <%
 	String postContent = (String) request.getAttribute("postContent");
 %>
								<div>
									<div>
										<table border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td><%=postContent%></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<div>
									<div>
										<span style="color: #444; font-weight: 700;">分享到:&nbsp;</span>
										<a href=""><img src="img/qq_share.png" /> QQ好友和群</a> <a
											href=""><img src="img/qzone.gif" /> QQ空间</a> <a href=""><img
											src="img/weibo.png" /> 腾讯微博</a> <a href=""><img
											src="img/pengyou.png" /> 腾讯朋友</a> <a href=""><img
											src="img/wxshare.png" /> 微信</a>
									</div>
									<div>
										<a href=""><img src="img/fav.gif" /> 收藏</a>
									</div>

								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<div>
									<a href="" style="float: left;"><img src="img/qipao.png" />回复</a>
									<a href="" style="float: left; margin-left: 620px;">使用道具</a> <a
										href="" style="float: right;">举报</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
				List<Reply> replies = (List<Reply>) request.getAttribute("replies");
			%>
			<%
				Replyable rpa = new ReplyImpl();
			%>
			<%
				for (int i = 0; i < replies.size(); i++) {
			%>
			<table border="0" cellspacing="0" cellpadding="0" class="rowblue">
				<tbody>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div class="f1">
				<table border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td>
								<div>
									<div>
										<div>
											<a href="" style="font-weight: 700; color: #333;"><%=rpa.getRName(replies.get(i).getRuserid())%></a>
										</div>
									</div>
									<div>
										<div>
											<a href=""><img src="img/头像.gif"
												style="padding: 5px 5px 8px; background: #FFF" /></a>
										</div>
									</div>
								</div>
							</td>
							<td>
								<div>
									<div>
										<a href="" style="color: #333333;">藤椅</a>
									</div>
									<div>
										<img src="img/online_member.gif"
											style="float: left; margin-top: 2px; margin-right: 5px;" />
										<span
											style="float: left; margin-top: 2px; margin-right: 10px;">发表于
											<%=replies.get(i).getRtime()%></span> <span
											style="color: #CCC; float: left; margin-top: 2px; margin-right: 10px;">|</span>
										<a href=""
											style="color: #333; float: left; margin-top: 2px; margin-right: 10px;">只看该作者
										</a>
									</div>
								</div>

								<div>
									<div>
										<table border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td><%=replies.get(i).getR_content()%></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<div>
									<a href="" style="float: left;"><img src="img/qipao.png" />回复</a>
									<a href="" style="float: left; margin-left: 620px;">使用道具</a> <a
										href="" style="float: right;">举报</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
			<table border="0" cellspacing="0" cellpadding="0" class="rowblue">
				<tbody>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="divft">
			<div>
				<a href=""><img src="img/发帖.png" /></a>
			</div>
			<div>
				<div>
					<a href="" style="color: #333;"><img
						src="http://www.discuz.net/static/image/common/arw_l.gif"
						style="vertical-align: middle;" />返回列表</a>
				</div>
			</div>
		</div>
		<div class="ft">
			<form action="ReplyServlet" method="post"
				onsubmit="return addreply()">
				<%
					if (object == null) {
				%>
				<table cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td></td>
								<td>
									<div>
										<div>

										</div>
										<div>
											<div>
												您需要登录后才可以回帖&nbsp;
												<a href="">登录</a> <span>&nbsp;|&nbsp;</span>
												<a href="">立即注册</a>
												<img src="img/qq_login.gif" /><img src="img/wx.png" />
											</div>
										</div>
									</div>
									<div>
										<button>
											发表回复
										</button>
										<input type="checkbox" name="" id="" value="" style="float: left;margin-left: 5px;margin-top:12px;" />&nbsp;回帖后跳转到最后一页
										<a href="" style="float: right;color: #333;margin-top: 10px;">本版积分规则</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				<%
					} else {
						Userdate userdate1 = (Userdate) object;
						int userid1 = userdate1.getUser_id();
				%>
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td></td>
							<td>
								<div>
									<textarea id="editor_id" name="content"
										style="width: 680px; height: 70px; resize: none;"></textarea>

									<input type="hidden" name="pid" value="<%=pid%>" />
									<input type="hidden" name="ruid" value="<%=userid1%>" />
								</div> 
								<div>
									<button type="submit">发表回复</button>
									<input type="checkbox" name="" id="" value=""
										style="float: left; margin-left: 5px; margin-top: 12px;" />&nbsp;回帖后跳转到最后一页
									<a href="" style="float: right; color: #333; margin-top: 10px;">本版积分规则</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<%
					}
				%>
			</form>
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