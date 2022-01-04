# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace
resource "aws_service_discovery_private_dns_namespace" "cotb_cluster_sd_private_dns" {
  # The name of the namespace.
  name        = "cotb.cluster"
  # The description that you specify for the namespace when you create it.
  description = "Discovery namespace for cotb cluster"
  # The ID of VPC that you want to associate the namespace with.
  vpc         = aws_vpc.cotb_cluster_vpc.id

  tags = {
    Name = "cotb-cluster-sd-private-dns"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service
resource "aws_service_discovery_service" "cotb_cluster_sd_service_one" {
  # The name of the service.
  name = "cotb-cluster-sd-service-one"

  # contains information about the resource record sets that you want Amazon Route 53 
  # to create when you register an instance.
  dns_config {
    # The ID of the namespace to use for DNS configuration.
    namespace_id = aws_service_discovery_private_dns_namespace.cotb_cluster_sd_private_dns.id

    # An array that contains one DnsRecord object for each resource record set.
    dns_records {
      ttl  = 30
      type = "SRV"
    }

    # The routing policy that you want to apply to all records that Route 53 creates 
    # when you register an instance and specify the service.
    routing_policy = "WEIGHTED"
  }

  # Contains settings for ECS managed health checks.
  health_check_custom_config {
    # The number of 30-second intervals that you want service discovery to wait before 
    # it changes the health status of a service instance.
    failure_threshold = 1
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service
resource "aws_service_discovery_service" "cotb_cluster_sd_service_two" {
  # The name of the service.
  name = "cotb-cluster-sd-service-two"

  # contains information about the resource record sets that you want Amazon Route 53 
  # to create when you register an instance.
  dns_config {
    # The ID of the namespace to use for DNS configuration.
    namespace_id = aws_service_discovery_private_dns_namespace.cotb_cluster_sd_private_dns.id

    # An array that contains one DnsRecord object for each resource record set.
    dns_records {
      ttl  = 30
      type = "SRV"
    }

    # The routing policy that you want to apply to all records that Route 53 creates 
    # when you register an instance and specify the service.
    routing_policy = "WEIGHTED"
  }

  # Contains settings for ECS managed health checks.
  health_check_custom_config {
    # The number of 30-second intervals that you want service discovery to wait before 
    # it changes the health status of a service instance.
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "cotb_cluster_sd_service_three" {
  # The name of the service.
  name = "cotb-cluster-sd-service-three"

  # contains information about the resource record sets that you want Amazon Route 53 
  # to create when you register an instance.
  dns_config {
    # The ID of the namespace to use for DNS configuration.
    namespace_id = aws_service_discovery_private_dns_namespace.cotb_cluster_sd_private_dns.id

    # An array that contains one DnsRecord object for each resource record set.
    dns_records {
      ttl  = 30
      type = "SRV"
    }

    # The routing policy that you want to apply to all records that Route 53 creates 
    # when you register an instance and specify the service.
    routing_policy = "WEIGHTED"
  }

  # Contains settings for ECS managed health checks.
  health_check_custom_config {
    # The number of 30-second intervals that you want service discovery to wait before 
    # it changes the health status of a service instance.
    failure_threshold = 1
  }
}