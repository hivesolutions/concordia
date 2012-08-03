{% extends "partials/layout_table.html.tpl" %}
{% block title %}Tables{% endblock %}
{% block name %}Tables :: {{ table.name }}{% endblock %}
{% block content %}
    <div class="quote">{{ table.id }}</div>
    <div class="separator-horizontal"></div>
    <table>
        <tbody>
            <tr>
                <td class="right label" width="50%">bitmask</td>
                <td class="left value" width="50%">
                    {% for bit in table.bitmask %}
                        {{ bit }}{% if loop.index % 13 == 0 %}<br />{% elif not loop.last %},{% endif %}
                    {% endfor %}
                </td>
            </tr>
        </tbody>
    </table>
{% endblock %}
