{% extends "partials/layout_table.html.tpl" %}
{% block title %}Tables{% endblock %}
{% block name %}Tables :: {{ table.name }}{% endblock %}
{% block content %}
    <div class="quote">{{ table.id }}</div>
    <div class="separator-horizontal"></div>
    <table>
        <tbody>
        </tbody>
    </table>
{% endblock %}
