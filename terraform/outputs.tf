output "external_ip_address_app" {
  description = "External addresses of virtual machines \"Reddit\""
  value = toset([
    for app in yandex_compute_instance.app : app.network_interface.0.nat_ip_address
  ])
}

output "external_ip_address_lb" {
  description = "External addresses of lb"
  value = toset([
    for listener in yandex_lb_network_load_balancer.reddit_lb_network_load_balancer.listener : listener.external_address_spec.*.address
  ])
}