#################
# Region 
###################
data "aws_region" "current" {}

########################
# Availability Zones 
#######################
data "aws_availability_zones" "available" {}
