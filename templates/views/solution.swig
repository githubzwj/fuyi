{% extends "../layouts/default.swig" %}

{% block content %}
<div class="motopress-wrapper content-holder clearfix">
	<div class="container">
		<div class="row">
			<div class="span12" >
				<div class="row">
					<div class="span12">
						<section class="title-section">
								<h1 class="title-header">
								{% if data.solution %}
								{{ data.solution.title }}
								{% endif%}
								</h1>
							<ul class="breadcrumb breadcrumb__t">
								<li><a href="/">首页</a></li>
								<li><a href="/solutions">主要案列</a></li>
								{% if data.solution %}
								<li class="active">{{ data.solution.title }}</li>
								{% endif%}
							</ul>
						</section>
					</div>
				</div>
				<div class="row" id="content">
					<div class="span12" >
						<div class=" portfolio type-portfolio status-publish has-post-thumbnail hentry" >
							<div class="row">							 

								{% if not data.solution %}
									<h2>Invalid Case.</h2>
								{% else %}
									<div class="span7">
										{% if data.solution.image.exists %}
											<div class="featured-thumbnail thumbnail large">
												<img src="{{ data.solution._.image.fit(670,440) }}" alt="{{ data.solution.title }}">
											</div>
											<div class="clear"></div>  
										{% endif %}
										
									</div>
									<div class="entry-content span5">
										<div class="entry-meta ">
											<div class="portfolio-meta">
												<span class="post_category">
													<i class="icon-bookmark"></i>
													{% if data.solution.categories and data.solution.categories.length %}
														{% for cat in data.solution.categories %}
															<a href="/solutions/#category_id_{{ cat.id }}">{{ cat.name }}</a>
															{% if loop.index < data.solution.categories.length - 1 %}, {% endif %}
														{% endfor %}
													{% endif %}
												</span>
											</div>
											<ul class="portfolio-meta-list">
												<li>
													<strong class="portfolio-meta-key">客户:</strong><span>{{data.solution.client}}</span><br>
												</li>
												{% if data.solution.publishedDate %}
													<li>
														<strong class="portfolio-meta-key">日期:</strong><span><time>{{ data.solution._.completeDate.format("YYYY年MM月DD日") }}</time></span><br>
													</li>
												{% endif %}
											</ul>
											<div>
												{{ data.solution.content.full | raw }}						 
											</div>
										</div>
									</div>
								{% endif %}
							
							</div>
							<div class="row">
                            	<div class="span7">
                            		<div class="related-posts">
										{% if data.solutions.length %}
											<h3 class="related-posts_h">相关案例</h3>
											<ul class="related-posts_list clearfix">
												{% for solution in data.solutions%}
													<li class="related-posts_item">
														<figure class="thumbnail featured-thumbnail">
															<a href="/solutions/solution/{{ solution.slug }}"
															   title="{{solution.title}}">
																<img alt="{{solution.title}}"
																	 src="{{ solution._.image.fit(146,88) }}"
																	 style="display: inline;">
														 	</a>
														</figure>
														<a href="/solutions/solution/{{ solution.slug }}">{{solution.title}}</a>
													</li>
												{% endfor %}
											</ul>
										{% endif%}
                            		</div>
                            	</div>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{% endblock %}
