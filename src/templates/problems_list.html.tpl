{% extends "partials/layout.html.tpl" %}
{% block title %}Problems{% endblock %}
{% block name %}Problems{% endblock %}
{% block content %}
    <ul>
        {% for problem in problems %}
            <li>
                <div class="name">
                    <a href="{{ url_for('show_problem', id = problem.id) }}">{{ problem.name }}</a>
                </div>
            </li>
        {% endfor %}
    </ul>
{% endblock %}
