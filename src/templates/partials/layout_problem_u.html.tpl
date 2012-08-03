{% extends "partials/layout_uwide.html.tpl" %}
{% block header %}
    {{ super() }}
    <div class="links sub-links">
        {% if sub_link == "show" %}
            <a href="{{ url_for('show_problem', id = problem.id) }}" class="active">show</a>
        {% else %}
            <a href="{{ url_for('show_problem', id = problem.id) }}">show</a>
        {% endif %}
        //
        {% if sub_link == "run" %}
            <a href="{{ url_for('run_problem', id = problem.id) }}" class="active">run</a>
        {% else %}
            <a href="{{ url_for('run_problem', id = problem.id) }}">run</a>
        {% endif %}
    </div>
{% endblock %}
