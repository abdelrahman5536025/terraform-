# terraform
## Terraform Project - AWS VPC, Subnets, and EC2 Instances, load balancers ,proxy
This project creates an AWS VPC with both private and public subnets. 
It also provisions two EC2 instances ,in each . The public subnet allows HTTP and SSH traffic,
while the private subnet does not have direct internet access and private Ec2 used private load balancer to access the internet through the redirection
that comes from the proxy in public Ec2 . the public Ec2 accesses internet using public load balancer


## project structure

![Screenshot from 2023-06-16 04-32-39](https://github.com/abdelrahmanmetwally/terraform-/assets/93939024/cd1e547a-22b8-4f7e-917e-e5adf3dea150)


## prerequisites

to run the Terraform project, make sure you have the following prerequisites :

AWS account credentials with appropriate permissions to create resources.
Terraform installed on your machine. You can download Terraform from the official website: Terraform Downloads.
Configure AWS credentials on your local machine or provide them as environment variables.

## usage

Follow these steps to deploy the infrastructure using Terraform:

1.Clone the repository:

```
 git clone https://github.com/abdelrahmanmetwally/terraform.git
 ```
2.Change into the project directory:

 ```
 cd terraform 
 ```

3.Initialize the Terraform project:
```
 terraform init
```
4.Review and customize the variables in variables.tf file as per your requirements.

5.(Optional) Modify the main.tf file to add any additional resources or configurations.

6.Plan the infrastructure deployment:
```
 terraform plan
 ```
This command will display the execution plan and show the resources that Terraform will create.

7.Deploy the infrastructure:
```
 terraform apply
```
Confirm the deployment by typing yes when prompted.

8.Wait for Terraform to provision the resources. It may take a few minutes.

9.Once the deployment is complete, the output variables will be displayed, including the public IP and private IP of the created EC2 instances.

10.To destroy the infrastructure and remove all resources:
```
 terraform destroy
```
Confirm the destruction by typing yes when prompted.


## customization
Feel free to customize the project as it suits your  implementation . You can modify the variables.tf file and , or update the main.tf file to add additional resources or configurations.

## contributions

Contributions are most welcomed! If you find any issue or have suggestion, please open an issue or submit a pull request in the GitHub repository.

