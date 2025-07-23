# **Enterprise based IaC CI/CD Pipeline using Terraform Cloud**

## **Step 1: Setting Up a GitHub Repository**

 - Open your browser and navigate to GitHub.com, then login
 - Click the "+" icon in the top right and select "New repository"
 - Name the repository "terraform-aws-ec2-demo"
 - Add a brief description: "Demo project for creating AWS EC2 instances with Terraform Cloud"
 - Make it public so that students-mates can see and collaborate
 - Check the box to add a README file(optional)
 - Click "Create repository"
 - On your local machine, open Ubuntu WSL Terminal (or Command Prompt) and run:
  
   git clone https://github.com/my-username/terraform-aws-ec2-demo.git
   cd terraform-aws-ec2-demo
   
## **Step 2: Creating a Terraform Configuration File/s from your VSCode**
1. In the repository directory, create a new file called main.tf:
  
   touch main.tf
   
2. Open main.tf in my code editor and add:
  
provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (BIOS boot mode, us-east-1)
  instance_type = "t2.micro"               # Free-tier eligible

  tags = {
    Name = "Terraform_Cloud_WebServer"
  }
}

3. Create another file called s3.tf:
  
   touch s3.tf
   
resource "aws_s3_bucket" "rayeeta_belgium" {
  bucket = "rayeeta-belgium"  # ✅ all lowercase and hyphen-separated
  acl    = "private"

  tags = {
    Name        = "Rayeeta Belgium"
    Environment = "Dev"
  }
}
  
   
## **Step 3: Pushing My Codes to GitHub**
1. Add all the files to git:
  
   git add .
   
2. I commit my changes:
  
   git commit -m "Add initial Terraform configuration files"
   
3. Push to GitHub:
  
   git push origin main
   
## **Step 4: Setting Up Terraform Cloud**

- Open a browser and navigate to app.terraform.io
- Login (or create an account if you don't have one)
- Click "Create new organization" if needed and name it "bmt-terraform-org"
- Once in the organization, click "New workspace"
- Select "Version control workflow"
- Choose GitHub as your provider
- If needed, authorize Terraform Cloud to access your GitHub repositories
- Select the "terraform-aws-ec2-demo" repository
- Name the workspace "aws-ec2-demo"
- Click "Create workspace"

## **Step 5: Configuring AWS Credentials in Terraform Cloud**
## **In AWS go to IAM to create a Users, Create user, Unser details give-a-name**
## **Next, Attach policies directly and select AdministratorAccess, scroll down**
## **and click Next, and Create user. Infront of you will be your:**
## **Access key and Secret access key. Keep them safe to be used below**

1. In Terraform Cloud workspace, click on "Variables"
2. Click "Add variable" and select "Environment variable"
3. Add an AWS access key:
   - Key: AWS_ACCESS_KEY_ID
   - Value: [my-access-key]
   - Check "Sensitive" to hide the value
4. Click "Add variable" again
5. Add the AWS secret key:
   - Key: AWS_SECRET_ACCESS_KEY
   - Value: [my-secret-key]
   - I check "Sensitive
   - Add variable
6. Click Runs to see your "Current Run" and click on the recent run to view the 
   piepline in progress
7. Make sure to follow the instructions to apply, if any errors try as much
   as possible to troubleshoot.
8. Make the necessary changes in your terminal and follow the git workflow to push 
   to GitHub, then Terraform cloud will pick it to run the pipeline.
9. Go to your Terraform cloud account to check the pipeline. Click Runs and followed
   by the Current Run    


## How to create a Terraform Cloud API Token to use in a terminal like Ubuntu WSL

**To create a Terraform Cloud API token and use it in Ubuntu or WSL (Windows Subsystem for Linux), follow these steps:**

Step 1: Generate Your Terraform Cloud API Token
Go to Terraform Cloud.

Log in to your account.

In the upper-right corner, click your avatar > User Settings.

On the left menu, click Tokens.

Click Create an API token.

Name it something like "wsl-terminal-access" and click Create token.

Copy the generated token and store it somewhere safe.

Open your Ubuntu WSL Terminal and type:
terraform login

Paste the api-token from Terraform Cloud and press ENTER

Alternatively:


## **Step 2: Set the API Token in Ubuntu/WSL Terminal**
** **You can set the API token using an environment variable. Run the following in your terminal:**


export TFC_TOKEN=your-api-token-here
Or more precisely for Terraform CLI:


export TERRAFORM_CLOUD_TOKEN=your-api-token-here
Alternatively, configure it for your Terraform CLI:

This will open a browser to authorize Terraform CLI to access Terraform Cloud, or allow you to paste in the 
token manually if browser-based login is not possible.




