#!/bin/sh

# https://pypi.python.org/pypi/watchdog
# sudo pip install watchdog
# libyaml-dev (+libyaml-0-2)


watchmedo shell-command --patterns="*.html;*.css" --recursive --wait --command='sh build-pages.sh' .

