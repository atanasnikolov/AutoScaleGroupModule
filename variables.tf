variable "ascname" {
  description = "The name of the auto scaling group"
  type  = string
}

variable "aws_ami" {
  description = "The ami of the image we are going to use for the auto scaling group"
  type  = string
}

variable "instance_type" {
  description = "The type of the instances that the auto scale group will be deploying"
  type = string
}

variable "auto_scale_instance_name" {
  description = "The name of the instances that will be deployed by the auto scaling group"
  type = string
}

variable "auto_scale_policy_name" {
  description = "The name of the auto scaling policy"
  type = string
}

variable "adjust_scale" {
  description = "How will the auto scale group adjust (ChangeInCapacity, ExactCapacity, PercentChangeInCapacity)"
  type = string
}

variable "cloudwatch_alarm_name" {
  description = "The name of the cloud watch alarm"
  type = string
}

variable "cloudwatch_comparison_operator" {
  description = "Cloudwatch comparison operator GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, GreaterThanUpperThreshold"
  type = string
}

variable "cloudwatch_metric_name" {
  description = "What will be the metric we will be mesuring, https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html"
  type = string
}

variable "namespace" {
  description = "The service that we will be monitored, https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html"
}

variable "statistic" {
  description = "The statistic that will be checked SampleCount, Average, Sum, Minimum, Maximum"
  type = string
}

variable "alarm_description" {
    description = "The descrtion for what the alarm will be used"
    type = string
}

variable "policy_ssm" {
    description = "The ARN of the SSM policy so that we can have access to the isntances"
    type = string
}

variable "policy_cwa" {
    description = "Cloudwatch policy ARN to access the instances (preffered read only access)"
    type = string
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type = string
}

variable "load_balancer_targets_group_name" {
  description = "The name of the load balancer targer group"
}

variable "load_balancer_listener_name" {
  description = "THe name of the load balancer listener"
  type = string
}

variable "vpc_name" {
  description = "Name of VPC"
  type = string
}

variable "cidr_block" {
  description = "The VPC cidr range with /mask"
  type = string
}

variable "var.subnet_1_cidr_block" {
  description = "The cidr range for subnet 1 with /mask"
  type = string
}

variable "subnet_1_name" {
  description = "name of subnet 1"
  type = string
}

variable "var.subnet_2_cidr_block" {
  description = "The cidr range for subnet 2 with /mask"
  type = string
}

variable "subnet_2_name" {
  description = "name of subnet 2"
  type = string
}

variable "var.subnet_3_cidr_block" {
  description = "The cidr range for subnet 3 with /mask"
  type = string
}

variable "subnet_3_name" {
  description = "name of subnet 3"
  type = string
}

variable "var.subnet_4_cidr_block" {
  description = "The cidr range for subnet 4 with /mask"
  type = string
}

variable "subnet_4_name" {
  description = "name of subnet 4"
  type = string
}

variable "internet_gateway_name" {
  description = "Name of VPC gateway"
  type = string
}

variable "elip_for_nat1" {
  description = "Name of elastic IP 1"
  type = string
}

variable "elip_for_nat2" {
  description = "Name of elastic IP 2"
  type = string
}

variable "nat_to_public_subnet1" {
  description = "The name of the NAT that is pointing to the first public subnet"
  type = string
}

variable "nat_to_public_subnet2" {
  description = "The name of the NAT that is pointing to the second public subnet"
  type = string
}

variable "route_table_to_gateway_nam" {
  description = "Name of route table that is pointing to the gateway"
  type = string
}

variable "route_from_private_subnet_to_nat1" {
  description = "Name of the routing table that is pointing the private subnet1 to nat1"
  type = string
}

variable "route_from_private_subnet_to_nat2" {
  description = "Name of the routing table that is pointing the private subnet2 to nat2"
  type = string
}

variable "allow_http_traffic_security_group_name" {
  description = "The name of the security group that allows traffic from the outsicde"
  type = string
}

variable "allowed_ip_address" {
    description = "The IP address with /32 that we allow to access our machines"
    type = string
}

variable "allow_filtered_traffic_security_group_name" {
    description = "Name of the security group that accepts traffic from the initial security group"
    type = string
}