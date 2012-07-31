{% include "partials/doctype.html.tpl" %}
<head>
    {% block head %}
        {% include "partials/content_type.html.tpl" %}
        {% include "partials/includes.html.tpl" %}
        <title>Concordia / {% block title %}{% endblock %}</title>
    {% endblock %}
</head>
<body class="ux uwide">
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
                {% if link == "timetable" %}
                    <a href="{{ url_for('timetable') }}" class="active">timetable</a>
                {% else %}
                    <a href="{{ url_for('timetable') }}">timetable</a>
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
