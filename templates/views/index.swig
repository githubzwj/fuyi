{% extends "../layouts/default.swig" %}

{% block content %}
<script type="text/javascript">
		jQuery(function () {
			var isparallax = true;
			if (!device.mobile() && !device.tablet()) {
				isparallax = true;
			} else {
				isparallax = false;
			}

			jQuery('#parallax-slider-5590bee6405f7').parallaxSlider({
				animateLayout: "simple-fade-eff"
				,
				parallaxEffect: isparallax
				,
				duration: 1500,
				autoSwitcher: 1,
				autoSwitcherDelay: 7000,
				slider_navs: 1,
				slider_pagination: 1,
				parallaxInvert: false
			});

		});
	</script>
	<div id="parallax-slider-5590bee6405f7" class="parallax-slider">
    		<ul class="baseList">
    			<li data-preview="/themes/50494/wp-content/uploads/2014/06/slide_1.jpg" data-img-width="1600" data-img-height="507"
    				data-ulr-link="#">
    				<div class="slider_caption>"><h3>如何做出 <strong>明智的</strong> <em>投资建议</em></h3>
    
    				
    					<p>.</p>
    					<a href="at-vero-eos-et-accusamus-et-iusto-odio/aliquam-erat-volutpat">Click Here!</a>
    					
					</div>
    			</li>
    			<li data-preview="/themes/50494/wp-content/uploads/2014/06/slide_2.jpg" data-img-width="1600" data-img-height="507"
    				data-ulr-link="#">
    				<div class="slider_caption>"><h3>为您提供<strong>优良的</strong> <em>解决方案!</em></h3>
    
    					<p>.</p>
    					<a href="/solutions">Click Here!</a></div>
    			</li>
    			<li data-preview="/themes/50494/wp-content/uploads/2014/06/slide_3.jpg" data-img-width="1600" data-img-height="507"
    				data-ulr-link="#">
    				<div class="slider_caption>"><h3>我们将向您 <strong>展示</strong> <em>成功之路!</em></h3>
    
    					<p>.</p>
    					<a href="rraesentium-voluptatum-deleniti-atque/donec-tempor-libero">Click Here!</a></div>
    			</li>
    		</ul>
    	</div>
    	<div class="motopress-wrapper content-holder clearfix">
    		<div class="container">
    			<div class="row">
    				<div class="span12" data-motopress-wrapper-file="page-home.php" data-motopress-wrapper-type="content">
    					<div class="row">
    						<div class="span12" data-motopress-type="loop" data-motopress-loop-file="loop/loop-page.php">
    							<div id="post-203" class="post-203 page type-page status-publish hentry page">
    							
    								<div class="content_box box_1">
    									<div class="row ">
    									
    										<div class="span8 ">
    											<div class="hero-unit "><h1>&#8221;We</h1>
    
    												<p>&#8221;<strong>financial </strong></p></div>
    										</div>
    										<div class="span4 ">
    											<div class="buttons">
    												{#<p><a href="services">join us</a></p>#}
    
    												<p><a href="/about/gong-si-jian-jie">关于我们</a></p>
    											</div>
    										</div>
    										
    									</div>
    									<div class="clear"></div>
    								</div>
    								
    								<div class="row ">
    									 
    									<div class="span4 ">
    										<div class="banner-wrap banner_1">
    											<h5>投资管理</h5>
    											
    											{% if data.busines1 %}
    											<figure class="featured-thumbnail">
    												<a
    													href="/business/{{data.busines1.slug}}"
    													title="{{data.busines1.title}}"><img
    													src="{{ data.busines1._.image.fit(370,245) }}"
    													title="{{data.busines1.title}}" alt=""/></a>
												</figure>
    											<p>{{ data.busines1.content.brief | safe }}</p>
    
    											<div class="link-align banner-btn">
    												<a
    													href="/business/{{data.busines1.slug}}"
    													title="more" class="btn btn-link" target="_self">详情</a>
												</div>
												{% endif %}
    										</div>
    									</div>
    									 
    									<div class="span4 ">
    										<div class="banner-wrap banner_2">
    											<h5>财富管理</h5>
    											{% if data.busines2 %}
												<figure class="featured-thumbnail">
													<a
														href="/business/{{data.busines2.slug}}"
														title="{{data.busines2.title}}"><img
														src="{{ data.busines2._.image.fit(370,245) }}"
														title="{{data.busines2.title}}" alt=""/></a>
												</figure>
												<p>{{ data.busines2.content.brief | safe }}</p>
	
												<div class="link-align banner-btn">
													<a
														href="/business/{{data.busines2.slug}}"
														title="more" class="btn btn-link" target="_self">详情</a>
												</div>
												{% endif %}
    										</div>
    									</div>
    									<div class="span4 ">
    										<div class="banner-wrap banner_3">
    											<h5>私人银行</h5>
    											{% if data.busines3 %}
												<figure class="featured-thumbnail">
													<a
														href="/business/{{data.busines3.slug}}"
														title="{{data.busines3.title}}"><img
														src="{{ data.busines3._.image.fit(370,245) }}"
														title="{{data.busines3.title}}" alt=""/></a>
												</figure>
												<p>{{ data.busines3.content.brief | safe }}</p>
	
												<div class="link-align banner-btn">
													<a
														href="/business/{{data.busines3.slug}}"
														title="more" class="btn btn-link" target="_self">详情</a>
												</div>
												{% endif %}
    										</div>
    									</div>
    								</div>
    								 
    								<div class="clear"></div>
    
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
{% endblock %}
