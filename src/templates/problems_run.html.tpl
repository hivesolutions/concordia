{% extends "partials/layout_problem_u.html.tpl" %}
{% block title %}Problems{% endblock %}
{% block name %}Problems :: {{ problem.name }}{% endblock %}
{% block content %}
    {% if solution == None %}
        <div class="quote">
            It was not possible to generate a timetable for the current configuration.<br />
            Please try with different settings or <strong>talk with the administrator</strong>.
        </div>
    {% else %}
        <div class="timetable">
            <ul class="hours">
                <li></li>
                <li>10:00</li>
                <li>11:00</li>
                <li>12:00</li>
                <li>13:00</li>
                <li>14:00</li>
                <li>15:00</li>
                <li>16:00</li>
                <li>17:00</li>
                <li>18:00</li>
                <li>19:00</li>
                <li>20:00</li>
                <li>21:00</li>
                <li>22:00</li>
                <li></li>
            </ul>
            {% for day in solution %}
                <ul>
                    <li></li>
                    {% for position in range(13) %}
                        {% if position in day %}
                            {% for key, item in day[position].items() %}
                                <div class="item color-{{ item.index }} size-{{ item.size}} width-{{ item.width }} position-{{ item.position_d }}">
                                    {{ item.name }}
                                </div>
                            {% endfor %}
                        {% endif %}
                        <li>&nbsp;</li>
                    {% endfor %}
                    <li></li>
                </ul>
            {% endfor %}
            <ul class="extra">
                <li></li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li>&nbsp;</li>
                <li class="last">&nbsp;</li>
                <li></li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="debug">
            <div>The generation of the timetable was completed in <strong>{{ delta }} ms</strong>.</div>
            {% if report %}
                <div>{{ report }}</div>
            {% endif %}
            {% if instrumentation %}
                <div>{{ instrumentation }}</div>
            {% endif %}
        </div>
    {% endif %}
{% endblock %}
