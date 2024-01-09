#
# Example Terraform Config to create a
# MongoDB Atlas Dedicated Tier Cluster,
# Database User and Project IP Whitelist Entry
#
# First step is to create a MongoDB Atlas account
# https://docs.atlas.mongodb.com/tutorial/create-atlas-account/
#
# Then create an organization and programmatic API key
# https://docs.atlas.mongodb.com/tutorial/manage-organizations
# https://docs.atlas.mongodb.com/tutorial/manage-programmatic-access
#
# Terraform MongoDB Atlas Provider Documentation
# https://www.terraform.io/docs/providers/mongodbatlas/index.html
# Terraform 0.12+, MongoDB Atlas Provider 0.4.2+

#
#  Local Variables
#  You man want to put these in a variables.tf file

#
# Configure the MongoDB Atlas Provider
#
provider "mongodbatlas" {
  public_key = local.mongodb_atlas_api_pub_key
  private_key  = local.mongodb_atlas_api_pri_key
}


#
# Create a Dedicated Tier Cluster
#
resource "mongodbatlas_cluster" "test" {
  project_id   = local.mongodb_atlas_project_id
  name         = local.mongodb_atlas_cluster_name
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "US_EAST"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  mongo_db_major_version       = "6.0"

  # Provider Settings "block"
  provider_name               = "AZURE"
  provider_instance_size_name = "M10"
  cloud_backup                = true   // enable cloud backup snapshots
  pit_enabled                 = true
}


#
# Create an Atlas Admin Database User
#
resource "mongodbatlas_database_user" "my_user" {
  username 		= local.mongodb_atlas_database_username
  password 	 	= local.mongodb_atlas_database_user_password
  project_id            = local.mongodb_atlas_project_id
  auth_database_name	 	= "admin"

  roles {
    role_name     	= "atlasAdmin"
    database_name 	= "admin"
  }
}

#
# Create an IP Whitelist
#
# can also take a CIDR block or AWS Security Group -
# replace ip_address with either cidr_block = "CIDR_NOTATION"
# or aws_security_group = "SECURITY_GROUP_ID"
#
resource "mongodbatlas_project_ip_access_list" "my_ipaddress" {
      project_id = local.mongodb_atlas_project_id
      ip_address = local.mongodbatlas_public_ip_address
      comment    = "My IP Address"
}

