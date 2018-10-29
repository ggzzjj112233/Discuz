<%@page import="com.javaweb.model.Userdate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/member.css" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var yes = function() {
		document.getElementById("divZCTK").style.display = "none";
	}
	var no = function() {
		location.href = "forum.html";
	}
</script>
<script src="js/member.js" type="text/javascript" charset="utf-8"></script>
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
		<form action="RegistServlet" method="post" onsubmit="return getRegist()">
			<div class="divregnow">
				<div>
					&nbsp;&nbsp;立即注册 <a href="login.html">已有帐号？现在登录</a>
				</div>
				<dl class="dlrow1" style="margin-top: 30px;">
					<dt>
						<span style="color: red;">*</span>
						<lable for="yqm">邀请码：</lable>
					</dt>
					<dd>
						<input type="text" name="yqm" id="yqm" value="" class="text"
							onfocus="showyqm()" onblur="showtishi()" /> <span id="inforyqm">联系QQ:80056365,发送邀请码免费获取</span>
						<span id="infortishi">抱歉，邀请码错误，请重新填写，没有邀请码不允许注册</span>
					</dd>
				</dl>
				<dl class="dlrow1">
					<dt>
						<span style="color: red;">*</span>
						<lable for="username">用户名：</lable>
					</dt>
					<dd>
						<input type="text" name="username" id="username" value=""
							class="textred" onfocus="showyhm()" onblur="yhmtishi()" /> <span
							id="inforyhm">用户名不得小于 3 个字符</span> <span id="inforyhmts">用户名由3到15个字符组成</span>
							<span id="yhmable">用户名可用</span><span id="yhmdisable">用户名已存在</span>
					</dd>
				</dl>
				<dl class="dlrow1">
					<dt>
						<span style="color: red;">*</span>
						<lable for="mima">密码：</lable>
					</dt>
					<dd>
						<input type="password" name="mima" id="mima" value="" class="text"
							onfocus="showmima()" onblur="mimatishi()" /> <span
							id="informima">请填写密码, 最小长度为 8 个字符</span><span id="informimats">密码不得小于8个字符</span>
							<span id="mimaable">密码可用</span>
					</dd>
				</dl>
				<dl class="dlrow1">
					<dt>
						<span style="color: red;">*</span>
						<lable for="rmima">确认密码：</lable>
					</dt>
					<dd>
						<input type="password" name="rmima" id="rmima" value=""
							class="text" onfocus="showremima()" onblur="remimatishi()" /> <span
							id="remima">请再次输入密码</span><span
							id="mimabxt">密码与上面不相同</span><span
							id="mimaxt">密码与上面相同</span>
					</dd>
				</dl>
				<dl class="dlrow1">
					<dt>
						<span style="color: red;">*</span>
						<lable for="email">Email：</lable>
					</dt>
					<dd>
						<input type="email" name="email" id="email" value="" class="text"
							onfocus="showemail()" onblur="emailtishi()" /> <span id="temail">请输入正确的邮箱地址</span>
						<span id="inforemail">请输入邮箱地址</span>
					</dd>
				</dl>
				<dl class="dlrow2">
					<dt>
						<span style="color: red;">*</span>
						<lable for="yzm">验证码：</lable>
					</dt>
					<dd>
						<input type="text" name="yzm" id="yzm" value="" class="textyzm" />
						<a href="" style="color: #369;">换一个</a>
						<div style="margin-top: -5px;">
							输入下图中的字符 <br /> <img src="img/验证码.png" />
						</div>
				</dl>
				<dl class="dlrow3">
					<dd>
						<input type="submit" name="tj" id="tj" value="提交" class="tijiao" />
						<input type="checkbox" name="agree" id="agree" checked
							class="gouxuan" />
						<lable for="tiaokuan">同意</lable>
						<a href="" name="tiaokuan" id="tiaokuan">网站服务条款</a>
					</dd>
				</dl>
				<dl class="dlrow4">
					<dt>快捷登陆：</dt>
					<dd>
						<a href=""><img src="img/qq_login.gif" /></a> <a href=""><img
							src="img/wx.png" /></a>
					</dd>
				</dl>
			</div>
		</form>

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
		<div class="divZCTK" id="divZCTK">
			<div>Discuz! 官方站 网站服务条款</div>
			<div>
				重要须知： <br>
				本协议是您与康盛公司及其合作单位（以下简称：“康盛公司”）之间关于康盛公司提供的各种产品及服务（以下统称：康盛产品）的法律协议。
				康盛在此特别提醒，您欲使用康盛产品，必须事先认真阅读本服务条款中各条款，包括免除或者限制康盛责任的免责条款及对您的权利限制。请您审阅并接受或不接受本服务条款（未成年人审阅时应得到法定监护人的陪同）。如您不同意本服务条款及/或康盛随时对其的修改，您应不使用或主动取消康盛公司提供的康盛产品。否则，您的任何对康盛产品中的相关服务的登陆、下载、查看等使用行为将被视为您对本服务条款全部的完全接受，包括接受康盛对服务条款随时所做的任何修改。
				<br> 本服务条款一旦发生变更,
				康盛将在网页上公布修改内容。修改后的服务条款一旦在网页上公布即有效代替原来的服务条款。您可随时登陆康盛官方论坛查阅最新版服务条款。 <br>
				<br>
				如果您选择接受本条款，即表示您同意接受协议各项条件的约束。如果您不同意本服务条款，则不能获得使用本服务的权利。您若有违反本条款规定，康盛公司有权随时中止或终止您对康盛产品的使用资格并保留追究相关法律责任的权利。
				<br> <br> 一、产品保护条款 <br> <br> 1.
				康盛产品是由康盛公司版权所有。康盛产品的一切版权以及与康盛产品相关的所有信息内容，包括但不限于：文字表述及其组合、图标、图饰、图表、色彩、版面设计、数据、印刷材料、或电子文档等均受著作权法和国际著作权条约以及其他知识产权法律法规的保护。
				<br> 2.
				您须明白，使用本服务产品涉及到互联网服务，可能会受到各个环节不稳定因素的影响。因此服务存在不可抗力、计算机病毒或黑客攻击、系统不稳定、用户所在位置、用户关机以及其他任何技术、互联网络、通信线路原因等造成的服务中断或不能满足用户要求的风险。您须承担以上风险，康盛不作担保。
				<br> 3.
				如康盛的系统发生故障影响到本服务的正常运行，康盛承诺在第一时间内与相关单位配合，及时处理进行修复。但您因此而产生的经济损失，康盛不承担责任。此外，康盛保留不经事先通知为维修保养、升级或其他目的暂停本服务任何部分的权利。
				<br>
				4．使用本服务必须遵守国家有关法律和政策等，维护国家利益，保护国家安全，并遵守本条款，对于您违法或违反本条款的使用(包括但不限于言论发表、传送等)而引起的一切责任，由您负全部责任，概与康盛及合作单位无关，导致康盛及合作单位损失的，康盛及合作单位有权要求赔偿，并有权立即停止向其提供服务，保留相关记录，并保留配合司法机关追究法律责任的权利。
				<br>
				5．您同意个人隐私信息是指那些能够对您进行个人辨识或涉及个人通信的信息，包括下列信息：您的姓名，身份证号，手机号码，IP地址，电子邮件地址信息。而非个人隐私信息是指您登陆的帐号、对软件的操作状态以及使用习惯等您的操作记录信息和其他一切个人隐私信息范围外的普通信息。康盛将会采取合理的措施保护您的个人隐私信息，除法律或有法律赋予权限的政府部门要求或您同意等原因外，康盛未经您同意不向除合作单位以外的第三方公开、
				透露您个人隐私信息。您同意，为了运营和改善康盛的技术和服务，康盛可以在无须再另行通知或提示您的情况下，自己收集使用或向第三方提供使用您的非个人隐私信息，以有助于康盛及合作单位向用户提供更好的用户体验和提高服务质量。
				<br> <br> 二、用户使用须知 <br> <br>
				特别提醒您，使用互联网必须遵守国家有关的政策和法律，如刑法、国家安全法、保密法、计算机信息系统安全保护条例等，保护国家利益，保护国家安全，对于违法使用互联网络而引起的一切责任，由您负全部责任。
				<br> 1.
				您不得使用康盛产品发送或传播任何妨碍社会治安或非法、虚假、骚扰性、侮辱性、恐吓性、伤害性、破坏性、挑衅性、淫秽色情性等内容的信息。 <br>
				2. 您不得使用康盛软件产品发送或传播敏感信息和违反国家法律制度的信息。 <br> 3.
				您保证以真实的身份注册使用康盛的软件产品，向康盛所提供的个人身份资料信息真实、完整、有效，依据法律规定和约定对所提供的信息承担相应的法律责任。如果资料发生变化，您应及时更改。康盛会及时、有效地提供该项服务。在安全完成本服务的登记程序后，您应维持密码及帐号的机密安全。您应对任何人利用您的密码及帐号所进行的活动负完全的责任，康盛公司无法对非法或未经您授权使用您帐号及密码的行为作出甄别，因此康盛公司不承担任何责任。
				<br> 4.
				盗取他人号码或利用网络通讯骚扰他人，均属于非法行为。您不得采用测试、欺骗等任何非法手段，盗取其他用户的帐号和对他人进行骚扰。 <br>
				5.
				康盛在此郑重提请您注意，任何经由本服务以上传、下载、张贴、电子邮件或任何其他方式传送的资讯、资料、文字、软件、音乐、音讯、照片、图形、视讯、信息、用户的登记资料或其他资料等（以下简称“内容”），无论系公开还是私下传送，均由内容提供者承担责任。同时，为了提高、改进康盛各种服务的用户体验，您同意康盛对凡是您经由本服务通过上传、张贴等任何方式发布到康盛产品的任何文字、图片及其他信息资料等进行无偿的修改、复制、传播等使用。康盛无法监控经由本服务传送之内容，也无法对用户的使用行为进行全面控制，因此不保证内容的合法性、正确性、完整性、真实性或品质等；您已预知使用本服务时，可能会接触到令人不快、不适当或令人厌恶之内容，并同意将自行加以判断并承担所有风险，而不依赖于康盛。但在任何情况下，康盛公司有权依法停止任何前述内容的服务并采取相应行动，包括但不限于暂停用户使用本服务的全部或部分，保存有关记录，并向有关机关报告。但康盛有权(但无义务)依其自行之考量，拒绝和删除可经由本服务提供之违反本条款的或其他引起康盛或其他用户反感的任何内容。
				<br> 6. 康盛产品属于群体类产品，使用康盛软件产品服务的用户之间引发的任何纠纷康盛公司将不负责任。 <br>
				<br> 三、关于网络游戏 <br> <br>
				在康盛产品中，目前康盛提供了大量的网络游戏服务。您同意、理解并遵循以下条款，该部分条款不仅适用于网络游戏，若康盛产品的其他相关服务涉及其中类似情形的，也同时适用，对双方均有约束力：
				<br> 1.
				游戏充值与游戏币兑换比例标准制定属于康盛及其合作伙伴，即康盛及其合作伙伴保留变更兑换标准、兑换对象等权利。同时，康盛也保留对网络游戏进行升级、改版，增加、删除、修改、变更其功能或者变更其游戏规则的权利。您如果不接受该等变更的，应当立即停止使用网络游戏；您继续使用网络游戏的行为，视为您接受改变后的经营模式。
				<br> 2. 基于本协议您可以： <br> （1）安装、启动、升级、登录、显示、运行或截屏网络游戏； <br>
				（2）创建网络游戏游戏角色，设置网名，查阅游戏规则、用户个人资料、游戏对局结果，设置游戏参数，使用聊天功能，在游戏中购买、赠送游戏道具、游戏装备等；
				<br> 3.
				您除了可以按照本协议的约定使用网络游戏之外，不得进行任何侵犯网络游戏的知识产权的行为，或者进行其他的有损于康盛或其他用户合法权益的行为。康盛也绝对不会允许您从事这些行为，亦有权采取技术措施防止您从事这些行为，包括但不限于：
				<br> （1）删除或修改网络游戏上的版权信息，或者伪造ICP/IP地址或者数据包的名称； <br>
				（2）进行任何破坏网络游戏公平性或者其他影响游戏正常秩序的行为，如主动或被动刷分、合伙作弊、使用游戏外挂或者其他的作弊软件、利用BUG（又叫“漏洞”或者“缺陷”）来获得不正当的非法利益，或者利用互联网或其他方式将游戏外挂、作弊软件、BUG公之于众；
				<br>
				（3）利用劫持域名服务器等技术非法侵入、破坏网络游戏之服务器软件系统，或者修改、增加、删除、窃取、截留、替换服务器软件系统中的数据，或者非法挤占网络游戏之服务器空间，或者实施其他的使之超负荷运行的行为；
				<br> （4）进行任何诸如发布广告、销售商品的商业行为，或者进行任何非法的侵害康盛利益的行为，如贩卖游戏道具、游戏装备等；
				<br> （5）冒充康盛、网络游戏管理员或康盛游戏论坛管理员、版主发布任何诈骗或虚假信息； <br>
				（6）发表、转发、传播含有谩骂、诅咒、诋毁、攻击、诽谤、侵害康盛和/或第三方权益内容的，或者含有封建迷信、淫秽、色情、下流、恐怖、暴力、凶杀、赌博、反动、扇动民族仇恨、危害祖国统一、颠覆国家政权等让人反感、厌恶的内容的非法言论，或者设置含有上述内容的网名、游戏角色名；
				<br> （7）在网络游戏当中进行恶意刷屏、恶意踢人、恶意耗时等恶意破坏游戏公共秩序的行为； <br>
				（8）利用网络游戏故意传播恶意程序或计算机病毒，或者利用网络游戏发表、转发、传播侵犯第三方知识产权、肖像权、姓名权、名誉权、隐私或其他合法权益的文字、图片、照片、程序、视频、图象和/或动画等资料。
				<br> 4.
				您充分理解到：网络游戏的相关游戏数据将会占据网络游戏的服务器空间。长时间保留您在使用和享受网络游戏网络游戏产品及服务的过程中所产生的全部游戏数据，将会大量地挤占服务器空间，影响您及其他用户的游戏速度，增加康盛的运营成本，是完全没有必要的。因此，康盛将会定期将服务器上存储的一些过往的游戏数据转移或者永久地删除。
				<br> 5.
				康盛一向遵守国家有关保护青少年身心健康的法律、政策，会按照国家的相关法规保护青少年的身心健康，您会遵守国家相关的法规及康盛根据相关法规制定的关于保护青少年身心健康各种规则。
				<br> 6.
				康盛可能会通过网络游戏官方网站、客服电话、游戏论坛、游戏管理员或者其他的途径，向您提供诸如游戏规则说明、BUG或外挂投诉、游戏物品找回、游戏物品锁定或解除锁定等客户服务，您应当：
				<br>
				（1）通过康盛客服官方网站或者康盛提供的其他途径了解这些客户服务的内容、要求以及资费，谨慎选择是否需要享受相应的客户服务，真实地准确地表达您的需求；
				<br> （2）同意并接受康盛关于该等客户服务的专门协议或条款； <br>
				（3）按照康盛的要求如实提供您的包括有效身份信息在内的个人信息和游戏情况，及您掌握的其他用户或网络游戏本身的情况，例如：您网络游戏的登录情况和游戏物品情况，网络游戏当中存在的BUG、外挂及您知晓的其他玩家使用BUG或外挂的情况。
				<br> 7. 您如有任何违反协议或相关法规的，康盛有权采取下列措施当中的一种或几种： <br>
				（1）立即断开您当前使用的计算机与网络游戏服务器之间的网络连接，您必须重新登录才能继续使用网络游戏； <br>
				（2）暂时禁止您凭借当前使用的论坛帐号登录网络游戏； <br>
				（3）暂时禁止您使用在当前使用的论坛帐号项下创建的某一网络游戏游戏角色； <br>
				（4）暂时将您当前论坛帐号项下的某一网络游戏游戏角色的活动范围限定在某一特定的游戏区域； <br>
				（5）降低或者清除您当前使用的论坛帐号在网络游戏当中的积分、等级和/或荣誉； <br>
				（6）暂时禁止您凭借当前使用的论坛帐号在网络游戏当中发表任何言论； <br>
				（7）永久性地、不可撤销地将您发布的广告、虚假信息或者非法言论删除，或者采取其他的阻止其传播的措施； <br>
				（8）永久性地、不可撤销地将您非法获取的积分、等级或荣誉取消或清零； <br>
				（9）永久性地、不可撤销地禁止您凭借当前使用的论坛帐号在网络游戏当中发表任何言论； <br>
				（10）永久性地、不可撤销地删除您当前使用的论坛帐号项下的所有游戏道具、游戏装备、游戏币、积分、等级、荣誉等资料以及相应的游戏数据； <br>
				（11）采取上列措施之外的其他的措施。 <br> 8.
				您充分理解到：用户从事违反约定或相关法规的行为，是一种即时性的瞬间消失的行为。目前，网络游戏企业通常是在服务器软件和/或客户端软件中设置安全程序，由这种安全程序对接收到的从用户使用的计算机上传输过来的游戏数据进行分析判断。如果接收到游戏数据符合这种安全程序当中事先设定的多项分析指标，或者多次符合其中设定的某一项或某几项指标，则网络游戏企业可能据此判断用户从事了违反约定或相关法规行为。当然，网络游戏企业也可能会采取与上列方式不同的方式进行分析判断。但无论康盛采取何种方式对用户从事的违反约定或相关法规的行为进行判断，您同意均以康盛提供的相关数据和判断方式、标准等为准，对此您没有异议。
				<br> 9.
				您充分理解到：网络游戏企业根据安全程序所做出的分析判断都不是100%准确无误的，康盛也不例外。康盛将尽最力提高安全程序的性能。但康盛不保证也不承诺：其通过该种安全程序所作出的分析、判断就一定是100%准确的。对此，您是给予充分理解并谅解的。如果康盛做出了错误判断据此判断给您造成了损失的，您愿意自行承担，康盛将不给予任何赔偿。
				<br> 10.
				您充分理解到：用户可能从事的违反约定或相关法规的行为，是一种即时性的瞬间即可让众多用户知晓的行为。康盛如果不立即采取各种处理措施，可能会造成非常严重非常恶劣的后果。对此，您是给予充分理解的，并完全同意康盛采取相关措施对相关违反约定或相关法规行为进行处理。
				<br> 11.
				您如果对康盛就您使用的论坛帐号采取的相关措施有异议，则应当在知道康盛采取该等措施之日7个工作日内向康盛客户服务反馈，提供相应的情况，说明您的异议理由。康盛将会根据您提供的情况及说明的理由自行判断是否应当终止执行该等措施。但这不会导致该等措施无效，也不影响异议期间该等措施的执行。康盛客户服务如果在采取该等措施3个月未接到任何反馈的，则视为您没有任何异议，康盛不再接受任何有关的反馈。
				<br> 12.
				您充分理解到：有使用期限的游戏道具、游戏装备，其使用期限自您获得该游戏道具、游戏装备时起计算。因您从事违反约定或法规行为而导致康盛对您的账号采取相关措施，可能会导致您当前使用的论坛帐号项下的有使用期限的游戏道具、游戏装备因使用期限在康盛采取上述措施期间届满而无法继续使用，由此给您造成损失由您自行承担，康盛将不给予任何补偿。换言之，康盛采取上述措施所持续的时间是计算在有使用期限的游戏道具、游戏装备的使用期限当中的；该等措施执行终止后，游戏道具、游戏装备的使用期限并不会因此续延。
				<br> 13.
				网络游戏和/或其附属的商店内出售的游戏物品，没有标明使用期限，或者其标明的使用期限为“永久”、“无限期”或“无限制”的游戏物品，仅指在康盛运营网络游戏期间可以无限期使用，其使用期限即为自您获得该游戏物品之日起至网络游戏终止运营（无论何种原因导致的终止运营）之日止。一旦因为各种原因导致本协议被终止或者网络游戏终止运营，您将无法继续使用该等游戏物品，康盛对您本人或任何第三方均不负任何损害赔偿或退款责任。
				<br> 14.
				康盛保留随时地、不事先通知地、不需要任何理由地、单方面地中止、终止本协议或提供相关网络游戏服务的权利。该等中止、终止，可能是因为康盛公司解散、注销、合并、分立，也可能是因为康盛将网络游戏或其运营权转让给了第三方，还可能是因为国家法律、法规、政策及国家机关的命令或者其他的诸如地震、火灾、海啸、台风、罢工、战争等不可抗力事件，还可能是上列原因之外的其他原因。若康盛的该等中止、终止行为给你造成任何损失的，您同意不向康盛主张任何赔偿或其他责任。
				<br> 15. 账号使用与保管 <br>
				（1）康盛有权审查您注册所提供的身份信息是否真实、有效，并应积极地采取技术与管理等合理措施保障您账号的安全、有效；您有义务妥善保管其账号及密码，并正确、安全地使用您的账号及密码。任何一方未尽上述义务导致账号密码遗失、账号被盗等情形而给您和他人的民事权利造成损害的，应当承担由此产生的法律责任。
				<br> （2）您对登录后所持账号产生的行为依法享有权利和承担责任。 <br>
				（3）您发现您的账号或密码被他人非法使用或有使用异常的情况的，应及时根据康盛公布的处理方式通知康盛，并有权通知康盛采取措施暂停该账号的登录和使用。
				<br>
				（4）康盛根据您的通知采取措施暂停用户账号的登录和使用的，康盛应当要求您提供并核实与其注册身份信息相一致的个人有效身份信息。 <br>
				（5）康盛核实您所提供的个人有效身份信息与所注册的身份信息相一致的，应当及时采取措施暂停用户账号的登录和使用。 <br>
				（6）康盛违反（5）款项的约定，未及时采取措施暂停用户账号的登录和使用，因此而给您造成损失的，应当承担其相应的法律责任。 <br>
				（7）您没有提供真实的个人有效身份证件或者您提供的个人有效身份证件与所注册的身份信息不一致的，康盛有权拒绝您依据本条第（3）项提出的请求。
				<br>
				（8）您为了维护您的合法权益，向康盛提供与所注册的身份信息相一致的个人有效身份信息时，康盛应当为您提供账号注册人证明、原始注册信息等必要的协助和支持，并根据需要向有关行政机关和司法机关提供相关证据信息资料。
				<br> 16. 服务的中止与终止 <br>
				（1）您有发布违法信息、严重违背社会公德、以及其他违反法律禁止性规定的行为，康盛有权立即终止对您提供服务。 <br>
				（2）您在接受康盛服务时实施违反约定或相关法规的不正当行为的，康盛有权终止对您提供服务。 <br>
				（3）您没有以真实的个人身份信息进行注册，或实施违反本协议或相关法规的行为，康盛有权中止对您提供全部或部分服务；康盛采取中止措施会以合适的方式通知您并告知中止期间，中止期间是合理的，中止期间届满康盛应当及时恢复对您的服务。
				<br> （4）康盛根据本条约定中止或终止对您提供部分或全部服务的，康盛应负举证责任。 <br> 17.
				用户信息保护 <br>
				（1）康盛要求您提供与其个人身份有关的信息资料时，会事先以明确而易见的方式向您公开其隐私权保护政策和个人信息利用政策，并采取必要措施保护您的个人信息资料的安全。
				<br>
				（2）未经您许可康盛不得向任何第三方提供、公开或共享您注册资料中的姓名、个人有效身份证件号码、联系方式、家庭住址等个人身份信息，但下列情况除外：
				<br> A. 您或您的监护人授权康盛披露的； <br> B. 有关法律要求康盛披露的； <br> C.
				司法机关或行政机关基于法定程序要求康盛提供的； <br> D.康盛为了维护自己合法权益而向您提起诉讼或者仲裁时； <br>
				E.应您的监护人的合法要求而提供您个人身份信息时。 <br> <br>
				四、服务声明康盛公司特别提请您注意，康盛公司为了保障公司业务发展和调整的自主权，康盛公司拥有随时修改或中断服务而不需通知您的权利，康盛公司行使修改或中断服务的权利不需对您或任何第三方负责。您必须在同意本条款的前提下，康盛公司才开始对您提供服务。
				<br> <br> 五、适用法律 <br>
				本服务条款的解释，效力及纠纷的解决，适用于中华人民共和国大陆法律。 <br>
				若您和康盛之间发生任何纠纷或争议，首先应友好协商解决，协商不成的，您在此完全同意将纠纷或争议提交康盛所在地北京市海淀区人民法院管辖。康盛公司拥有对以上各项条款内容的解释权及修改权。
				<br> <br> 康盛公司 <br> <br> <br>
			</div>
			<div>
				<button class="btnyes" onclick="yes()">
					<em>同意</em>
				</button>
				<button class="btnno" onclick="no()">
					<em>不同意</em>
				</button>
			</div>
		</div>
</body>
</html>