window.onload=function(){
	
}

var f=false;
var e=false;
var d=false;

function showyqm(){
	var inforyqm=document.getElementById("inforyqm");
	var infortishi=document.getElementById("infortishi");
	var	yqm=document.getElementById("yqm");
	infortishi.style.display="none";
	inforyqm.style.display="block";
	inforyqm.style.float="right";
	inforyqm.style.marginRight=172+'px';
	inforyqm.style.marginTop=13+'px';
	yqm.style.borderColor="#848484 #E0E0E0 #E0E0E0 #848484;";
	yqm.style.backgroundColor="white";
}

function showtishi(){
	var infortishi=document.getElementById("infortishi");
	var inforyqm=document.getElementById("inforyqm");
	var	yqm=document.getElementById("yqm");
	inforyqm.style.display="none";
	infortishi.style.display="block";
	infortishi.style.float="right";
	infortishi.style.marginRight=87+'px';
	infortishi.style.marginTop=13+'px';
	yqm.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
	yqm.style.backgroundColor="#FDF4F4";
}

function showyhm(){	
	var inforyhm=document.getElementById("inforyhm");
	var inforyhmts=document.getElementById("inforyhmts");
	var	username=document.getElementById("username");
	var yhmable=document.getElementById("yhmable");
	var yhmdisable=document.getElementById("yhmdisable");
	inforyhm.style.display="none";
	yhmable.style.display="none";
    yhmdisable.style.display="none";
	inforyhmts.style.display="block";
	inforyhmts.style.float="right";
	inforyhmts.style.marginRight=245+'px';
	inforyhmts.style.marginTop=13+'px';
	username.style.borderColor="#848484 #E0E0E0 #E0E0E0 #848484;";
	username.style.backgroundColor="white";
}

function yhmtishi(){
	var regUser = /^[\u4e00-\u9fa5_a-zA-Z0-9_]{3,15}$/;
	var name = $("#username").val();
	var inforyhm=document.getElementById("inforyhm");
	var inforyhmts=document.getElementById("inforyhmts");
	var yhmable=document.getElementById("yhmable");
	var yhmdisable=document.getElementById("yhmdisable");
	var	username=document.getElementById("username");
	$.ajax({
		   type: "POST",
		   url: "ChecknameServlet",
		   data: "name="+ name,
		   success: function(msg){
	         if (regUser.test(name)) {
	        	 if(msg == 0){
	        		 inforyhmts.style.display="none";
	        	     inforyhm.style.display="none";
	        	     yhmdisable.style.display="none";
	        	     yhmable.style.display="block";
	        	     yhmable.style.float="right";
	        	     yhmable.style.marginRight=325+'px';
	        	     yhmable.style.marginTop=13+'px';
	        		 username.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
	        		 username.style.backgroundColor="#FDF4F4";
	        	 }else{
	        		 inforyhmts.style.display="none";
	        	     inforyhm.style.display="none";	        	     
	        	     yhmable.style.display="none";
	        	     yhmdisable.style.display="block";
	        	     yhmdisable.style.float="right";
	        	     yhmdisable.style.marginRight=310+'px';
	        	     yhmdisable.style.marginTop=13+'px';
	        		 username.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
	        		 username.style.backgroundColor="#FDF4F4";
	        	 }
	         } else{
	        	    inforyhmts.style.display="none";
	        	    yhmable.style.display="none";
        	        yhmdisable.style.display="none";
	        		inforyhm.style.display="block";
	        		inforyhm.style.float="right";
	        		inforyhm.style.marginRight=252+'px';
	        		inforyhm.style.marginTop=13+'px';
	        		username.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
	        		username.style.backgroundColor="#FDF4F4";
	  }
		   }
	});	
	
}

function showmima(){
	var informima=document.getElementById("informima");
	var informimats=document.getElementById("informimats");
	var mimaable=document.getElementById("mimaable");
	var	mima=document.getElementById("mima");
	informimats.style.display="none";
	mimaable.style.display="none";
	informima.style.display="block";
	informima.style.float="right";
	informima.style.marginRight=210+'px';
	informima.style.marginTop=13+'px';
	informima.style.color="black";
	mima.style.borderColor="#848484 #E0E0E0 #E0E0E0 #848484;";
	mima.style.backgroundColor="white";
}

function mimatishi(){
	var regMima = /^\w{8,20}$/;
	var psd=$("#mima").val();
	var informima=document.getElementById("informima");
	var informimats=document.getElementById("informimats");
	var mimaable=document.getElementById("mimaable");
	var	mima=document.getElementById("mima");
	if (regMima.test(psd)) {
	     informima.style.display="none";
	     informimats.style.display="none";
	     mimaable.style.display="block";
	     mimaable.style.float="right";
	     mimaable.style.marginRight=338+'px';
	     mimaable.style.marginTop=13+'px';
	mima.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
	mima.style.backgroundColor="#FDF4F4";
	} else {
		informima.style.display="none";
		informimats.style.display="block";
		mimaable.style.display="none";
		informimats.style.float="right";
		informimats.style.marginRight=270+'px';
		informimats.style.marginTop=13+'px';
		mima.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
		mima.style.backgroundColor="#FDF4F4";
	}
}

