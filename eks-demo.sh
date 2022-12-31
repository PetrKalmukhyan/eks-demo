#!/bin/bash
#Variables
TF_VAR_FILE="var_dev_env.tfvars"
REPLACE="REPLACE_ME"
EKS_REGION="us-east-1"
EKS_CLUSTER_NAME="demo"
AWS_PROFILE="eks"

read -e -p "Please choose what do to: deploy, tests3 or destroy: " input
echo $input

case $input in
deploy)    
# Deploying demo environment
echo "Deploying demo environment ..." && terraform init && terraform -chdir=./eks apply -var-file=$TF_VAR_FILE -auto-approve 
# Get IAM role
IAM_ROLE=$(aws iam get-role --role-name test-oidc --profile eks --output yaml | grep Arn | awk '{ print $2 }')
echo $IAM_ROLE
# Replace role in template
cp ./k8s/pod-role-test.yaml.template ./k8s/pod-role-test.yaml
sed -i "s|$REPLACE|$IAM_ROLE|g" ./k8s/pod-role-test.yaml
# Get EKS credentials
aws eks update-kubeconfig --region $EKS_REGION --name $EKS_CLUSTER_NAME --profile $AWS_PROFILE
#Deploying test pod
kubectl apply -f ./k8s/ && echo "Test pod has been successfully created."
;;
tests3)
# Test S3 access
kubectl exec aws-cli -- aws s3api list-buckets
;;
destroy)
# Destroing demo environment
echo "Destroing demo environment ..." && terraform -chdir=./eks destroy -var-file=$TF_VAR_FILE -auto-approve && rm -f ./k8s/pod-role-test.yaml
;;
*)
echo "Please choose: deploy, test or destroy"
esac