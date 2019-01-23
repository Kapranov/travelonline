V ?= @
LOCALHOST := 'localhost'
PORT 			:= '4200'
PATH      := node_modules/.bin:$(PATH)
SHELL     := /usr/bin/env bash

RUBYSERVICE := $(shell pgrep ruby)
NODESERVICE := $(shell pgrep node)
ERLSERVICE  := $(shell pgrep beam.smp)

ELIXIR = elixir

VERSION = $(shell git describe --tags --abbrev=0 | sed 's/^v//')

NO_COLOR=\033[0;0m
INFO_COLOR=\033[2;32m
SHOW_COLOR=\033[1;5;31m
STAT_COLOR=\033[2;33m

# ------------------------------------------------------------------------------

help:
				$(V)echo Please use \'make help\' or \'make ..any_parameters..\'

git-%: pub
				$(V)git add .
				$(V)git commit -m "$(@:git-%=%)"
				$(V)git push origin master

pull:
				$(V)git pull

log:
				$(V)clear
				$(V)echo -e "\n"
				$(V)echo -e "\t$(SHOW_COLOR) There are commits:$(NO_COLOR) \n"
				$(V)git log --pretty="format:%ae|%an|%s"
				$(V)echo -e "\n"

kill_ruby:
				$(V)echo -e "\n\t$(STAT_COLOR) Checking to see if RUBY process exists:$(NO_COLOR)\n"
				$(V)if [ "$(RUBYSERVICE)" ]; then killall ruby && echo -e "$(INFO_COLOR)Running Ruby Service Killed$(NO_COLOR)"; else echo -e "$(SHOW_COLOR)No Running Ruby Service!$(NO_COLOR)"; fi

kill_elixir:
				$(V)echo -e "\n\t$(STAT_COLOR) Checking to see if Erlang process exists:$(NO_COLOR)\n"
				$(V)if [ "$(ERLSERVICE)" ]; then killall beam.smp && echo -e "$(INFO_COLOR)Running Erlang Service Killed$(NO_COLOR)"; else echo -e "$(INFO_COLOR)No Running Erlang Service!$(NO_COLOR)"; fi

kill_node:
				$(V)echo -e "\n\t$(STAT_COLOR) Checking to see if Node process exists:$(NO_COLOR)\n"
				$(V)if [ "$(NODESERVICE)" ]; then killall node && echo -e "$(INFO_COLOR)Running Node Service Killed$(NO_COLOR)"; else echo -e "$(INFO_COLOR)No Running Node Service!$(NO_COLOR)"; fi

pri:
				$(V)cp ./config/environment.js.private ./config/environment.js

pub:
				$(V)cp ./config/environment.js.public ./config/environment.js

npm:
				$(V)npm install

test:
				$(V)ember test

unit:
				$(V)ember electron:test

start: pri
				$(V)ember electron

server: kill_ruby pri
				$(V)export TERM='xterm-256color'
				$(V)pushd ./public; ./server.rb &

proxy: server
				$(V)ember server --proxy http://api.dev.local:8000 --host api.dev.local --port 4200

check:
				$(V)ncu -a
				$(V)ncu -u
				$(V)npm install

node:
				$(V)pushd ./public; npm start &

up: node pri
				$(V)ember server --proxy http://api.dev.local:8000 --host api.dev.local --port 4200

run: pri
				$(V)ember server

.PHONY: git-% pull log pri pub npm test unit start server proxy check node up run
