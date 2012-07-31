{% extends "partials/layout_uwide.html.tpl" %}{% block title %}Timetable{% endblock %}{% block name %}Timetable{% endblock %}{% block content %}    {% if solution == None %}        <div class="quote">            It was not possible to generate a timetable for the current configuration.<br />            Please try with different settings or <strong>talk with the administrator</strong>.        </div>    {% else %}        <div class="timetable">            <ul class="hours">                <li></li>                <li>10:00</li>                <li>10:30</li>                <li>11:00</li>                <li></li>            </ul>            {% for day in solution %}                <ul>                    <li></li>                    {% for hour in day %}                        <li class="color-{{ hour.index }} size-{{ hour.size}}">{{ hour.name }}</li>                    {% endfor %}                    <li></li>                </ul>            {% endfor %}            <ul class="extra">                <li></li>                <li>&nbsp;</li>                <li>&nbsp;</li>                <li class="last">&nbsp;</li>                <li></li>            </ul>        </div>        <div class="clear"></div>    {% endif %}
{% endblock %}
