provider "aws" {
  region = "ap-south-1"
}

data "aws_vpc" "default_vpc1" {
  default = true
}

data "aws_subnet_ids" "default_subnet_ids"{
  vpc_id = data.aws_vpc.default_vpc1.id
}

output "vpc_info" {
  value = data.aws_subnet_ids.default_subnet_ids.ids
}


variable "region_list" {
  type = list(string)
  default = ["asia", "europe", "usa"]
}

variable "region_instance_type" {
  type = map(string)
  default = {
    "asia": "ami-asia"
    "europe": "ami-europe"
    "usa": "ami-usa"
  }
}

variable "person" {
  type = object({
    name=string,
    age=number,
    phone=map(number)
  })

  default = {
    name="Pintu",
    age=22,
    phone={
      home=03345,
      mobile=99234
    }
  }
}

output "person_phone" {
  value = var.person.phone.mobile
}

output "instance" {
  value = lookup(var.region_instance_type, var.region_list[0])

}
