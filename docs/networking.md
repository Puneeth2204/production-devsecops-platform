# AWS Networking Design

## Overview

The platform uses a custom AWS VPC with public and private subnets across two Availability Zones in the `us-east-1` region.

## Network Configuration

- VPC CIDR: `10.0.0.0/16`
- Public subnets: `10.0.1.0/24`, `10.0.2.0/24`
- Private subnets: `10.0.11.0/24`, `10.0.12.0/24`
- Internet Gateway: Provides internet routing for public subnets.
- NAT Gateway: Allows resources in private subnets to initiate outbound internet connections.
- Elastic IP: Provides a static public IPv4 address for the NAT Gateway.

## Traffic Flow

### Public Subnets

Internet → Internet Gateway → Public Route Table → Public Subnet

The public route table directs `0.0.0.0/0` to the Internet Gateway.

### Private Subnets

Private Resource → Private Route Table → NAT Gateway → Internet Gateway → Internet

Private subnet resources do not receive public IPv4 addresses automatically.

## Routing Associations

Each public subnet is associated with the public route table. Each private subnet is associated with the private route table.

## Kubernetes Integration

Public subnet tags identify locations for internet-facing load balancers. Private subnet tags identify locations for internal load balancers. The EKS and load-balancer configurations will be added in later project stages.

## Cost and Availability Considerations

The development architecture uses one NAT Gateway shared by both private subnets to limit infrastructure complexity and cost. This introduces a single point of failure and may incur cross-Availability-Zone data-transfer charges.

NAT Gateway and Elastic IP charges must be considered before provisioning. Resources should be destroyed when no longer needed, after verifying that no other workloads depend on them.