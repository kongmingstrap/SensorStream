SensorStream
=======

# Requirements

- [AWS CLI](https://aws.amazon.com/cli/)
- [Docker for Mac](https://www.docker.com/docker-mac)

## Development

- [pyenv](https://github.com/pyenv/pyenv)
- [localstack](https://github.com/localstack/localstack)

# Architecture
![architecture](https://github.com/kongmingstrap/SensorStream/blob/master/architecture.png "architecture")

# Setting

## 1. Python

### shell

```shell
$ pyenv local 3.6.4
$ python -m venv .venv3
$ source .venv3/bin/activate
$ pip install pipenv
$ pipenv install
```

### fish shell

```shell
$ pyenv local 3.6.4
$ python -m venv .venv3
$ source .venv3/bin/activate.fish
$ pip install pipenv
$ pipenv install
```

# Deploy

## 1. Configure AWS credentials

- `~/.aws/credentials`

```bash
[sensor-stream-development]
aws_access_key_id = <your_aws_access_key_id>
aws_secret_access_key = <your_aws_secret_access_key>
```

- `~/.aws/config`

```bash
[profile sensor-stream-development]
region = ap-northeast-1
output = json
```
