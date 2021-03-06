{% include "partials/doctype.html.tpl" %}
<head>
    {% block head %}
        {% include "partials/content_type.html.tpl" %}
        {% include "partials/includes.html.tpl" %}
        <title>Concordia / {% block title %}{% endblock %}</title>
    {% endblock %}
</head>
<body class="ux">
    <div id="header">
        {% block header %}
            <h1>{% block name %}{% endblock %}</h1>
            <div class="links">
                {% if link == "home" %}
                    <a href="{{ url_for('index') }}" class="active">home</a>
                {% else %}
                    <a href="{{ url_for('index') }}">home</a>
                {% endif %}
                //
                {% if link == "sets" %}
                    <a href="{{ url_for('list_set') }}" class="active">sets</a>
                {% else %}
                    <a href="{{ url_for('list_set') }}">sets</a>
                {% endif %}
                //
                {% if link == "problems" %}
                    <a href="{{ url_for('list_problem') }}" class="active">problems</a>
                {% else %}
                    <a href="{{ url_for('list_problem') }}">problems</a>
                {% endif %}
                //
                {% if link == "persons" %}
                    <a href="{{ url_for('list_person') }}" class="active">persons</a>
                {% else %}
                    <a href="{{ url_for('list_person') }}">persons</a>
                {% endif %}
                //
                {% if link == "tables" %}
                    <a href="{{ url_for('list_table') }}" class="active">tables</a>
                {% else %}
                    <a href="{{ url_for('list_table') }}">tables</a>
                {% endif %}
                //
                {% if link == "about" %}
                    <a href="{{ url_for('about') }}" class="active">about</a>
                {% else %}
                    <a href="{{ url_for('about') }}">about</a>
                {% endif %}
            </div>
        {% endblock %}
    </div>
    <div id="content">{% block content %}{% endblock %}</div>
    {% include "partials/footer.html.tpl" %}
</body>
{% include "partials/end_doctype.html.tpl" %}