function showremima(){
	var remima=document.getElementById("remima");
	var mimabxt=document.getElementById("mimabxt");
	var mimaxt=document.getElementById("mimaxt");
	var	rmima=document.getElementById("rmima");
	mimabxt.style.display="none";
	mimaxt.style.display="none";
	remima.style.display="block";
	remima.style.float="right";
	remima.style.marginRight=302+'px';
	remima.style.marginTop=13+'px';
	remima.style.color="black";
	rmima.style.borderColor="#848484 #E0E0E0 #E0E0E0 #848484;";
	rmima.style.backgroundColor="white";
}

function remimatishi(){
	var psd=$("#mima").val();
	var rpsd=$("#rmima").val();
	var remima=document.getElementById("remima");
	var mimabxt=document.getElementById("mimabxt");
	var mimaxt=document.getElementById("mimaxt");
	var	rmima=document.getElementById("rmima");
	if(psd==rpsd){
		mimabxt.style.display="none";
		mimaxt.style.display="block";
		remima.style.display="none";
		mimaxt.style.float="right";
		mimaxt.style.marginRight=302+'px';
		mimaxt.style.marginTop=13+'px';
		rmima.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
		rmima.style.backgroundColor="#FDF4F4";
	}else{
		mimabxt.style.display="block";
		mimaxt.style.display="none";
		remima.style.display="none";
		mimabxt.style.float="right";
		mimabxt.style.marginRight=290+'px';
		mimabxt.style.marginTop=13+'px';
		rmima.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
		rmima.style.backgroundColor="#FDF4F4";
	}
	
}

function showemail(){
	var temail=document.getElementById("temail");
	var inforemail=document.getElementById("inforemail");
	var	email=document.getElementById("email");
	inforemail.style.display="none";
	temail.style.display="block";
	temail.style.float="right";
	temail.style.marginRight=266+'px';
	temail.style.marginTop=13+'px';
	email.style.borderColor="#848484 #E0E0E0 #E0E0E0 #848484;";
	email.style.backgroundColor="white";
}

function emailtishi(){
	var temail=document.getElementById("temail");
	var inforemail=document.getElementById("inforemail");
	var	email=document.getElementById("email");
	temail.style.display="none";
	inforemail.style.display="block";
	inforemail.style.float="right";
	inforemail.style.marginRight=302+'px';
	inforemail.style.marginTop=13+'px';
	email.style.borderColor="#F66 #FFBDB9 #FFBDB9 #F66";
	email.style.backgroundColor="#FDF4F4";
}

function getRegist(){
	var regUser = /^[\u4e00-\u9fa5_a-zA-Z0-9_]{3,15}$/;
	var name = $("#username").val();
	$.ajax({
		   type: "POST",
		   url: "ChecknameServlet",
		   data: "name="+ name,
		   success: function(msg){
	         if (regUser.test(name)) {
	        	 if(msg == 0){
	        		 f=true;
	        	 }else{
	        		 f=false;
	        	 }
	         } else{
	        		f=false;
	  }
		   }
	});	
	var regMima = /^\w{8,20}$/;
	var psd=$("#mima").val();
	var rpsd=$("#rmima").val();
	if (regMima.test(psd)) {
		d=true;
	}else{
		d=false;
	}
	if(psd==rpsd){
		e=true;
	}else{
		e=false;
	}
	if(f==true && e==true && d==true){
		alert("注册成功!");
		return true;
	}else{
		alert("注册失败!");
		return false;
	}
	
}

window.onscroll = function() {
	var scrolltop = document.body.scrollTop || document.documentElement.scrollTop;
	if(scrolltop >= 120) {
		document.getElementById("nav1").style.position = 'fixed';
		document.getElementById("nav1").style.top = 0;		
	} else {
		document.getElementById("nav1").style.position = 'static';
	}
}

var showDoc = function(me) {
	var doc = document.getElementById("doc");
	doc.style.display = 'block';
}

var hideDoc = function(me) {
	var doc = document.getElementById("doc");
	doc.style.display = 'none';
}

var showDoc1 = function(me) {
	var doc1 = document.getElementById("doc1");
	doc1.style.display = 'block';
}

var hideDoc1 = function(me) {
	var doc1 = document.getElementById("doc1");
	doc1.style.display = 'none';
}

var showDoc2 = function(me) {
	var doc2 = document.getElementById("doc2");
	doc2.style.display = 'block';
}

var hideDoc2 = function(me) {
	var doc2 = document.getElementById("doc2");
	doc2.style.display = 'none';
}

var showList = function(me) {
	var doc = document.getElementById("kjmenu");
	kjmenu.style.display = 'block';
}

var hideList = function(me) {
	var doc = document.getElementById("kjmenu");
	kjmenu.style.display = 'none';
}