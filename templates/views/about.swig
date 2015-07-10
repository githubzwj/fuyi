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
								{% if data.about %}
								{{ data.about.title }}
								{% endif%}
								</h1>
							<ul class="breadcrumb breadcrumb__t">
								<li><a href="/">首页</a></li>
								<li><a href="#">走进尊润</a></li>
								{% if data.about %}
								<li class="active">{{ data.about.title }}</li>
								{% endif%}
							</ul>
						</section>
					</div>
				</div>
				<div class="row">
					<div class="span8 right" id="content">
						<article>
							{% if not data.about %}
								<h2>Invalid About.</h2>
							{% else %}
							
								<div class="excerpt">
									{% if data.about.image.exists %}
										<div class="image-wrap">
											<img src="{{ data.about._.image.fit(750,450) }}" class="img-responsive">
										</div>
									{% endif %}
									{{ data.about.content.full | raw }}
								</div>
								
							{% endif %}
						</article>
					</div>
					{% if data.abouts.length %}
						<div class="sidebar span4" id="sidebar" >
							<div id="categories-2" class="widget"><h3><a href="#"  ">了解其他</a></h3>
								<ul>
								{% for about in data.abouts %}
									<li class="cat-item cat-item-35">
										<a href="/about/{{ about.slug }}" >{{ about.title }}</a>
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
