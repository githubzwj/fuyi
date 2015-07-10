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
							服务
						</h1>
					<ul class="breadcrumb breadcrumb__t">
						<li><a href="/">首页</a></li>
						<li class="active">服务</li>
					</ul>
				</section>
			</div>
		</div>
		{% if galleries.length %}
			{% for gallery in galleries %}
				<h2>{{ gallery.name }}
					{% if gallery.publishedDate %}
						<span class="pull-right text-muted">{{ gallery._.publishedDate.format("YYYY年MM月DD日") }}</span>
					{% endif %}
				</h2>

				<div class="row gallery-images">
					{% if gallery.heroImage.exists %}
						<div class="col-sm-4 col-md-4 gallery-image">
							<img src="{{ gallery._.heroImage.limit(680,680) }}" class="img-rounded">
						</div>
						<div class="col-sm-8 col-md-8">
							<div class="row">
								{% for image in gallery.images %}
									<div class="col-xs-4 col-sm-4 col-md-3 gallery-image">
										<img src="{{ image.limit(300,300) }}" class="img-rounded">
									</div>
								{% endfor %}
							</div>
						</div>
					{% else %}
						{% for image in gallery.images %}
							<div class="col-xs-6 col-sm-4 col-md-3 gallery-image">
								<img src="{{ image.limit(300,300) }}" class="img-rounded">
							</div>
						{% endfor %}
					{% endif %}
				</div>
			{% endfor %}
		{% else %}
			<h3 class="text-muted">There are no image galleries yet.</h3>
		{% endif %}
		</div>
		</div>
	</div>
</div>
{% endblock %}
