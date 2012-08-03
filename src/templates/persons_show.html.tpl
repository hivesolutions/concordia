{% extends "partials/layout_person.html.tpl" %}
{% block title %}Persons{% endblock %}
{% block name %}Persons :: {{ person.name }}{% endblock %}
{% block content %}
    <div class="quote">{{ person.id }}</div>
    <div class="separator-horizontal"></div>
    <table>
        <tbody>
            <tr>
                <td class="right label" width="50%">timetables</td>
                <td class="left value" width="50%">{{ person.timetables }}</td>
            </tr>
        </tbody>
    </table>
{% endblock %}
