{% extends "../layouts/default.swig" %}



{% macro showSolution(solution) %}
{% set terms="" %}
{% if solution.categories and solution.categories.length %}
	{% for cat in solution.categories %}
		{% set terms=terms+" term_id_"+cat.id %}
	{% endfor %}
{% endif %}

<li class="portfolio_item  {{terms}} ">
	<div class="portfolio_item_holder">
		{% if solution.image.exists %}
			<figure class="thumbnail thumbnail__portfolio">
				<a href="/solutions/solution/{{ solution.slug }}" class="image-wrap"
				   title="{{ solution.title }}" >
					<img src="{{ solution._.image.fit(376,238) }}" alt="{{ solution.title }}" >
					<span class="zoom-icon"></span> 
				</a>
			</figure>
		{% endif %}
		<div class="caption caption__portfolio">
			<h3><a href="/solutions/solution/{{ solution.slug }}">{{ solution.title }}</a></h3>
			<p class="excerpt">{{ solution.content.brief | safe }} </p>
			<p><a href="/solutions/solution/{{ solution.slug }}" class="btn btn-primary">阅读更多</a></p>
		</div>
	</div>
</li>

{% endmacro %}
 

{% block content %}
<div class="motopress-wrapper content-holder clearfix">
	<div class="container">
		<div class="row">
			<div class="span12" >
				<div class="row">
					{% set title = "主要案列" %}
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
								<li class="active">主要案列</li>
							</ul>
						</section>
					</div>
				</div>
				<div id="content" class="row">
					<div class="span12" >
						<div class="page_content">
							<div class="clear"></div>
						</div>
						{% if data.categories.length %}
							<div class="filter-wrapper clearfix">
								<div class="pull-right">
									<strong>分类: </strong>
									<ul id="filters" class="filter nav nav-pills">
										<li class="{% if !data.category %}active{% endif %}" >
											<a href="#" data-count="13" data-filter>显示全部</a>
										</li>
									{% for cat in data.categories %}
										<li><a href="#"  data-filter=".term_id_{{ cat.id }}">{{cat.name}}</a></li>
									{% endfor %}
									</ul>
								</div>
							</div>
						{% endif %}
						
						
						{% if filters.category and not data.category %}
							<h3 class="text-muted">Invalid Category.</h3>
						{% else %}
							{% if data.solutions.results.length %}
								<ul id="portfolio-grid" class="filterable-portfolio thumbnails portfolio-3cols"
                                							data-cols="3cols">
								
									{% for solution in data.solutions.results %}
										{{ showSolution(solution) }}
									{% endfor %}
										
								</ul>
								{% if data.solutions.totalPages > 1 %}
								<div class="pagination pagination__posts">
									<ul >
										{% if data.solutions.previous %}
											<li>
												<a href="?page={{ data.solutions.previous }}">
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
											{% for p in data.solutions.pages %}
												<li class="{% if data.solutions.currentPage == p %}active{% endif %}">
													<a href="?page={% if p == "..." %}{% if i %}{{ data.solutions.totalPages }}{% else %}1{% endif %}{% else %}{{ p }}{% endif %}">{{ p }}</a>
												</li>
											{% endfor %}
										{% if data.solutions.next %}
											<li>
												<a href="?page={{ data.solutions.next }}">
													<span class="glyphicon glyphicon-chevron-right"></span>
												</a>
											</li>
										{% else %}
											<li class="disabled">
												<a href="?page={{ data.solutions.totalPages }}">
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
				</div>
			</div>
		</div>
	</div>
</div>
{% endblock %}
{% block js %}
<script>
	jQuery(document).ready(function ($) {
		var $container = $('#portfolio-grid'),
				items_count = $(".portfolio_item").size();

		$(window).load(function () {
			var selector = window.location.hash.replace(/^#category/, '.term');

			if (selector == "#") {
				selector = '';
			}

			setColumnWidth();
			$container.isotope({
				itemSelector: '.portfolio_item',
				hiddenClass: 'portfolio_hidden',
				resizable: false,
				transformsEnabled: true,
				layoutMode: 'fitRows',
				filter: selector
			})

			$('#filters .active').removeClass('active')
			$('#filters li a[data-filter="' + selector + '"]').parent('li').addClass('active');
			change_hash(selector)
		});

		function getNumColumns() {
			var $folioWrapper = $('#portfolio-grid').data('cols');

			if ($folioWrapper == '2cols') {
				var winWidth = $("#portfolio-grid").width(),
						column = 2;
				if (winWidth < 380) column = 1;
				return column;
			}

			else if ($folioWrapper == '3cols') {
				var winWidth = $("#portfolio-grid").width(),
						column = 3;
				if (winWidth < 380) column = 1;
				else if (winWidth >= 380 && winWidth < 788) column = 2;
				else if (winWidth >= 788 && winWidth < 1160) column = 3;
				else if (winWidth >= 1160) column = 3;
				return column;
			}

			else if ($folioWrapper == '4cols') {
				var winWidth = $("#portfolio-grid").width(),
						column = 4;
				if (winWidth < 380) column = 1;
				else if (winWidth >= 380 && winWidth < 788) column = 2;
				else if (winWidth >= 788 && winWidth < 1160) column = 3;
				else if (winWidth >= 1160) column = 4;
				return column;
			}
		}

		function setColumnWidth() {
			var columns = getNumColumns(),
					containerWidth = $("#portfolio-grid").width(),
					postWidth = containerWidth / columns;
			postWidth = Math.floor(postWidth);

			$(".portfolio_item").each(function (index) {
				$(this).css({"width": postWidth + "px"});
			});
		}

		function arrange() {
			setColumnWidth();
			$container.isotope('reLayout');
		}

		$(window).on("debouncedresize", function (event) {
			arrange();
		});

		// Filter projects
		$('.filter a').click(function () {
			var $this = $(this).parent('li');
			// don't proceed if already active
			if ($this.hasClass('active')) {
				return;
			}


			var $optionSet = $this.parents('.filter');
			// change active class
			$optionSet.find('.active').removeClass('active');
			$this.addClass('active');

			var selector = $(this).attr('data-filter');
			$container.isotope({filter: selector});
			change_hash(selector)

			var hiddenItems = 0,
					showenItems = 0;
			$(".portfolio_item").each(function () {
				if ($(this).hasClass('portfolio_hidden')) {
					hiddenItems++;
				}
				;
			});

			showenItems = items_count - hiddenItems;
			if (($(this).attr('data-count')) > showenItems) {
				$(".pagination__posts").css({"display": "block"});
			} else {
				$(".pagination__posts").css({"display": "none"});
			}
			return false;
		});
		function change_hash(hash) {
			hash = hash.replace(/^.term/, 'category');
			window.location.href = '#' + hash;

			$('.pagination a').each(function () {
				var item = $(this),
						href = item.attr('href'),
						end_slice = href.indexOf('#') == -1 ? href.length : href.indexOf('#');

				href = href.slice(0, end_slice);
				item.attr({'href': href + '#' + hash})
			})
		}
	});
</script>
{% endblock %}
