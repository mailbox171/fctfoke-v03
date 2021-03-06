# Identity and access parameters
#api_fingerprint = ""
#api_private_key_path = ""
#region = "us-phoenix-1"
#tenancy_id = ""
#user_id = ""

# general oci parameters
#compartment_id = ""
#label_prefix = "dev"

# ssh keys
#ssh_private_key_path = ""
#ssh_public_key_path = ""



# networking

create_drg = false

drg_display_name = "drg"

internet_gateway_route_rules = [
  /*
    {
      destination = "192.168.1.0/24"
      destination_type = "CIDR_BLOCK"
      network_entity_id = "drg" // use drg created by this module. Requires `create_drg = true`
      description = "route through drg"
    },
    {
      destination = "8.8.8.0/24"
      destination_type = "CIDR_BLOCK"
      network_entity_id = "internet_gateway" // use Internet Gateway created by this module. Requires `internet_gateway_enabled = true`
      description = "route through Internet Gateway"
    },
    {
      destination = "8.8.8.0/24"
      destination_type = "CIDR_BLOCK"
      network_entity_id = "ocid1.drg." // use an externally created resource or a resource that was not available at the time of the 1st run`
      description = "route through an externally created resource or a resource that was not available at the time of the 1st run"
    }
    */
]

lockdown_default_seclist = false

nat_gateway_route_rules = [
  /*
    {
      destination = "192.168.1.0/24"
      destination_type = "CIDR_BLOCK"
      network_entity_id = "drg" // use drg created by this module. Requires `create_drg = true`
      description = "route through drg"
    },
    {
      destination = "8.8.8.0/24"
      destination_type = "CIDR_BLOCK"
      network_entity_id = "nat_gateway" // use NAT gateway created by this module. Requires `nat_gateway_enabled = true`
      description = "route through NAT gateway"
    },
    {
      destination = "8.8.8.0/24"
      destination_type = "CIDR_BLOCK"
      network_entity_id = "ocid1.drg." // use an externally created resource or a resource that was not available at the time of the 1st run`
      description = "route through an externally created resource or a resource that was not available at the time of the 1st run"
    }
    */
]

netnum = {
  bastion  = 0
  cp       = 2
  int_lb   = 16
  operator = 1
  pub_lb   = 17
  workers  = 1
}

newbits = {
  bastion  = 14
  cp       = 14
  lb       = 11
  operator = 14
  workers  = 2
}

vcn_cidr = "10.0.0.0/16"

vcn_dns_label = "oke"

vcn_name = "oke vcn" 


# bastion

bastion_access = "ANYWHERE"

bastion_enabled = true

bastion_image_id = "Autonomous"

bastion_notification_enabled = false

bastion_notification_endpoint = "<email_address>"

bastion_notification_protocol = "EMAIL"

bastion_notification_topic = "bastion_server_notification"

bastion_operating_system_version = "7.9"

bastion_package_upgrade = false

bastion_shape = {
  # shape = "VM.Standard.E2.2"
  shape            = "VM.Standard.E3.Flex",
  ocpus            = 1,
  memory           = 4,
  boot_volume_size = 50
}

bastion_state = "RUNNING"

bastion_timezone = "Australia/Sydney"

operator_enabled = true

operator_image_id = "Oracle"

operator_instance_principal = true

operator_notification_enabled = false

operator_notification_endpoint = ""

operator_notification_protocol = "EMAIL"

operator_notification_topic = "operator_server_notification"

operator_package_upgrade = true

operator_shape = {
  # shape = "VM.Standard.E2.2"
  shape            = "VM.Standard.E3.Flex",
  ocpus            = 1,
  memory           = 4,
  boot_volume_size = 50
}

operator_timezone = "Australia/Sydney"

operator_version = "8"

# availability_domains

availability_domains = {
  bastion  = 1
  operator = 1
}

# tags

tags = {
  # vcn, bastion and operator tags are required
  # add more tags in each as desired
  vcn = {
    # department = "finance"
    environment = "dev"
  }
  bastion = {
    # department  = "finance"
    environment = "dev"
    role        = "bastion"
  }
  operator = {
    # department = "finance"
    environment = "dev"
    role        = "operator"
  }
}

# oke

admission_controller_options = {
  PodSecurityPolicy = false
}

allow_node_port_access = false

allow_worker_ssh_access = false

cluster_access = "public"

cluster_access_source = "0.0.0.0/0"

#cluster_name = "oke"
cluster_name = "FR K8s Cluster"


check_node_active = "none"

dashboard_enabled = false

#to be overrided
kubernetes_version = "v1.19.7"

#node_pools = {
  #np1 = { shape = "VM.Standard.E3.Flex", ocpus = 2, memory = 20, node_pool_size = 2, boot_volume_size = 150 }
  #np2 = { shape = "VM.Standard.E2.2", node_pool_size = 2, boot_volume_size = 150, label = { app = "application", name = "test" } }
  #np3 = { shape = "VM.Standard.E2.2", node_pool_size = 1 }
  #np1 = { shape = "VM.Standard.E2.2", node_pool_size = 3 }
#}


#Only takes effect when nodepool_drain is true
#node_pools_to_drain = ["np1", "np2", "np3"]
node_pools_to_drain = ["np1"]
nodepool_drain = false

nodepool_upgrade_method = "out_of_place"

node_pool_name_prefix = "np"

#to be overrided
node_pool_image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaauf3vss4np44dl3vnbzyuwm6cic7hpfwk6dsxpecgorsgkky463hq"
node_pool_os = "Oracle Linux"
node_pool_os_version = "7.9"

pods_cidr = "10.244.0.0/16"

services_cidr = "10.96.0.0/16"

use_signed_images = false

worker_mode = "private"

# oke load balancers
lb_subnet_type = "public"

preferred_lb_subnets = "public"

public_lb_ports = [80, 443]

waf_enabled = false

# ocir
email_address = ""

secret_id = "none"

secret_name = "ocirsecret"

username = ""

# calico
calico_enabled = false
calico_version = "3.19"

#metrics server
metricserver_enabled = false

vpa = {
  enabled = false,
  version = 0.8
}

# kms
use_encryption = false

existing_key_id = ""

image_signing_keys = ["ocid1.key.oc1....", "ocid1.key.oc1...."]

# service account
create_service_account = true

service_account_name = "kubeconfigsa"

service_account_namespace = "kube-system"

service_account_cluster_role_binding = "cluster-admin"
