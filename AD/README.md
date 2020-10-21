<h1>Summary</h1>
The purpose of this repo is to document the code and steps needed to deploy a simple AD (Active Directory) solution in Azure Cloud. The Terraform scripts will deploy two virtual machines (VM), and the PowerShell scripts will configure the VMs with AD functionality post deployment. Given how important timing is for the deployment, the scripts were designed to maximize control during the procedure. Please follow the deployment steps below in order to ensure the AD servers are deployed correctly.
<h1>Deployment Steps</h1>
<ul>
<li>Adjust Terraform variables</li>
<li>Deploy Terraform components (pass in domain name ex: “test”)</li>
<li>Login into first AD VM first and run createUser.ps1</li>
<li>Login into Azure Portal and Update DNS</li>
<li>Login into second AD VM and run builDC.ps1</li>
<li>Login into Azure Portal and Update DNS</li>
</ul>
<h1>Appendix</h1>
<b>Figure 1 (Terraform variables)</b>
<img src="https://dummyimage.com/600x300/c4c4c4/fff"/>
<b>Figure 2  (Terraform apply)</b>
<img src="https://dummyimage.com/600x300/c4c4c4/fff"/>
<b>Figure 3 (createUser.ps1)</b>
<img src="https://dummyimage.com/600x300/c4c4c4/fff"/>
<b>Figure 4 (DNS)</b>
<img src="https://dummyimage.com/600x300/c4c4c4/fff"/>
<b>Figure 5 (buildDC.ps1)</b>
<img src="https://dummyimage.com/600x300/c4c4c4/fff"/>
<b>Figure 5 (DNS)</b>
<img src="https://dummyimage.com/600x300/c4c4c4/fff"/>
