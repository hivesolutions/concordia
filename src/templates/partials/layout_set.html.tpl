{% extends "partials/layout.html.tpl" %}
{% block header %}
    {{ super() }}
    <div class="links sub-links">
        {% if sub_link == "show" %}
            <a href="{{ url_for('show_set', id = set.id) }}" class="active">show</a>
        {% else %}
            <a href="{{ url_for('show_set', id = set.id) }}">show</a>
        {% endif %}
        //
        {% if sub_link == "run" %}
            <a href="#" class="active">run</a>
        {% else %}
            <a href="#">run</a>
        {% endif %}
    </div>
{% endblock %}
