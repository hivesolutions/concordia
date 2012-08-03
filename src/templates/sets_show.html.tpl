{% extends "partials/layout_set.html.tpl" %}
{% block title %}Sets{% endblock %}
{% block name %}Sets :: {{ set.name }}{% endblock %}
{% block content %}
    <div class="quote">{{ set.id }}</div>
    <div class="separator-horizontal"></div>
    <table>
        <tbody>
            <tr>
                <td class="right label" width="50%">problems</td>
                <td class="left value" width="50%">
                    {% for problem in set.problems %}
                        <a href="{{ url_for('show_problem', id = problem) }}">{{ problem }}</a>{% if not loop.last %},{% endif %}
                    {% endfor %}
                </td>
            </tr>
        </tbody>
    </table>
{% endblock %}
