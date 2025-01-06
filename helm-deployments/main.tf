resource "helm_release" "prometheus" {
  name      = "prometheus"
  chart     = "prometheus-community/prometheus"
  namespace = var.namespace_monitoring
  values    = [file("${path.module}/values/prometheus-values.yaml")]
}

resource "helm_release" "grafana" {
  name      = "grafana"
  chart     = "grafana/grafana"
  namespace = var.namespace_monitoring
  values    = [file("${path.module}/values/grafana-values.yaml")]
}

resource "helm_release" "loki" {
  name      = "loki"
  chart     = "grafana/loki"
  namespace = var.namespace_monitoring
  values    = [file("${path.module}/values/loki-values.yaml")]
}

resource "helm_release" "tempo" {
  name      = "tempo"
  chart     = "grafana/tempo"
  namespace = var.namespace_monitoring
  values    = [file("${path.module}/values/tempo-values.yaml")]
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace_monitoring
  }
}
