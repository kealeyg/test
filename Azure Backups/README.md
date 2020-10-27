<h1>Summary</h1>
The purpose of this repo is to document the minimum code needed to deploy a working solution of “Azure Backups”. There are several resources that will have to be deployed in order to set it up which are the Storage Account, Vault, and Backup Policy. All of the coded needed to deploy these resources are included are in the “backups.tf” file. The second terraform file (“sampleVM.tf”) documents the code needed to assign a VM to an Azure Backup policy. Multiple polices can be created in order to meet application specific RPOs. 
<h4>Notes</h4>
It should be noted that Azure doesn’t explicitly state that they support the ability to quiesce third party applications to achieve a consistent state.
