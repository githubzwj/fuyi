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
								{% if data.post %}
								{{ data.post.title }}
								{% endif%}
								</h1>
							<ul class="breadcrumb breadcrumb__t">
								<li><a href="/">首页</a></li>
								<li><a href="/blog">新闻</a></li>
								{% if data.post %}
								<li class="active">{{ data.post.title }}</li>
								{% endif%}
							</ul>
						</section>
					</div>
				</div>
				<div class="row">
					<div class="span8 right" id="content">
						<article>
							{% if not data.post %}
								<h2>Invalid Post.</h2>
							{% else %}
							
								<div class="excerpt">
									{% if data.post.image.exists %}
										<div class="image-wrap">
											<img src="{{ data.post._.image.fit(750,450) }}" class="img-responsive">
										</div>
									{% endif %}
									{{ data.post.content.full | raw }}
								</div>
								<div class="post_meta meta_type_line">
									{% if data.post.publishedDate %}
										<div class="post_date">
											<i class="icon-calendar"></i>
											<time>{{ data.post._.publishedDate.format("YYYY年MM月DD日") }}</time>
										</div>
									{% endif %}
									{% if data.post.author %}
										<div class="post_author">
											<i class="icon-user"></i>
											{{ data.post.author.name.first }}
										</div>
									{% endif %}
									{% if data.post.categories and data.post.categories.length %}
										<div class="post_permalink">
											<i class="icon-link"></i>
											{% for cat in data.post.categories %}
												<a href="/blog/{{ cat.key }}">{{ cat.name }}</a>
												{% if loop.index < data.post.categories.length - 1 %}, {% endif %}
											{% endfor %}
										</div>
									{% endif %}
								</div>
							{% endif %}
						</article>
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
