{% extends "partials/layout_problem.html.tpl" %}
{% block title %}Problems{% endblock %}
{% block name %}Problems :: {{ problem.name }}{% endblock %}
{% block content %}
    <div class="quote">{{ problem.id }}</div>
    <div class="separator-horizontal"></div>
    <table>
        <tbody>
            <tr>
                <td class="right label" width="50%">days</td>
                <td class="left value" width="50%">{{ problem.number_days }}</td>
            </tr>
            <tr>
                <td class="right label" width="50%">hours</td>
                <td class="left value" width="50%">{{ problem.number_hours }}</td>
            </tr>
            <tr>
                <td class="right label" width="50%">days off</td>
                <td class="left value" width="50%">{{ problem.number_days_off }}</td>
            </tr>
            <tr>
                <td class="right label" width="50%">hours / day</td>
                <td class="left value" width="50%">{{ problem.max_hours_day }}</td>
            </tr>
            <tr>
                <td class="right label" width="50%">days / week</td>
                <td class="left value" width="50%">{{ problem.max_days_week }}</td>
            </tr>
        </tbody>
    </table>
    <div class="separator-horizontal"></div>
    <table>
        <tbody>
            <tr>
                <td class="right label" width="50%">persons</td>
                <td class="left value" width="50%">
                    {% for person, priority in problem.persons %}
                        <a href="{{ url_for('show_person', id = person) }}">{{ person }}</a> [{{ priority }}]{% if not loop.last %},{% endif %}
                    {% endfor %}
                </td>
            </tr>
            <tr>
                <td class="right label" width="50%">timetables</td>
                <td class="left value" width="50%">
                    {% for timetables in problem.timetables %}
                        [
                        {% for timetable in timetables %}
                            <a href="{{ url_for('show_table', id = timetable) }}">{{ timetable }}</a>{% if not loop.last %},{% endif %}
                        {% endfor %}
                        ]
                        {% if not loop.last %}<br />{% endif %}
                    {% endfor %}
                </td>
            </tr>
        </tbody>
    </table>
{% endblock %}
