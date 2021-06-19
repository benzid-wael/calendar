.DEFAULT_GOAL := help

define BROWSER_PYSCRIPT
import os, webbrowser, sys

from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"

.PHONY: help
help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

.PHONY: lint
lint:  ## Run linter
	vendor/bin/hhast-lint

.PHONY: type-checker
type-checker:  ## Run type checker
	hh_client

.PHONY: sast
sast: lint type-checker  ## Run static code tools

.PHONY: build
build:  ## Update class/file mapping
	vendor/bin/hh-autoload

.PHONY: dev
dev:  ## start development server
	hhvm -m server -p 8080