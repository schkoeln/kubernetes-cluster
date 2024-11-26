provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "prometheus-community/prometheus"
  namespace  = var.namespace_monitoring
  values     = [file("${path.module}/values/prometheus-values.yaml")]

  depends_on = [null_resource.kubernetes_ready]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana/grafana"
  namespace  = var.namespace_monitoring
  values     = [file("${path.module}/values/grafana-values.yaml")]

  depends_on = [null_resource.kubernetes_ready]
}

resource "helm_release" "loki" {
  name       = "loki"
  chart      = "grafana/loki"
  namespace  = var.namespace_monitoring
  values     = [file("${path.module}/values/loki-values.yaml")]

  depends_on = [null_resource.kubernetes_ready]
}

resource "helm_release" "tempo" {
  name       = "tempo"
  chart      = "grafana/tempo"
  namespace  = var.namespace_monitoring
  values     = [file("${path.module}/values/tempo-values.yaml")]

  depends_on = [null_resource.kubernetes_ready]
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace_monitoring
  }
}

resource "null_resource" "kubernetes_ready" {
  provisioner "local-exec" {
    command = "kubectl wait --for=condition=Ready nodes --all --timeout=120s"
  }
}