#!/usr/bin/python
# -*- coding: utf-8 -*-

# Hive Concordia System
# Copyright (C) 2008-2012 Hive Solutions Lda.
#
# This file is part of Hive Concordia System.
#
# Hive Concordia System is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Hive Concordia System is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Hive Concordia System. If not, see <http://www.gnu.org/licenses/>.

__author__ = "João Magalhães <joamag@hive.pt>"
""" The author(s) of the module """

__version__ = "1.0.0"
""" The version of the module """

__revision__ = "$LastChangedRevision$"
""" The revision number of the module """

__date__ = "$LastChangedDate$"
""" The last change date of the module """

__copyright__ = "Copyright (c) 2008-2012 Hive Solutions Lda."
""" The copyright for the module """

__license__ = "GNU General Public License (GPL), Version 3"
""" The license for the module """

import os
import flask
import schettino

app = flask.Flask(__name__)

@app.route("/")
@app.route("/index")
def index():
    return flask.render_template(
        "index.html.tpl",
        link = "home"
    )

@app.route("/about")
def about():
    return flask.render_template(
        "about.html.tpl",
        link = "about"
    )

@app.route("/timetable")
def timetable():
    solution = []
    solution = schettino.solve(solution, all = False)

    if solution:
        _solution = []
        day = []

        item = {}

        for index in range(len(solution)):
            if index % schettino.problem.N_HOURS == 0:
                item = {}
                day = []
                _solution.append(day)

            # retrieve the value (index) from the solution and then
            # uses it to retrieve the appropriate string value using
            # the problem definition for the resolution process
            value = solution[index]
            value_s = value == -1 and "&nbsp;" or _shorten_name(schettino.problem.PERSONS[value])

            # retrieves the previous index (value) from the previous
            # iteration and compares it with the current value in case
            # the value is the same reuses the item
            value_p = item.get("index", None)
            if value == value_p:
                item["size"] += 1
            else:
                item = {
                    "index" : value,
                    "name" : value_s,
                    "time" : "12:30",
                    "size" : 1
                }
                day.append(item)
    else:
        _solution = None

    return flask.render_template(
        "timetable.html.tpl",
        link = "timetable",
        solution = _solution
    )

@app.errorhandler(404)
def handler_404(error):
    return str(error)

@app.errorhandler(413)
def handler_413(error):
    return str(error)

@app.errorhandler(BaseException)
def handler_exception(error):
    return str(error)

def _shorten_name(name):
    parts = name.split(" ")
    parts_length = len(parts)
    if parts_length == 1: return name
    first = parts[0]
    last = parts[-1]

    return first + " " + last[0] + "."

def run():
    # sets the debug control in the application
    # then checks the current environment variable
    # for the target port for execution (external)
    # and then start running it (continuous loop)
    debug = os.environ.get("DEBUG", False) and True or False
    reloader = os.environ.get("RELOADER", False) and True or False
    port = int(os.environ.get("PORT", 5000))
    app.debug = debug
    app.run(
        use_debugger = debug,
        debug = debug,
        use_reloader = reloader,
        host = "0.0.0.0",
        port = port
    )

if __name__ == "__main__":
    run()
