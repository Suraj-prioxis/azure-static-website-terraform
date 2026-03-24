#  Azure Static Website Hosting using Terraform

This project deploys a **static website** to Azure Storage using Terraform.  
It automatically uploads `index.html` and `style.css` to the `$web` container and outputs your live website URL.

---

##  Features

- Creates Azure Resource Group  
- Generates a unique Storage Account using Random provider  
- Enables **Azure Static Website Hosting**  
- Uploads HTML & CSS files to `$web` container  
- Outputs your public website URL  
- Clean `.gitignore` file included  
- Beginner‑friendly Terraform project  

---

##  Folder Structure

project_static_website/
│
├── main.tf               # Terraform configuration
├── index.html            # Website homepage
├── style.css             # Website CSS styling
├── .gitignore            # Files ignored by Git
└── README.md             # Project documentation

---

##  Prerequisites

Install these tools before you deploy:

- Terraform v1.x  
- Azure CLI  
- Git  
- VS Code (optional)

### Login to Azure:

```bash
az login


How to Deploy\

1. Initialize Terraform
terraform init

2. Validate the configuration
terraform validate

3. Preview what Terraform will create
terraform plan

4. Apply the deployment
terraform apply -auto-approve

 After successful deployment, Terraform will show:
 static_website_url = C:/Users/hypeteqwsadmin/Desktop/terraform_projects/project_static_website/index.html


Technologies Used

Terraform
Azure Cloud
Azure Storage Static Website
Random Provider



Future Improvements

Add GitHub Actions CI/CD
Add remote backend using Azure Storage
Add dev/prod environments using workspaces
Upload the entire website folder automatically
Add Azure CDN for global performance

Author
Suraj Chandel – DevOps Engineer