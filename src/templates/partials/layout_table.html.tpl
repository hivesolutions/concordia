{% extends "partials/layout.html.tpl" %}
{% block header %}
    {{ super() }}
    <div class="links sub-links">
        {% if sub_link == "show" %}
            <a href="{{ url_for('show_table', id = table.id) }}" class="active">show</a>
        {% else %}
            <a href="{{ url_for('show_table', id = table.id) }}">show</a>
        {% endif %}
    </div>
{% endblock %}
