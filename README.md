## eks-demo
# Task 1. [Automate EKS cluster setup on AWS](https://trello.com/c/VAoIRUBM/2-automate-eks-cluster-setup-on-aws) 

In order to start using current solution following requirement should be met:
- The lastest version of aws cli should be installed.
- Terraform version v1.3.6 or higher should be installed.
- AWS access key and secret key of the user with full permissions for EC2, EKS and IAM 
<br>

Also following configuration should be done in advance: <br> ` aws configure --profile eks`

Follow wizard's intructions and as it is done - you're good to go! <br>
Below is a brief description of how to use the solution. 

1) Clone the repo using folowing command <br> `git clone https://github.com/PetrKalmukhyan/eks-demo.git` <br> and change your current directory to eks-demo <br> `cd ./eks-demo` 
2) To deploy demo EKS cluster and a pod to test S3 access using IAM roles for service accounts, please:
- execute <br> `./eks_demo.sh`
- type <br> `deploy`

3) To test S3 access from test pod, please:
- execute <br> `./eks_demo.sh`
- type <br> `tests3`

4) To destroy demo environment, please:
- execute <br> `./eks_demo.sh`
- type  <br> `destroy`


# Task 2. [Managing secrets on Kubernetes](https://trello.com/c/EpQ4mfMj/5-managing-secrets-on-kubernetes) 