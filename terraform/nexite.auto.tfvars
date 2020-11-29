
cluster_name = "ofir-games"
environment  = "staging"
project_id   = "ornate-veld-292519"
region       = "us-central1"
location     = "us-central1"
zones = [
  "us-central1-a",
  "us-central1-b",
  "us-central1-c"
]
name = "gke-cluster"

service_account         = "terraform@ornate-veld-292519.iam.gserviceaccount.com"
credentials             = "./terraform-gke-keyfile.json"
enable_private_nodes    = true
node_config_preemptible = true // gcp spot instance
master_authorized_networks_config = [
  {
    cidr_blocks = [
      {
        cidr_block   = "46.116.45.255/32"
        display_name = "ofir house"
      }
    ]
}]

// For first time use go to this guide
//https://www.padok.fr/en/blog/kubernetes-google-cloud-terraform-cluster
//gcloud iam service-accounts create terraform
//gcloud projects add-iam-policy-binding ornate-veld-292519 --member serviceAccount:terraform@ornate-veld-292519.iam.gserviceaccount.com --role roles/container.admin
//gcloud projects add-iam-policy-binding ornate-veld-292519 --member serviceAccount:terraform@ornate-veld-292519.iam.gserviceaccount.com --role roles/compute.admin
//gcloud projects add-iam-policy-binding ornate-veld-292519 --member serviceAccount:terraform@ornate-veld-292519.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin
//gcloud projects add-iam-policy-binding ornate-veld-292519 --member serviceAccount:terraform@ornate-veld-292519.iam.gserviceaccount.com --role roles/iam.serviceAccountAdmin
//gcloud iam service-accounts keys create terraform-gke-keyfile.json --iam-account=terraform@ornate-veld-292519.iam.gserviceaccount.com

//gcloud container clusters get-credentials nexite --zone us-central1
