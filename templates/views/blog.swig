{% extends "../layouts/default.swig" %}



{% macro showPost(post) %}

<div class="post_wrapper">
<article 
		 class="post-67 post type-post status-publish format-standard has-post-thumbnail hentry category-arrupti-quos-dolores-et-quas-molestias tag-lorem tag-sit-amet post__holder cat-35-id">
	<div class="post" data-ks-editable="editable(user, { list: 'Post', id: post.id })">
		<header class="post-header">
			<h2 class="post-title">
				<a href="/blog/post/{{ post.slug }}">{{ post.title }}</a>
			</h2>
		</header>
		<div class="post_content">
			<div class="excerpt">
				{% if post.image.exists %}
					<img src="{{ post._.image.fit(160,160) }}" class="img pull-right">
				{% endif %}
				<p>{{ post.content.brief | safe }}</p>
			</div>
			{% if post.content.extended %}
				<p class="read-more">
					<a href="/blog/post/{{ post.slug }}" class="btn btn-primary">阅读更多</a>
				</p>
			{% endif %}
			
			<div class="post_meta meta_type_line">
				<div class="post_meta_unite clearfix">
					{% if post.publishedDate %}
						<div class="post_date">
							<i class="icon-calendar"></i>
							<time>{{ post._.publishedDate.format("YYYY年MM月DD日") }}</time>
						</div>
					{% endif %}
					{% if post.author %}
						<div class="post_author">
							<i class="icon-user"></i>
							{{ post.author.name.first }}
						</div>
					{% endif %}
					{% if post.categories and post.categories.length %}
						<div class="post_permalink">
							<i class="icon-link"></i>
							{% for cat in post.categories %}
								<a href="/blog/{{ cat.key }}">{{ cat.name }}</a>
								{% if loop.index < post.categories.length - 1 %}, {% endif %}
							{% endfor %}
						</div>
				   {% endif %}
				</div>
			</div>
		</div>
	</div>
</article>
</div>	

{% endmacro %}
 

{% block content %}
<div class="motopress-wrapper content-holder clearfix">
	<div class="container">
		<div class="row">
			<div class="span12" >
				<div class="row">
					{% set title = "新闻" %}
					{% if data.category %}
						{% set title = data.category.name %}
					{% endif %}
					<div class="span12" data-motopress-type="static"
						 data-motopress-static-file="static/static-title.php">
						<section class="title-section">
								<h1 class="title-header">
									{{  title }}
								</h1>
		
							<ul class="breadcrumb breadcrumb__t">
								<li><a href="/">首页</a></li>
								<li class="active">新闻</li>
							</ul>
						</section>
					</div>
				</div>
				<div class="row">
					<div class="span8 right" id="content">
						{% if filters.category and not data.category %}
							<h3 class="text-muted">Invalid Category.</h3>
						{% else %}
							{% if data.posts.results.length %}
								
								<div class="blog">
									{% for post in data.posts.results %}
										{{ showPost(post) }}
									{% endfor %}
								</div>
								
								
								{% if data.posts.totalPages > 1 %}
								<div class="pagination pagination__posts">
									<ul >
										{% if data.posts.previous %}
											<li>
												<a href="?page={{ data.posts.previous }}">
													<span class="glyphicon glyphicon-chevron-left"></span>
												</a>
											</li>
										{% else %}
											<li class="disabled">
												<a href="?page=1">
													<span class="glyphicon glyphicon-chevron-left"></span>
												</a>
											</li>
																		{% endif %}
											{% for p in data.posts.pages %}
												<li class="{% if data.posts.currentPage == p %}active{% endif %}">
													<a href="?page={% if p == "..." %}{% if i %}{{ data.posts.totalPages }}{% else %}1{% endif %}{% else %}{{ p }}{% endif %}">{{ p }}</a>
												</li>
											{% endfor %}
										{% if data.posts.next %}
											<li>
												<a href="?page={{ data.posts.next }}">
													<span class="glyphicon glyphicon-chevron-right"></span>
												</a>
											</li>
										{% else %}
											<li class="disabled">
												<a href="?page={{ data.posts.totalPages }}">
													<span class="glyphicon glyphicon-chevron-right"></span>
												</a>
											</li>
										{% endif %}
									</ul>
								</div>
								{% endif %}
							{% else %}
								{% if data.category %}
									<h3 class="text-muted">没有{{ data.category.name }}的数据.</h3>
								{% else %}
									<h3 class="text-muted">没有数据.</h3>
								{% endif %}
							{% endif %}
						{% endif %}
					</div>
					{% if data.categories.length %}
						<div class="sidebar span4" id="sidebar" >
							<div id="categories-2" class="widget"><h3><a href="/blog" class="{% if not data.category %}active{% endif %} ">全部分类</a></h3>
								<ul>
								{% for cat in data.categories %}
									<li class="cat-item cat-item-35">
										<a href="/blog/{{ cat.key }}" class="{% if data.category and data.category.id == cat.id %}active{% endif %} ">{{ cat.name }}</a>
									</li>
								{% endfor %}
								</ul>
							</div>
						</div>
					{% endif %}
				</div>
			</div>
		</div>
	</div>
</div>
{% endblock %}
