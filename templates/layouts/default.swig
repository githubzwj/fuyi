{% import "../mixins/flash-messages.swig" as FlashMessages %}

<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<title>{{ title|default("尊润资产") }}</title>
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

		{# Customise the stylesheet for your site by editing /public/styles/site.less
		//- All .less files will be automatically compiled and minified in production. #}
		<link href="/styles/site.min.css" rel="stylesheet">

		{# This file provides the default styling for the KeystoneJS Content Editor #}
		{%- if user and user.canAccessKeystone -%}
			<link href="/keystone/styles/content/editor.min.css" rel="stylesheet">
		{%- endif -%}

		{# HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries
		   Safely remove this block if you are not targeting IE8 #}
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

		{# Include template-specific stylesheets by extending the css block #}
		{%- block css %}{% endblock -%}

		{# Add any other template-specific HEAD tags by extending the head block #}
		{%- block head %}{% endblock %}
		
        <link rel="stylesheet" type="text/css" media="all" href="/themes/50494/wp-content/themes/theme50494/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" media="all" href="/themes/50494/wp-content/themes/theme50494/bootstrap/css/responsive.css"/>
        <link rel="stylesheet" type="text/css" media="all" href="/themes/50494/wp-content/themes/CherryFramework/css/camera.css"/>
        <link rel="stylesheet" type="text/css" media="all" href="/themes/50494/wp-content/themes/theme50494/style.css"/>
        <link rel='stylesheet' id='flexslider-css' href='/themes/50494/wp-content/plugins/cherry-plugin/lib/js/FlexSlider/flexslider.css?ver=2.2.0' type='text/css' media='all'/>
        <link rel='stylesheet' id='owl-carousel-css' href='/themes/50494/wp-content/plugins/cherry-plugin/lib/js/owl-carousel/owl.carousel.css?ver=1.24' type='text/css' media='all'/>
        <link rel='stylesheet' id='owl-theme-css' href='/themes/50494/wp-content/plugins/cherry-plugin/lib/js/owl-carousel/owl.theme.css?ver=1.24' type='text/css' media='all'/>
        <link rel='stylesheet' id='font-awesome-css' href='http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css?ver=3.2.1' type='text/css' media='all'/>
        <link rel='stylesheet' id='cherry-plugin-css' href='/themes/50494/wp-content/plugins/cherry-plugin/includes/css/cherry-plugin.css?ver=1.2' type='text/css' media='all'/>
        <link rel='stylesheet' id='cherry-parallax-css' href='/themes/50494/wp-content/plugins/cherry-parallax/css/parallax.css?ver=1.0' type='text/css' media='all'/>
        <link rel='stylesheet' id='contact-form-7-css' href='/themes/50494/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=3.8' type='text/css' media='all'/>
        <link rel='stylesheet' id='theme50494-css' href='/themes/50494/wp-content/themes/theme50494/main-style.css' type='text/css' media='all'/>
        <link rel='stylesheet' id='magnific-popup-css' href='/themes/50494/wp-content/themes/CherryFramework/css/magnific-popup.css?ver=0.9.3' type='text/css' media='all'/>
        <link rel='stylesheet' id='options_typography_Istok+Web-css' href='http://fonts.googleapis.com/css?family=Istok+Web&#038;subset=latin' type='text/css' media='all'/>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery-1.7.2.min.js?ver=1.7.2'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/theme50494/js/parallaxSlider.js?ver=1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/theme50494/js/wpcf7.js?ver=1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery-migrate-1.2.1.min.js?ver=1.2.1'></script>
        <script type='text/javascript' src='/themes/50494/wp-includes/js/swfobject.js?ver=2.2-20120417'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/modernizr.js?ver=2.0.6'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jflickrfeed.js?ver=1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/plugins/cherry-plugin/lib/js/jquery.easing.1.3.js?ver=1.3'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/custom.js?ver=1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/bootstrap/js/bootstrap.min.js?ver=2.3.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/plugins/cherry-plugin/lib/js/elasti-carousel/jquery.elastislide.js?ver=1.2'></script>
        <link rel="EditURI" type="application/rsd+xml" title="RSD" href="./xmlrpc.php?rsd"/>
		<script>
         var system_folder = '/wp-content/themes/CherryFramework/admin/data_management/',
        	 CHILD_URL ='/wp-content/themes/theme50494',
        	 PARENT_URL = '/wp-content/themes/CherryFramework',
        	 CURRENT_THEME = 'theme50494'</script>
        <style type='text/css'></style>
        <style type='text/css'>h1{font:bold 24px/30px Istok Web;color:#1e2731;}h2{font:normal 24px/30px Istok Web;color:#e22004;}h3{font:bold 24px/30px Istok Web;color:#1e2731;}h4{font:normal 16px/26px Istok Web;color:#e22004;}h5{font:bold 24px/21px Istok Web;color:#1e2731;}h6{font:normal 16px/21px Istok Web;color:#424f5e;}body{font-weight:normal;}.logo_h__txt,.logo_link{font:bold 60px/60px Istok Web;color:#1e2731;}.sf-menu>li>a{font:normal 13px/18px Istok Web;color:#252d2c;}.nav.footer-nav a{font:normal 18px/26px Istok Web;color:#ffffff;}</style>
        <!--[if lt IE 8]>
        	<div style=' clear: both; text-align:center; position: relative;'>
        		<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" alt="" /></a>
        	</div>
        	<![endif]-->
        <!--[if gte IE 9]><!-->
        <script src="/themes/50494/wp-content/themes/CherryFramework/js/jquery.mobile.customized.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        			jQuery(function(){
        				jQuery('.sf-menu').mobileMenu({defaultText: "Navigate to..."});
        			});
        		</script>
        <!--<![endif]-->
        <script type="text/javascript">
        		// Init navigation menu
        		jQuery(function(){
        		// main navigation init
        			jQuery('ul.sf-menu').superfish({
        				delay: 1000, // the delay in milliseconds that the mouse can remain outside a sub-menu without it closing
        				animation: {
        					opacity: "show",
        					height: "show"
        				}, // used to animate the sub-menu open
        				speed: "normal", // animation speed
        				autoArrows: true, // generation of arrow mark-up (for submenu)
        				disableHI: true // to disable hoverIntent detection
        			});
        
        		//Zoom fix
        		//IPad/IPhone
        			var viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]'),
        				ua = navigator.userAgent,
        				gestureStart = function () {
        					viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6, initial-scale=1.0";
        				},
        				scaleFix = function () {
        					if (viewportmeta && /iPhone|iPad/.test(ua) && !/Opera Mini/.test(ua)) {
        						viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0";
        						document.addEventListener("gesturestart", gestureStart, false);
        					}
        				};
        			scaleFix();
        		})
        	</script>
         
        <script type="text/javascript">
        		jQuery(document).ready(function(){
        			if(!device.mobile() && !device.tablet()){
        				jQuery('.header_block').tmStickUp({
        					correctionSelector: jQuery('#wpadminbar')
        				,	active: true				});
        			}
        		})
        	</script>
        <script type="text/javascript">
        /* <![CDATA[ */
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-7078796-5']);
        _gaq.push(['_trackPageview']);
        
        (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
        
        (function(b){(function(a){"__CF"in b&&"DJS"in b.__CF?b.__CF.DJS.push(a):"addEventListener"in b?b.addEventListener("load",a,!1):b.attachEvent("onload",a)})(function(){"FB"in b&&"Event"in FB&&"subscribe"in FB.Event&&(FB.Event.subscribe("edge.create",function(a){_gaq.push(["_trackSocial","facebook","like",a])}),FB.Event.subscribe("edge.remove",function(a){_gaq.push(["_trackSocial","facebook","unlike",a])}),FB.Event.subscribe("message.send",function(a){_gaq.push(["_trackSocial","facebook","send",a])}));"twttr"in b&&"events"in twttr&&"bind"in twttr.events&&twttr.events.bind("tweet",function(a){if(a){var b;if(a.target&&a.target.nodeName=="IFRAME")a:{if(a=a.target.src){a=a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);b=0;for(var c;c=a[b];++b)if(c.indexOf("url")===0){b=unescape(c.split("=")[1]);break a}}b=void 0}_gaq.push(["_trackSocial","twitter","tweet",b])}})})})(window);
        /* ]]> */
        </script>
        
         
        
	</head>
	<body  class="home page page-id-203 page-template page-template-page-home-php">
<div id="motopress-main" class="main-holder">
		{# HEADER #}
		<div id="header" class="motopress-wrapper header">
<div class="container">
<div class="row">
<div class="span12" 
					 data-motopress-wrapper-type="header" data-motopress-id="5590bee611b12">
	<div class="header_block">					 
					 <div class="row">
					 
					 <div class="span4" data-motopress-type="static"
						 data-motopress-static-file="static/static-logo.php">

						<div class="logo pull-left">
							<a href="../../" class="logo_h logo_h__img"><img
									src="/themes/50494/wp-content/themes/theme50494/images/logo.png" alt="Empire"
									title="investment"></a>

							<p class="logo_tagline">investment</p>
						</div>
					</div>
					
			{# Customise your site"s navigation by changing the navLinks Array in ./routes/middleware.js
			   ... or completely change this header to suit your design. #}
			<div role="navigation" class="span8">
				<div data-motopress-type="static" data-motopress-static-file="static/static-nav.php">
				
						<nav class="nav nav__primary clearfix">
						
						
					<div class="collapse navbar-collapse">
						<ul id="topnav" class="sf-menu">
							{%- for link in navLinks -%}
								{%- set linkClass = '' -%}
								{%- if link.key == section -%}
									{%- set linkClass = ' class="current-menu-item page_item page-item-203 current_page_item"' -%}
								{%- endif %}
								
								<li{{ linkClass | safe  }}>
									<a href="{{ link.href }}">{{ link.label }}</a>
									{% if link.childLinks %}
										<ul class="sub-menu">
										{%for childLink in link.childLinks %}
											<li class="menu-item menu-item-type-post_type menu-item-object-page">
												<a href="{{ childLink.href }}">{{childLink.label}}</a>
											</li>
										{%- endfor %}
										</ul>
									{%- endif %}
								</li>
							{%- endfor %}
						</ul>
						{#
						<ul class="nav navbar-nav navbar-right">
							{% if user -%}
								{%- if user.canAccessKeystone -%}
									<li><a href="/keystone">进入后台</a></li>
								{%- endif -%}
								<li><a href="/keystone/signout">退出</a></li>
							{%- else -%}
								<li><a href="/keystone/signin">登录</a></li>
							{%- endif %}
						</ul>
						#}
					</div>
					</nav>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>

		{# BODY #}
		<div id="body">
			{# NOTE:
			   There is no .container wrapping class around body blocks to allow more flexibility in design.
			   Remember to include it in your templates when you override the intro and content blocks! #}

			{# The Intro block appears above flash messages (used for temporary information display) #}
			{%- block intro -%}{%- endblock -%}

			{# Flash messages allow you to display once-off status messages to users, e.g. form
			   validation errors, success messages, etc. #}
			{{ FlashMessages.renderMessages(messages) }}

			{# The content block should contain the body of your template"s content #}
			{%- block content -%}{%- endblock -%}
		</div>

		{# FOOTER #}
		
		
		<footer class="motopress-wrapper footer">
        		<div class="container">
        			<div class="row">
        				<div class="span12" data-motopress-wrapper-file="wrapper/wrapper-footer.php"
        					 data-motopress-wrapper-type="footer" data-motopress-id="5590bee6849ac">
        					<div class="footer-widgets">
        						<div class="row">
        							<div class="span4" data-motopress-type="dynamic-sidebar"
        								 data-motopress-sidebar-id="footer-sidebar-1">
        								<div class="block_1">
        									<div id="text-8"><h4>尊润资产</h4>
        										<div class="textwidget">
        										上海市长宁区种德桥路2号-1
        										</div>
        									</div>
        								</div>
        							</div>
        							<div class="span4" data-motopress-type="dynamic-sidebar"
        								 data-motopress-sidebar-id="footer-sidebar-2">
        								<div class="block_2">
        									<div id="text-9"><h4>给我们打电话或发送传真:</h4>
        										<div class="textwidget">
        											<strong><em>021-62030557</em>Telephone:</strong>
        											<strong><em>021-62030551</em>FAX:</strong>
												</div>
        									</div>
        								</div>
        							</div>
        							<div class="span4" data-motopress-type="dynamic-sidebar"
        								 data-motopress-sidebar-id="footer-sidebar-3">
        								<div class="block_3">
        									<div id="text-10"><h4>给我们留言:</h4>
        										<div class="textwidget">
        											<a href="mailto:qisong88888@163.com"><span class="__cf_email__">qisong88888@163.com</span></a>
        										</div>
        									</div>
        								</div>
        							</div>
        						</div>
        					</div>
        					<div class="copyright">
        						<div class="row">
        							<div class="span12" data-motopress-type="static"
        								 data-motopress-static-file="static/static-footer-text.php">
        								<div id="footer-text" class="footer-text">
        									&copy; 2015 <a href="http://www.lit8.cn" title="lit8">lit8</a>
        
        								</div>
        							</div>
        						</div>
        
        						
        
        						<div class="row">
        							<div class="span12" data-motopress-type="static"
        								 data-motopress-static-file="static/static-footer-nav.php">
        							</div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</footer>
		
</div>

{# TOP #}
<div id="back-top-wrapper" class="visible-desktop">
	<p id="back-top">
		<a href="#top"><span></span></a></p>
</div>

		{# JAVASCRIPT #}

		<script type='text/javascript' src='/themes/50494/wp-includes/js/comment-reply.min.js?ver=3.9.5'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/plugins/cherry-parallax/js/cherry.parallax.js?ver=1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/plugins/cherry-parallax/js/device.min.js?ver=1.0.0'></script>
        <script type='text/javascript'
        		src='/themes/50494/wp-content/plugins/contact-form-7/includes/js/jquery.form.min.js?ver=3.50.0-2014.02.05'></script>
        <script type='text/javascript'>
        	/* <![CDATA[ */
        	var _wpcf7 = {
        		"loaderUrl": "\/themes\/50494\/wp-content\/plugins\/contact-form-7\/images\/ajax-loader.gif",
        		"sending": "Sending ..."
        	};
        	/* ]]> */
        </script>
        <script type='text/javascript' src='/themes/50494/wp-content/plugins/contact-form-7/includes/js/scripts.js?ver=3.8'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/theme50494/js/smoothing-scroll.js?ver=1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/superfish.js?ver=1.5.3'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery.mobilemenu.js?ver=1.0'></script>
        <script type='text/javascript'
        		src='/themes/50494/wp-content/themes/CherryFramework/js/jquery.magnific-popup.min.js?ver=0.9.3'></script>
        <script type='text/javascript'
        		src='/themes/50494/wp-content/plugins/cherry-plugin/lib/js/FlexSlider/jquery.flexslider-min.js?ver=2.2.2'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jplayer.playlist.min.js?ver=2.3.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery.jplayer.min.js?ver=2.6.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/tmstickup.js?ver=1.0.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/device.min.js?ver=1.0.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery.zaccordion.min.js?ver=2.1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/camera.min.js?ver=1.3.4'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery.debouncedresize.js?ver=1.0'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery.ba-resize.min.js?ver=1.1'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/themes/CherryFramework/js/jquery.isotope.js?ver=1.5.25'></script>
        <script type='text/javascript' src='/themes/50494/wp-content/plugins/cherry-plugin/includes/js/cherry-plugin.js?ver=1.2'></script>
        
        <script type="text/javascript">/* CloudFlare analytics upgrade */
        </script>
       


		{# jQuery 1.11.1 is included by default, and required by both Bootstrap
			and the KeystoneJS Content Editor. If you are not targeting IE8,
			you can upgrade to 2.1.1 (also bundled) for better performance. 
		<script src="/js/lib/jquery/jquery-1.11.1.min.js"></script>
		#}
		
		{# Customise which Bootstrap javascript files are served by including
			them specifically here, instead of bootstrap-3.2.0.min.js 
		<script src="/js/lib/bootstrap/bootstrap-3.2.0.min.js"></script>
		#}
		
		{# The KeystoneJS Content Editor provides support for ks-editable data attributes,
			which generate links to edit content for users who can access Keystone #}
		{% if user and user.canAccessKeystone -%}
			<script src="/keystone/js/content/editor.js"></script>
		{%- endif -%}

		{# Add scripts that are globally required by your site here. #}

		{# Include template-specific javascript files by extending the js block #}
		{%- block js -%}{%- endblock -%}
	</body>
</html>
