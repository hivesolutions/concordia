{% extends "partials/layout.html.tpl" %}
{% block title %}Persons{% endblock %}
{% block name %}Persons{% endblock %}
{% block content %}
    <ul>
        {% for person in persons %}
            <li>
                <div class="name">
                    <a href="{{ url_for('show_person', id = person.id) }}">{{ person.name }}</a>
                </div>
            </li>
        {% endfor %}
    </ul>
{% endblock %}
