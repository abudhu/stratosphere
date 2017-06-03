require '/Users/amitbudhu/Dropbox/github/stratosphere/lib/stratosphere/test_vpc.rb'
module Amit
  class Aws
    def initialize()
      @resources = "Resources:\n"
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

    def add_resources(&block)
      instance_eval &block
    end

    def resource(name, alteration=nil, append="", &block)
      if @lookup_table.key?(name)
        case alteration
        when :prefix
          adjusted_name = "#{append}#{name}"
        when :suffix
          adjusted_name = "#{name}#{append}"
        else
          adjusted_name = name
        end
        @resources << " #{adjusted_name}:\n"
        @resources << " Type: #{@lookup_table[name]}\n"
        obj = Amit.const_get(name.capitalize).new(&block)
        @resources << obj.instance_variable_get("@resource")
        puts @resources
      else
        raise "No Method by that name"
      end
    end
  end
end


stratosphere = Amit::Aws.new

stratosphere.add_resources do
  resource "vpc", :suffix, "Resource" do
    cidr_block "10.10.0.0/16"
    #type "String"
    #default "ami-09211986"
    #allowed_values "hi", "boo"
    #allowed_pattern "poop"
    #description "Bad Desc"
    #password  false
  end
end
