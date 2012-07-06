	var delta=0.8;
	var collection;
	var closeB=false;
	function floaters() {
		this.items	= [];
		this.addItem	= function(id,x,y,content)
				  {
					document.write('<DIV id='+id+' style="Z-INDEX: 10; POSITION: absolute;  width:80px; height:60px;left:'+(typeof(x)=='string'?eval(x):x)+';top:'+(typeof(y)=='string'?eval(y):y)+'">'+content+'</DIV>');
					
					var newItem				= {};
					newItem.object			= document.getElementById(id);
					newItem.x				= x;
					newItem.y				= y;

					this.items[this.items.length]		= newItem;
				  }
		this.play	= function()
				  {
					collection				= this.items
					setInterval('play()',30);
				  }
		}
		function play()
		{
			if(screen.width<=800 || closeB)
			{
				for(var i=0;i<collection.length;i++)
				{
					collection[i].object.style.display	= 'none';
				}
				return;
			}
			for(var i=0;i<collection.length;i++)
			{
				var followObj		= collection[i].object;
				var followObj_x		= (typeof(collection[i].x)=='string'?eval(collection[i].x):collection[i].x);
				var followObj_y		= (typeof(collection[i].y)=='string'?eval(collection[i].y):collection[i].y);

				if(followObj.offsetLeft!=(document.documentElement.scrollLeft+followObj_x)) {
					var dx=(document.documentElement.scrollLeft+followObj_x-followObj.offsetLeft)*delta;
					dx=(dx>0?1:-1)*Math.ceil(Math.abs(dx));
					followObj.style.left=followObj.offsetLeft+dx;
					}

				if(followObj.offsetTop!=(document.documentElement.scrollTop+followObj_y)) {
					var dy=(document.documentElement.scrollTop+followObj_y-followObj.offsetTop)*delta;
					dy=(dy>0?1:-1)*Math.ceil(Math.abs(dy));
					followObj.style.top=followObj.offsetTop+dy;
					}
				followObj.style.display	= '';
			}
		}	
		function closeBanner()
		{
			document.getElementById("followDiv3").innerHTML="";
			
		}

	var theFloaters		= new floaters();
	//
	theFloaters.addItem('followDiv1','document.documentElement.clientWidth-118',160,'<table width="118" border="0" cellpadding="0" cellspacing="0">	    <tr><td><img src="images/kefu_up.gif" width="118" height="46" ></td></tr><tr><td height="40" align="center" background="images/kefu_middle.gif"><font color="#CC0000">客服电话：<br/><b>0312-3494810</b><br/>客服手机：<br/><b>13082378907</b><br/>QQ在线客服<br/><a href="http://wpa.qq.com/msgrd?V=1&Uin=1939497348&Site=乌梢蛇佛手胶囊&Menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=1:1939497348:8" alt="在线咨询" border="0"></a><br></td></tr><tr><td><img src="images/kefu_down.gif" width="118" height="38" ></font></td></tr></table>');
	theFloaters.play();