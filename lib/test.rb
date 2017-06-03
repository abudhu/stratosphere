require 'stratosphere'

#TODO Feature Validate the stuff conforms with AWS Spec. So no Spaces etc in
# fields.

stratosphere = Stratosphere::Aws.new

stratosphere.add_parameter do
  name "AmiID", :prepend, "param"
  type "String"
  default "ami-09211986"
  allowed_values "hi", "boo"
  allowed_pattern "poop"
  description "Bad Desc"
  password  false
end

stratosphere.add_parameter do
  name "InstanceType", :prepend, "param"
  type "String"
  default "m4.large"
end

stratosphere.add_parameter do
  name "VPCCidr", :prepend, "param"
  type "String"
  default "10.10.0.0/16"
end

stratosphere.add_parameter do
  name "PublicSubnet", :prepend, "param"
  type "String"
  default "yes"
  allowed_values "yes", "no"
end

stratosphere.add_parameter_group do
  group "What are we deploying?" do
    parameter "paramEnviornment"
  end
  group "Networking" do
    parameter "VPCCidr"
  end
  group "Bastion Configuration" do
    parameter "InstanceType"
    parameter "AmiID"
  end
end

stratosphere.add_parameter_labels do
  label "VpcCidr", :rename, "VPC Cidr"
  label "InstanceType", :rename, "Bastion Instance Size"
  label "AmiID", :rename, "Bastion AMI"
end


stratosphere.add_mappings do
  mapping "mapEnviornmentValues" do
    parent "Development" do #, :prefix, "map"
      child "VPC", "vpc-id091986"
      child "privatesubnet", "subnet-092130"
    end
  end
  mapping "mapSubnet" do
    parent "public-a" do
      child "octet", "10.0/24"
    end
    parent 'public-b' do
      child "octet", "30.0/24"
    end
  end
end

stratosphere.add_resources do
  resource "vpc" do
    #properties do
    #  cidrBlock :ref "Something" or :join "something" "something"
    #end
  end
end

stratosphere.display_template
#stratosphere.to_yaml
