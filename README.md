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


# CloudFomation

## Requirements

- [AWS CLI](https://aws.amazon.com/cli/)
- [Docker for Mac](https://www.docker.com/docker-mac)
- [yarn](https://yarnpkg.com)

## Setting

- Move working directory

```bash
$ cd cfn
```

- Install yarn

```bash
$ yarn install
```

## Deploy

### 1. Configure AWS credentials

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

### 2. Docker image build

```bash
$ ./build.sh
```

### 3. Deploy

```bash
$ ./run.sh -t <template.yml>
```
