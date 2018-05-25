.PHONY: all build push

$(eval VERSION ?= 1.0.0)
GW=./gradlew
AWS_REGION=us-west-2
AWS_ECR_URL=248240523246.dkr.ecr.${AWS_REGION}.amazonaws.com/hello-world:${USER}-${VERSION}

build:
	$(GW) oneJar
	docker build -t hello-world:${VERSION} .


dockerAWSLogin:
	$(eval AWS_LOGIN:=$(shell aws ecr get-login --no-include-email --region ${AWS_REGION}))
	echo "Logging in to ECR"
	${AWS_LOGIN}

push: dockerAWSLogin
	docker tag hello-world:${VERSION} ${AWS_ECR_URL}
	docker push ${AWS_ECR_URL}
