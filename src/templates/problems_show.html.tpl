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
{% endblock %}
