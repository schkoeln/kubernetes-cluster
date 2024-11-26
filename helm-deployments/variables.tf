variable "kubeconfig_path" {
  description = "Path to the kubeconfig file for connecting to the Kubernetes cluster"
  type        = string
  default     = "~/.kube/config"
}

variable "namespace_monitoring" {
  description = "Namespace to deploy the Helm charts"
  type        = string
  default     = "monitoring"
  validation {
    condition     = length(var.namespace_monitoring) > 0
    error_message = "Namespace must be a non-empty string"
  }
}