.PHONY: setup setup-dev install clean format check-format test lint type pre-commit

PKG = template_python_project
PYTHON_VERSION ?= 3.8

setup:
	poetry env use $(PYTHON_VERSION)
	poetry install --no-dev

setup-dev:
	poetry env use $(PYTHON_VERSION)
	poetry install

install:
	pip install -U .

clean:
	rm -rf .tox .venv .mypy_cache **/__pycache__

format: setup-dev
	poetry run isort format .
    poetry run black .

test:
	tox -e py$(PYTHON_VERSION)

lint:
	tox -e lint

type:
	tox -e type

check-format:
	tox -e checkformat

pre-commit:
	tox
