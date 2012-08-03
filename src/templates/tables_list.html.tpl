{% extends "partials/layout.html.tpl" %}
{% block title %}Tables{% endblock %}
{% block name %}Tables{% endblock %}
{% block content %}
    <ul>
        {% for table in tables %}
            <li>
                <div class="name">
                    <a href="{{ url_for('show_table', id = table.id) }}">{{ table.name }}</a>
                </div>
            </li>
        {% endfor %}
    </ul>
{% endblock %}
