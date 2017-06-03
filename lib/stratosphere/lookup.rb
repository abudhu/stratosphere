module Stratosphere
  class Lookup
    def initialize
      @lookup_table = {
        "dhcp_options" => "AWS::EC2::DHCPOptions",
        "eip" => "AWS::EC2::EIP",
        "flow_log" => "AWS::EC2::FlowLog",
        "host" => "AWS::EC2::Host",
        "instance" => "AWS::EC2::Instance",
        "nat_gateway" => "AWS::EC2::NatGateway",
        "network_acl" => "AWS::EC2::NetworkAcl",
        "network_interface" => "AWS::EC2::NetworkInterface",
        "placement_group" => "AWS::EC2::PlacementGroup",
        "route_table" => "AWS::EC2::RouteTable",
        "security_group" => "AWS::EC2::SecurityGroup",
        "spot_fleet" => "AWS::EC2::SpotFleet",
        "subnet" => "AWS::EC2::Subnet",
        "volume" => "AWS::EC2::Volume",
        "vpc" => "AWS::EC2::VPC",
        "vpn" => "AWS::EC2::VPNConnection"
      }
    end

    def find(aws_reference)
      return @lookup_table[aws_reference]
    end
  end
end

#EIP can have an EIPAssociation
#Network ACL can have NetworkAclEntry
#NetworkInterface can have an NetworkInterfaceAttachment
#RouteTable can have Route
#SecurityGroup can have SecurityGroupEngress and SecurityGroupIngress
#Subnet can have SubnetNetworkAclAssociation and SubnetRouteTableAssociation
#Volume can have a AWS::EC2::VolumeAttachment
#VPC can have AWS::EC2::VPCDHCPOptionsAssociation, AWS::EC2::VPCEndpoint,
# AWS::EC2::VPCGatewayAttachment, AWS::EC2::InternetGatway,
# AWS::EC2::VPCPeeringConnection
#VPN Connection can have a CustomerGateway, VPNConnectionRoute, VPNGateway,
# VPNGatewayRoutePropagation
