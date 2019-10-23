#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-1 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=819816673551.dkr.ecr.us-east-1.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-c43f74be \
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-east-1:819816673551:listener/app/production-website/a54931960a315fbc/57cadc0f28784b59