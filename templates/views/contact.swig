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
							联系我们
						</h1>
					<ul class="breadcrumb breadcrumb__t">
						<li><a href="/">首页</a></li>
						<li class="active">联系我们</li>
					</ul>
				</section>
			</div>
		</div>
		{% if enquirySubmitted %}
			<h3>感谢您的联系.</h3>
		{% else %}
			<div class="row">
				<div class="span8 right" id="content">
					<form method="post">
						<input type="hidden" name="action" value="contact">
						{% set className = "" %}
						{% if validationErrors.name %}
							{% set className = "has-error" %}
						{% endif %}
						<div class="form-group {{ className }}">
							<label>
								<span>姓名</span>
								<input type="text" name="name.full" value="{{ formData['name.full'] | default('') }}" class="form-control">
							</label>
						</div>
						{% set className = "" %}
						{% if validationErrors.email %}
							{% set className = "has-error" %}
						{% endif %}
						<div class="form-group {{ className }}">
							<label>
								<span>邮箱</span>
								<input type="email" name="email" value="{{ formData.email | default('') }}" class="form-control">
							</label>
						</div>
						<div class="form-group">
							<label>
								<span>电话</span>
								<input type="text" name="phone" value="{{ formData.phone | default('') }}" placeholder="(optional)" class="form-control">
							</label>
						</div>
						{% set className = "" %}
						{% if validationErrors.enquiryType %}
							{% set className = "has-error" %}
						{% endif %}
						<div class="form-group {{ className }}">
							<label>
								<span>您有什么问题需要联系我们?</span>
								<select name="enquiryType" class="form-control">
									<option value="">(select one)</option>
									{% for type in enquiryTypes %}
										{% set selected = "" %}
										{% if formData.enquiryType === type.value %}
											{% set selected = " selected" %}
										{% endif %}
										<option value="{{ type.value }}"{{ selected }}>{{ type.label }}</option>
									{% endfor %}
								</select>
						</div>
						{% set className = "" %}
						{% if validationErrors.message %}
							{% set className = "has-error" %}
						{% endif %}
						<div class="form-group {{ className }}">
							<label>
								<span>Message</span>
								<textarea name="message" placeholder="Leave us a message..." rows="4" class="form-control">
									{{ formData.message }}
								</textarea>
							</label>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">Send</button>
						</div>
					</form>
				</div>
			</div>
		{% endif %}
	</div>
	</div>
	</div>
</div>
{% endblock %}
