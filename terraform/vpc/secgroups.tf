resource "openstack_networking_secgroup_v2" "my-secgroup" {
  name        = "my-secgroup-${var.petname}"
  description = "Security Group"
}

resource "openstack_networking_secgroup_rule_v2" "terraform-ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "terraform-http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "terraform-https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my-secgroup.id
}
