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
import json
import flask

import schettino

CURRENT_DIRECTORY = os.path.dirname(__file__)
CURRENT_DIRECTORY_ABS = os.path.abspath(CURRENT_DIRECTORY)
PROBLEMS_FOLDER = os.path.join(CURRENT_DIRECTORY_ABS, "problems")
PERSONS_FOLDER = os.path.join(CURRENT_DIRECTORY_ABS, "persons")
TIMETABLES_FOLDER = os.path.join(CURRENT_DIRECTORY_ABS, "timetables")

app = flask.Flask(__name__)

@app.route("/", methods = ("GET",))
@app.route("/index", methods = ("GET",))
def index():
    return flask.render_template(
        "index.html.tpl",
        link = "home"
    )

@app.route("/about", methods = ("GET",))
def about():
    return flask.render_template(
        "about.html.tpl",
        link = "about"
    )

@app.route("/problems", methods = ("GET",))
def list_problem():
    problems = get_problems()

    return flask.render_template(
        "problems_list.html.tpl",
        link = "problems",
        problems = problems
    )

@app.route("/problems/<id>", methods = ("GET",))
def show_problem(id):
    problem = get_problem(id)

    return flask.render_template(
        "problems_show.html.tpl",
        link = "problems",
        sub_link = "show",
        problem = problem
    )

@app.route("/problems/run/<id>", methods = ("GET",))
def run_problem(id):
    problem = get_problem(id)
    problem_p = os.path.join(PROBLEMS_FOLDER, "%s.json" % id)
    problem_s = schettino.problems.file.FileProblem.create_problem(
        problem_p, PERSONS_FOLDER, TIMETABLES_FOLDER
    )
    schettino.solve(problem_s, all = False)
    solution = problem_s.get_structure()
    report = problem_s.get_report()
    delta = problem_s.delta
    instrumentation = problem_s.instrumentation

    return flask.render_template(
        "problems_run.html.tpl",
        link = "problems",
        sub_link = "run",
        problem = problem,
        solution = solution,
        report = report,
        delta = delta,
        instrumentation = instrumentation
    )

@app.route("/persons", methods = ("GET",))
def list_person():
    persons = get_persons()

    return flask.render_template(
        "persons_list.html.tpl",
        link = "persons",
        persons = persons
    )

@app.route("/persons/<id>", methods = ("GET",))
def show_person(id):
    person = get_person(id)

    return flask.render_template(
        "persons_show.html.tpl",
        link = "persons",
        sub_link = "show",
        person = person
    )

@app.errorhandler(404)
def handler_404(error):
    return str(error)

@app.errorhandler(413)
def handler_413(error):
    return str(error)

@app.errorhandler(BaseException)
def handler_exception(error):
    import traceback
    import sys
    print "Exception in user code:"
    print '-' * 60
    traceback.print_exc(file=sys.stdout)
    print '-' * 60
    return str(error)

def get_problems():
    problems_directory = os.path.join(PROBLEMS_FOLDER)
    if not os.path.exists(problems_directory): raise RuntimeError("Problems directory does not exist")
    entries = os.listdir(problems_directory)
    entries.sort()

    problems = []

    for entry in entries:
        base, extension = os.path.splitext(entry)
        if not extension == ".json": continue

        problem = get_problem(base)
        problems.append(problem)

    return problems

def get_problem(id):
    # retrieves the path to the (target) problem (configuration) file and
    # check if it exists then opens it and loads the json configuration
    # contained in it to problem it in the template
    problem_path = os.path.join(PROBLEMS_FOLDER, "%s.json" % id)
    if not os.path.exists(problem_path): raise RuntimeError("Problem file does not exist")
    problem_file = open(problem_path, "rb")
    try: problem = json.load(problem_file)
    finally: problem_file.close()

    return problem

def get_persons():
    persons_directory = os.path.join(PERSONS_FOLDER)
    if not os.path.exists(persons_directory): raise RuntimeError("Persons directory does not exist")
    entries = os.listdir(persons_directory)
    entries.sort()

    persons = []

    for entry in entries:
        base, extension = os.path.splitext(entry)
        if not extension == ".json": continue

        person = get_person(base)
        persons.append(person)

    return persons

def get_person(id):
    # retrieves the path to the (target) person (configuration) file and
    # check if it exists then opens it and loads the json configuration
    # contained in it to person it in the template
    person_path = os.path.join(PERSONS_FOLDER, "%s.json" % id)
    if not os.path.exists(person_path): raise RuntimeError("Person file does not exist")
    person_file = open(person_path, "rb")
    try: person = json.load(person_file)
    finally: person_file.close()

    return person

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
