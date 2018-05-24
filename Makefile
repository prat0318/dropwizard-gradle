.PHONY: all build push

GW=./gradlew
AWS_REGION=us-west-2
AWS_BLITZ_CLI=${DOCKER_REGISTRY}/cps/docker-aws-cli:latest
AWS_ECR_URL=248240523246.dkr.ecr.us-west-2.amazonaws.com/hello-world:${USER}-1

build:
	$(GW) oneJar
	docker build -t hello-world:1.0.0 .


dockerAWSLogin:
	$(eval AWS_LOGIN:=$(shell aws ecr get-login --no-include-email --region ${AWS_REGION}))
	echo "Logging in to ECR"
	${AWS_LOGIN}

push: dockerAWSLogin
	docker tag hello-world:1.0.0 ${AWS_ECR_URL}
	docker push ${AWS_ECR_URL}
