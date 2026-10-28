# AWS Networking Design

## Overview

The platform uses a custom AWS VPC in the `us-east-1` region to host
the Amazon EKS cluster and the Hospital Management application.

## Network Configuration

- VPC CIDR: `10.0.0.0/16`
- Public subnets: `10.0.1.0/24`, `10.0.2.0/24`
- Private subnets: `10.0.11.0/24`, `10.0.12.0/24`
- Internet Gateway: Provides internet routing for public subnets.
- NAT Gateway: Allows private-subnet resources to initiate outbound
  internet connections.
- Elastic IP: Provides a static public IPv4 address for the NAT Gateway.

Verify these CIDRs against the deployed Terraform configuration before
making infrastructure changes.

## Traffic Flow

### Public Subnets

Internet traffic reaches public subnets through the Internet Gateway
and the associated public route table.

### Private Subnets

Private resources use the private route table and NAT Gateway for
outbound internet access. They do not automatically receive public
IPv4 addresses.

## Amazon EKS

The EKS cluster runs the Hospital Management application in the
`hospital-management` namespace. The cluster endpoint has public and
private access configured. Public endpoint access is restricted by
the configured client CIDR; keep this restriction in place.

Kubernetes NetworkPolicies restrict application traffic between the
frontend, backend, and database. Verify actual connectivity after
policy changes.

## Monitoring

Prometheus and Grafana run in the `monitoring` namespace. Grafana
dashboards are maintained under `monitoring/grafana/dashboards`.

## Cost and Availability

The development environment uses a NAT Gateway, which incurs ongoing
charges. Review NAT Gateway, EKS, EC2, EBS, and public IPv4 costs
before leaving the environment running.

Do not delete the database persistent volume or Terraform state as
part of routine cleanup. Verify dependencies and preserve any required
project evidence before destroying infrastructure.
