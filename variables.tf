#
#  Local Variables
#  You man want to put these in a variables.tf file
#  Do not check a file containing these variables in a public repository

locals {
  # Replace PUBLIC_KEY, PRIVATE_KEY, ORG_ID, PROJECT_ID and CLUSTER NAME with your Atlas variables
  mongodb_atlas_api_pub_key = "####"
  mongodb_atlas_api_pri_key = "#####-####"
  mongodb_atlas_org_id  = "#####"
  mongodb_atlas_project_id = "#####"
  mongodb_atlas_cluster_name = "TestCluster"
  
  # Replace USERNAME And PASSWORD with what you want for your database user
  # https://docs.atlas.mongodb.com/tutorial/create-mongodb-user-for-cluster/
  mongodb_atlas_database_username  = "demo_user"
  mongodb_atlas_database_user_password = "d3m0_p4ss"

  # Replace IP_ADDRESS with the IP Address from where your application will connect
  # https://docs.atlas.mongodb.com/tutorial/whitelist-connection-ip-address/
  mongodbatlas_public_ip_address = "192.0.0.1"
}

