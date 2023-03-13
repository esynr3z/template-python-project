.PHONY: setup setup-dev install clean format check-format test lint type pre-commit

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

publish:
	poetry config pypi-token.pypi ${TWINE_PASSWORD}
    poetry build
    poetry publish

format: setup-dev
	poetry run isort format .
    poetry run black .

test:
	tox -e py

lint:
	tox -e lint

type:
	tox -e type

check-format:
	tox -e checkformat
