<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/forum.css" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/forum.js" type="text/javascript" charset="utf-8"></script>
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
	<div class="divbody" id="divbody">
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
			<c:choose>
				<c:when test="${userdate == null}">
					<div class="divlgn">
						<form action="LoginServlet" method="post">
							<table>
								<tr>
									<td><select name="" class="username">
											<option value="">用户名</option>
											<option value="">Email</option>
									</select></td>
									<td><input type="text" name="user"
										style="height: 20px; width: 160px; border: 1px solid; border-color: #848484 #E0E0E0 #E0E0E0 #848484;" />
									</td>
									<td><label><input type="checkbox" name="" id=""
											value="" style="vertical-align: -3px;" />自动登录</label></td>
								</tr>
								<tr>
									<td>密码</td>
									<td><input type="password" name="pwd"
										style="height: 20px; width: 160px; border: 1px solid; border-color: #848484 #E0E0E0 #E0E0E0 #848484;" />
									</td>
									<td>
										<button type="submit" style="width: 60px; height: 22px;">
											<em>登录</em>
										</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="divlgn">
						<div style="margin: 20px 50px;">
							欢迎会员：<a href="">${userdate.user_name}</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="divfindpwd">
				<p>
					<a href="">找回密码</a>
				</p>
				<p>
					<a href="member.jsp">立即注册</a>
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
		<div class="bankuai" id="bankuai">
			<c:forEach items="${bigblocks}" var="bigblock">
				<dl>
					<dt>
						<a href="">${bigblock.bb_name}</a> <img src="img/collapsed_no.gif" />
					</dt>
					<dd>
						<c:forEach items="${smallblocks}" var="smallblock">
							<c:choose>
								<c:when test="${smallblock.bigid == bigblock.bb_id }">
									<div>
										<img src="img/forum.gif" />
										<div>
											<p>
												<a href="PluginServlet?smallid=${smallblock.sb_id }"
													style="color: red; font-weight: 900;">${smallblock.sb_name }</a>
											</p>
											<c:choose>
												<c:when
													test="${smallblock.sb_id==2 || smallblock.sb_id==9 || smallblock.sb_id==10 || smallblock.sb_id==11}">
													<p>
														<a href="" style="color: #369; line-height: 18px;">链接到外部地址</a>
													</p>
												</c:when>
												<c:otherwise>
													<p>
														主题:
														${smallblock.postcount}, 帖数:
														${smallblock.allcount}</p>

													<p>
														<a href="" style="color: #369;">${smallblock.lastpostname}</a>
														&nbsp ${smallblock.ptime}
														${smallblock.pusername}</p>

												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>

					</dd>
				</dl>
			</c:forEach>
		</div>
		<dl class="production">
			<dd>
				<div>
					<img src="img/production.gif" />
					<div>
						<p>
							<a href="" style="color: black; font-weight: 900;">Discuz!产品</a>
						</p>
						<p style="color: gray;">Discuz! 官方网站 用户会员区</p>
					</div>
				</div>
				<div>
					<img src="img/虚拟主机.gif" />
					<div>
						<p>
							<a href="" style="color: black; font-weight: 900;">虚拟主机</a>
						</p>
						<p style="color: gray;">Discuz!专用主机服务</p>
					</div>
				</div>
				<div>
					<img src="img/腾讯云.png" />
					<div>
						<ul>
							<li><a href="">手机QQ浏览器</a></li>
							<li><a href="">腾讯开放论坛</a></li>
							<li><a href="">电脑管家论坛</a></li>
							<li><a href="">云服务器</a></li>
							<li><a href="">PHPChina</a></li>
							<li><a href="">蓝色理想</a></li>
							<li><a href="">电脑报论坛</a></li>
							<li><a href="">ChinaUnix.</a></li>
							<li><a href="">落伍者论坛</a></li>
							<li><a href="">IT之家</a></li>
							<li><a href="">好大夫</a></li>
							<li><a href="">站长工具</a></li>
							<li><a href="">中国网管联盟</a></li>
							<li><a href="">中国站长</a></li>
							<li><a href="">WEB开发网</a></li>
							<li><a href="">站长中国</a></li>
							<li><a href="">赢政天下</a></li>
							<li><a href="">金色财经</a></li>
							<li><a href="">中国站长之家</a></li>
							<li><a href="">网页教学网</a></li>
							<li><a href="">域名城</a></li>
							<li><a href="">A5论坛</a></li>
							<li><a href="">28推论坛</a></li>
							<li><a href="">多店商城</a></li>
							<li><a href="">游侠网</a></li>
							<li><a href="">DNSPod</a></li>
							<li><a href="">挖贝网</a></li>
							<li><a href="">奇米网</a></li>
							<li><a href="">小鸟云</a></li>
							<li><a href="">cc视频 </a></li>
							<li><a href="">互动中国</a></li>
							<li><a href="">军转网</a></li>
							<li><a href="">游久论坛</a></li>
							<li><a href="">恩基云彩</a></li>
							<li><a href="">盱眙网</a></li>
							<li><a href="">智能电视网</a></li>
							<li><a href="">A9VG电玩部落</a></li>
							<li><a href="">0668论坛</a></li>
							<li><a href="">盆景</a></li>
							<li><a href="">手游论坛</a></li>
							<li><a href="">玩家网</a></li>
							<li><a href="">推一把</a></li>
							<li><a href="">郑州论坛</a></li>
							<li><a href="">新东方社区</a></li>
							<li><a href="">安卓网</a></li>
							<li><a href="">91手机娱乐门户</a></li>
							<li><a href="">华声论坛</a></li>
							<li><a href="">中秋礼品</a></li>
							<li><a href="">站帮网</a></li>
							<li><a href="">太仓论坛</a></li>
							<li><a href="">爱换</a></li>
							<li><a href="">泰安论坛</a></li>
							<li><a href="">编织人生</a></li>
							<li><a href="">糖护士</a></li>
							<li><a href="">高效养殖网</a></li>
							<li><a href="">章丘人论坛</a></li>
							<li><a href="">微信企业号</a></li>
							<li><a href="">滴答留学移民</a></li>
							<li><a href="">上海滩</a></li>
							<li><a href="">木蚂蚁安卓论坛</a></li>
							<li><a href="">酷爱论坛</a></li>
							<li><a href="">肥东论坛</a></li>
							<li><a href="">选学网</a></li>
							<li><a href="">PHP100</a></li>
							<li><a href="">站长论坛</a></li>
							<li><a href="">站长教程</a></li>
							<li><a href="">好贷网</a></li>
							<li><a href="">17173游戏论坛</a></li>
							<li><a href="">星乐点网络</a></li>
							<li><a href="">Discuz! Fans</a></li>
							<li><a href="">ShopDZ</a></li>
							<li><a href="">域名注册</a></li>
						</ul>
					</div>
				</div>
			</dd>
		</dl>
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
	<!--主题框架-->

	<!--二维码-->
	<div id="divmark"></div>
</body>
</html>