## eks-demo
# Task 1. [Automate EKS cluster setup on AWS](https://trello.com/c/VAoIRUBM/2-automate-eks-cluster-setup-on-aws) 

In order to start using current solution following requirement should be met:
- The lastest version of aws cli should be installed.
- Terraform version v1.3.6 or higher must be installed.
- AWS access key and secret key of the user with full permissions for EC2, EKS and IAM.
- kubectl version: v1.24 or higher must be installed.
- eks-demo.sh script was tested on Linux, but should work fine on Mac too.
<br>

Also following configuration should be done in advance: <br> ` aws configure --profile eks`

Follow wizard's intructions and as it is done - you're good to go! <br>
Below is a brief description of how to use the solution. 

1) Clone the repo using folowing command <br> `git clone https://github.com/PetrKalmukhyan/eks-demo.git` <br> and change your current directory to eks-demo <br> `cd ./eks-demo` 
2) To deploy demo EKS cluster and a pod to test S3 access using IAM roles for service accounts, please:
- execute <br> `./eks-demo.sh`
- type <br> `deploy`

3) To test S3 access from test pod, please:
- execute <br> `./eks-demo.sh`
- type <br> `tests3`

4) To destroy demo environment, please:
- execute <br> `./eks-demo.sh`
- type  <br> `destroy`


# Task 2. [Managing secrets on Kubernetes](https://trello.com/c/EpQ4mfMj/5-managing-secrets-on-kubernetes) 
Storing sensitive data in git repos, like secrets, sound like a common issue for the small development teams. However, keeping secrets in git repo is not a best practice, so for this case I'd recommend to implement Kubernetes Secrets, to store sensitive information. Unfortunately, be default, Kubernetes stores secrets only base64 encoded, which in not secure either. Two solutions described below are aimed to solve that that challenge:
1. [AWS Secrets and Configuration Provider (ASCP)](https://docs.aws.amazon.com/secretsmanager/latest/userguide/integrating_csi_driver.html). In spite of native integration with AWS, this solution might require an additional development, as it has different secret query mechanism.
2. [External Secrets](https://external-secrets.io). This solution provides seamless integration with AWS Secrets Managem and similar services from other cloud prodivers and can be used to map secrets directly into the pod. A huge plus is that no additional development is required.
<br>
With all things equal I'd recommend option 2.