#!/bin/bash
# Login to my AWS ECR
aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 529088281210.dkr.ecr.eu-north-1.amazonaws.com
docker pull 529088281210.dkr.ecr.eu-north-1.amazonaws.com/mlops_ecr:latest
docker stop my-app || true
docker rm my-app || true
docker run -d -p 80:5000 -e DAGSHUB_PAT=b3e227e91a236e7ae7ecd48d0b2cc4358b0cd41e --name campusx-app 529088281210.dkr.ecr.eu-north-1.amazonaws.com/mlops_ecr:latest
