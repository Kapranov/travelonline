#!/usr/bin/env bash

clear

echo -en "Serving at http://127.0.0.1:8000"
echo -en '\n\n'

ruby -run -e httpd . -p 8000
