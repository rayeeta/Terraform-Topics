**Step-by-step guide** to install Terraform in a WSL (Windows Subsystem for Linux) terminal and integrate your local environment with AWS:

---

## ** 1. Install Terraform in WSL**

**a. Update your package list:**
```
sudo apt-get update
```

**b. Install dependencies:**
```
sudo apt-get install -y wget unzip
```

**c. Download the latest Terraform release:**
```
wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip
```
*(Check [Terraform releases](https://releases.hashicorp.com/terraform/) for the latest version if needed.)*

**d. Unzip and move the binary:**
```
unzip terraform_1.8.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```

**e. Verify installation:**
```
terraform -version
```

---

## **2. Install AWS CLI in WSL**

**a. Download and install AWS CLI:**
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**b. Verify installation:**
```
aws --version
```

---

## **3. Configure AWS Credentials**

**a. Run the AWS configure command:**
```
## Make sure you have your Access Key already created in AWS before you continue this step

aws configure
```
- Enter your AWS Access Key ID
- Enter your AWS Secret Access Key
- Enter your default region (e.g., `us-east-1`)
- Enter your default output format (e.g., `json`)

**b. Credentials are stored in:**  
`~/.aws/credentials` and `~/.aws/config`

---

## **4. Test Terraform AWS Integration**

**a. Create a new directory for your Terraform project:**
```
mkdir bmt_tf_demo && cd bmt_tf_demo
```

**b. Create a simple Terraform file (e.g., `main.tf`):**
```
nano main.tf
```
Paste this as a test:
```
provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI for us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "BMT_EC2"
  }
}

```

**c. Initialize and apply:**
```
terraform init
terraform fmt
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```
- Type `yes` when prompted.

**d. You should see your AWS account ID as output, confirming integration is successful.**

---


##########################################################################################################################

# Terraform & AWS CLI Installation

## A) Prerequisites
- Install Terraform CLI
- Install AWS CLI
- Install VS Code Editor - recommended for this course
- Install HashiCorp Terraform plugin for VS Code - recommended


## B) MACOS - Terraform Install
- [Download Terraform MAC](https://www.terraform.io/downloads.html)
- [Install CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Unzip the package
```
# Copy binary zip file to a folder
mkdir /Users/<YOUR-USER>/Documents/terraform-install
COPY Package to "terraform-install" folder

# Unzip
unzip <PACKAGE-NAME>
unzip terraform_1.0.10_darwin_amd64.zip

# Copy terraform binary to /usr/local/bin
echo $PATH
mv terraform /usr/local/bin

# Verify Version
terraform version

# To Uninstall Terraform (NOT REQUIRED)
rm -rf /usr/local/bin/terraform
```

## C) MACOS - Install VSCode Editor and terraform plugin
- [Microsoft Visual Studio Code Editor](https://code.visualstudio.com/download)
- [Hashicorp Terraform Plugin for VS Code](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)


### D) MACOS - Install AWS CLI
- [AWS CLI Install](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [Install AWS CLI - MAC](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd)

```
# Install AWS CLI V2
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
which aws
aws --version

# Uninstall AWS CLI V2 (NOT REQUIRED)
which aws
ls -l /usr/local/bin/aws
sudo rm /usr/local/bin/aws
sudo rm /usr/local/bin/aws_completer
sudo rm -rf /usr/local/aws-cli
```


## E) MACOS - Configure AWS Credentials
- **Pre-requisite:** Should have AWS Account.
  - [Create an AWS Account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)

- **Role**:
-If your terraform server is in the cloud, then create a role and attach the role to your server.


- Generate Security Credential s using AWS Management Console
  - Go to Services -> IAM -> Users -> "Your-Admin-User" -> Security Credentials -> Create Access Key
- Configure AWS credentials using SSH Terminal on your local desktop

# **Configure AWS Credentials in command line**
```
$ aws configure

Default region name [None]: us-west-2
Default output format [None]: json

# Verify if we are able list S3 buckets
aws s3 ls
```
- Verify the AWS Credentials Profile
```
cat $HOME/.aws/credentials
```
#**Command to reset your AWS credentials incase of a credentials error**:

$ for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN ; do eval unset $var ; done

## F) Windows OS - Terraform & AWS CLI Install
- [Download Terraform](https://www.terraform.io/downloads.html)
- [Install CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Unzip the package
- Create new folder `binaries`
- Copy the `terraform.exe` to a `binaries`
- Set PATH in windows
   **How to set the windows path: Windows 8/10**
          In Search, search for and then select:
          System (Control Panel)
          Click the Advanced system settings link.
          Click Environment Variables.
          In the section System Variables find the PATH environment variable and select it.
          Click Edit. If the PATH environment variable does not exist, click New.
          In the Edit System Variable (or New System Variable) window, specify the value of the PATH environment variable.
          Click OK. Close all remaining windows by clicking OK.

- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

## Terraform install on windows using a packet manager
-Install terraform on windows using the windows package manager(Use powershell and install as administrator).
    **$ choco install terraform**

## G) Linux OS - Terraform & AWS CLI Install
- [Download Terraform](https://www.terraform.io/downloads.html)
- [Linux OS - Terraform Install](https://learn.hashicorp.com/tutorials/terraform/install-cli)

# Install Terraform on Ubuntu:
     $sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
     $curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
     $sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
     $sudo apt-get update && sudo apt-get install terraform

# Install Terraform on RHEL:
      **Install aws cli**
      sudo yum update -y
      sudo yum install curl unzip wget -y  
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      sudo ./aws/install

      **Install Terraform**
      a) *Download binary*
      sudo yum update -y
      sudo yum install wget unzip -y
      sudo wget https://releases.hashicorp.com/terraform/1.4.4/terraform_1.1.4_linux_amd64.zip
      sudo unzip terraform_1.1.4_linux_amd64.zip -d /usr/local/bin
      terraform -v

      b) *Install from hashicorp repo*
     sudo yum install -y yum-utils
     sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
     sudo yum -y install terraform
