# Platform code to provision GKE and Cloud SQL
## Pre-requisites
1. Enable Service Usage API from GCP Console
2. APIs should be enabled before the Kubernetes modules are called
3. Setup access to Cloudbuild SA following instructions from - https://cloud.google.com/architecture/managing-infrastructure-as-code
4. Create a secret for storing Cloud SQL Database password in Google Secret Manager
## GKE
### Infrastructure deployment 
Merge to the develop branch triggers the Kubernetes deployment
## Cloud SQL
## References
https://cloud.google.com/architecture/managing-infrastructure-as-code
https://github.com/epiphone/gke-terraform-example