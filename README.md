# nr-terraform-dashboards
Sample terraform configuration for creating NR dashboards

Make sure the terraform CLI is installed or install it before following any of the steps below. Here is more information about how to install it:

[How to install terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)


After modifiying the config files with your own configurations you can run the following commands to create the dashboar in your New Relic account:

**First this command ro create and visualize a plan:**

*terraform plan -var NEWRELIC_ACCOUNT_ID=<Your Account RPM ID> -var NEWRELIC_API_KEY="<YOu NR user Admin API Key>" -var NEWRELIC_REGION="<US or EU>" -var dashboard_name="<Your Dashboard Name>" -var entity_id="<Entity ID if applicable>" -var app_name="<You APM App Name if Applicable>"*

**Then run the following command to apply the changes**

*terraform plan -var NEWRELIC_ACCOUNT_ID=<Your Account RPM ID> -var NEWRELIC_API_KEY="<YOu NR user Admin API Key>" -var NEWRELIC_REGION="<US or EU>" -var dashboard_name="<Your Dashboard Name>" -var entity_id="<Entity ID if applicable>" -var app_name="<You APM App Name if Applicable>"*


