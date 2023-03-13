# Development Guidelines

## Installation

Make sure that you have installed:

* poetry
* tox
* make

* Install to a virtual environment with development dependencies

```sh
make setup-dev
```

* Install to a specific virtual environment

```sh
make setup-dev PYTHON_VERSION=3.11
```

## Routines

Check targets in `Makefile` to be aware of available routines (linting, type checking, formatting, testing).

To run everything (tests on all interpreters, format checking, linting, type checking) simply run

```sh
tox
```
