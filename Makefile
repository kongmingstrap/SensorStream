SHELL = /usr/bin/env bash -xeuo pipefail

localstack-up:
	@docker-compose up -d localstack

localstack-stop:
	@docker-compose stop localstack

lint:
	@python -m flake8 src

unit-test:
	@for handler in $$(find src -maxdepth 3 -type d -name 'tests'); do \
		pwd_dir=$$PWD; \
		handler_dir=$$(dirname $$handler); \
		handler_name=$$(basename $$(dirname $$handler)); \
		cd $$handler_dir && \
			AWS_DEFAULT_REGION=ap-northeast-1 \
			AWS_ACCESS_KEY_ID=dummy \
			AWS_SECRET_ACCESS_KEY=dummy \
			python -m pytest tests; \
		cd $$pwd_dir; \
	done

validate:
	@aws cloudformation validate-template \
		--template-body file://sam.yml

deploy:
	@aws cloudformation package \
						--template-file sam.yml \
						--s3-bucket sensor-stream-sam-artifacts-$$(aws sts get-caller-identity | jq .Account | sed 's/\"//g')-ap-northeast-1 \
						--output-template-file template.yml

	@aws cloudformation deploy \
						--template-file template.yml \
						--stack-name sensor-stream-functions \
						--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
						--role-arn arn:aws:iam::$$(aws sts get-caller-identity | jq .Account | sed 's/\"//g'):role/sensor-stream-sensor-stream-sam/sam-deploy-role \
						--no-fail-on-empty-changeset

.PHONY: \
	localstack-up \
	localstack-down \
	lint \
	unit-test \
	validate \
	deploy
