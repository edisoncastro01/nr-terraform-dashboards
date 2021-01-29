# nr-terraform-dashboards

[![Sample Dashboard](https://github.com/edisoncastro01/nr-terraform-dashboards/blob/master/Screenshots/SampleDashboard.png)](https://github.com/edisoncastro01/nr-terraform-dashboards)

## Sample terraform configuration for creating NR dashboards

-Make sure the terraform CLI is installed or install it before following any of the steps below. Here is more information about how to install it:

[How to install terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)

-Create a working directory and copy all the *.tf files on this repo:
      
      To create the directory use:   mkdir YourDirectoryName

-Change directory to the create directory
      
      To cnage to the new directory:  cd YourDirectoryName

-Download the repo zip file:
      To download the repo zip file: [![Download repo Zip file](https://github.com/edisoncastro01/nr-terraform-dashboards/blob/master/Screenshots/GithubRepoZidDownload.png)](https://github.com/edisoncastro01/nr-terraform-dashboards)

-Uzip the repo file into your new directory

-After modifiying the config files with your own configuration you can run the following commands to create the dashboard in your New Relic account:

**First run this command to create and visualize a plan:**
       
       *terraform plan -var NEWRELIC_ACCOUNT_ID=<Your Account RPM ID> -var NEWRELIC_API_KEY="<YOu NR user Admin API Key>" -var NEWRELIC_REGION="<US or EU>" -var   dashboard_name="<Your Dashboard Name>" -var entity_id="<Entity ID if applicable>" -var app_name="<You APM App Name if Applicable>"*

**Then run the following command to apply the changes:**

       *terraform plan -var NEWRELIC_ACCOUNT_ID=<Your Account RPM ID> -var NEWRELIC_API_KEY="<YOu NR user Admin API Key>" -var NEWRELIC_REGION="<US or EU>" -var dashboard_name="<Your Dashboard Name>" -var entity_id="<Entity ID if applicable>" -var app_name="<You APM App Name if Applicable>"*
  
  
[Here is more information about the terraform newrelic provider](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs)

[And here are more details about the newrelic dashboard resource](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/dashboard)


