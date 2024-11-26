output "prometheus_release_name" {
  value       = helm_release.prometheus.name
  description = "Name of the Prometheus Helm release"
}

output "grafana_release_name" {
  value       = helm_release.grafana.name
  description = "Name of the Grafana Helm release"
}

output "loki_release_name" {
  value       = helm_release.loki.name
  description = "Name of the Loki Helm release"
}

output "tempo_release_name" {
  value       = helm_release.tempo.name
  description = "Name of the Tempo Helm release"
}

output "namespace" {
  value       = var.namespace
  description = "Namespace where the Helm charts are deployed"
}