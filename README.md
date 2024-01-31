## About

This is code for the Archimedic project. The objectives of this project are:

* Help healthcare administrators identify 90%+ of potential misdiagnoses
* Help patients estimate the cost of their hospital visit with 90% accuracy

The output of this project is a decision support system that meets the project's objectives

## Setup

### Setting up precommit

Set up the required git hooks for inspecting and formatting code using [pre-commit](https://pre-commit.com).

```
pre-commit install
```

See `.pre-commit-config.yaml` to view hooks used to check files before submission.

### Building the environment

This environment runs via docker. Build your docker container using the build script

```
sh scripts/build.sh
```

### Running the app

#### Running in dev mode

Running the container in dev mode allows you to access a jupyter notebook environment at port `8888`, the ML REST API at port `80` and a demo streamlit client at port `8501`:

```
docker compose -f docker-compose-dev.yml up -d
```

#### Running in production mode

Running the container in production mode allows you to access the ML REST API at port `80`:

```
docker compose up -d
```

## Using the archimedic package

This project comprises 2 major packages:

* archimedic located at `./archimedic/`. Code for manipulating data related to this project
* api located at `./api/`. Contains code for an ML API built with FastAPI

## Training the ML model

The model is trained via an interactive cli script: `./api/cli.py`.

To train and save a new instance of the project's machine learning model as well as its report, you may run:

```shell
docker compose exec api python api/cli.py "/path/to/destination_folder" - t default -p logistic
```

The parameter -t indicates the value for the type of transformer selected for training the model. e.g. standard one-hot scaling. Supported transformers include:

1. TODO: Finish me

The parameter -p indicates the value for the type of model/predictor selected for training the model .e.g logistic regression. Supported predictors include:

1. TODO: Finish me

To see all available parameters for the script, run

```shell
docker compose exec api python api/cli.py --help
```

## Deploying the ML REST APIs

Section to be completed

# Further work: Recommendations

Section to be completed
