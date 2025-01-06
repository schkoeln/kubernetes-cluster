# **Kubernetes Cluster on Hetzner Cloud**

*This README was generated with the assistance of GPT-4o.*

## **Introduction**

This project demonstrates the automated deployment of a Kubernetes cluster on Hetzner Cloud, focusing on modern Infrastructure as Code (IaC) practices. The primary goal is to showcase my proficiency with Kubernetes, Helm, and Terraform, while building a portfolio to support my job applications in cloud and DevOps roles.

Hetzner Cloud was chosen as the infrastructure provider due to its cost-effectiveness and reliability. As a German-based provider, Hetzner aligns well with my preferences and offers excellent performance at an affordable price.

The project aims to simplify the process of deploying Kubernetes clusters by automating infrastructure provisioning and service deployments. The initial cluster setup includes a single control plane node and multiple worker nodes, with a target to deploy essential services for monitoring, logging, and distributed tracing. Planned services include Prometheus for monitoring, Grafana for visualization, Loki for logging, and Tempo for tracing. Future expansions may include specialized workloads such as a WordPress deployment and potentially a game server.

This deployment is intended for personal use only, with no immediate plans for automated scaling, fault tolerance, or backups.

---

## **Project Structure**

```bash
.
├── control-plane        # Contains Terraform configurations for setting up the control plane node
├── helm-deployments     # Terraform configurations for deploying Helm charts
├── hetzner-network      # Contains Terraform configurations for setting up the Hetzner network
├── main.tf              # Main entry point for the Terraform configuration
├── scripts              # Shell scripts for Kubernetes setup and management
├── ssh                  # SSH keys for accessing nodes (Ignored by .gitignore)
├── terraform.tfstate            # Terraform state file (Ignored by .gitignore)
├── terraform.tfstate.backup     # Backup of the Terraform state file (Ignored by .gitignore)
├── terraform.tfvars             # Terraform variable definitions file (Ignored by .gitignore)
├── variables.tf                 # Input variables for overall infrastructure
└── worker-nodes         # Contains Terraform configurations for setting up worker nodes
```

Each section is modularized to ensure maintainability and clarity. The main Terraform configuration (`main.tf`) acts as the central entry point, while the `control-plane`, `worker-nodes`, and `hetzner-network` directories house specific configurations for different parts of the cluster. The `helm-deployments` directory is used to deploy Kubernetes services using Helm charts, with custom values for Prometheus, Grafana, Loki, and Tempo.

---

## **Setting Up the Network**

The network setup on Hetzner Cloud is handled using Terraform. This step creates a private network that allows secure communication between the control plane and worker nodes.

The Terraform configurations for the network are located in the `hetzner-network/` directory. To set up the network, run the following commands in the project root:

```bash
terraform init
terraform apply
```

Ensure you have a valid Hetzner Cloud API token configured in your `terraform.tfvars` file before applying the configuration.

---

## **Control Plane Setup**

The control plane is the core component of the Kubernetes cluster, responsible for managing the overall cluster state. This step provisions a dedicated control plane node using Terraform.

The Terraform configurations for setting up the control plane are located in the `control-plane/` directory. To deploy the control plane, follow these steps:

1. **Ensure the network is set up**  
2. **Run Terraform commands**  
   ```bash
   terraform init
   terraform apply
   ```

---

## **Worker Nodes Setup**

Worker nodes are responsible for running application workloads in the Kubernetes cluster. This step provisions multiple worker nodes using Terraform and connects them to the control plane.

The Terraform configurations for the worker nodes are located in the `worker-nodes/` directory. To deploy the worker nodes, follow these steps:

1. **Ensure the control plane is up and running**  
2. **Run Terraform commands**  
   ```bash
   terraform init
   terraform apply
   ```

---

## **Helm Deployments**

Once the control plane and worker nodes are up and running, various services can be deployed using Helm charts. This project uses Helm to deploy essential monitoring, logging, and tracing services, including Prometheus, Grafana, Loki, and Tempo.

### **Steps to Deploy Helm Charts**

1. **Ensure the Kubernetes cluster is ready**  
2. **Run Terraform commands**  
   ```bash
   terraform init
   terraform apply
   ```

3. **Verify the deployments**  
   ```bash
   kubectl get pods -n monitoring
   ```

---

## **Using Scripts**

This project includes two key shell scripts located in the `scripts/` directory:

- **`install_kubernetes.sh`**  
  Installs Kubernetes components (kubeadm, kubelet, and kubectl) on the nodes.

- **`join_kubernetes_cluster.sh`**  
  Joins the worker nodes to the Kubernetes cluster by executing the `kubeadm join` command.

These scripts are automatically used by Terraform during the infrastructure provisioning process.

---

## **SSH Configuration**

The `ssh/` directory contains the RSA key pair used for secure access to the control plane and worker nodes. These keys are automatically referenced by the Terraform configurations to ensure seamless connectivity during the setup process.

### **Files in `ssh/`**

- **`id_rsa` / `id_rsa.pub`** (Ignored by `.gitignore`)  
  RSA key pair used for accessing the nodes.

### **Note**  
Since the `ssh/` directory contains sensitive keys, it is excluded from version control using `.gitignore`. Handle the private key (`id_rsa`) securely, as it is critical for managing your infrastructure.

---

## **Terraform Setup and Usage**

The project uses Terraform to provision and manage the Kubernetes cluster on Hetzner Cloud. The main Terraform configuration files are located in the project root and within the respective module directories (`hetzner-network`, `control-plane`, `worker-nodes`, and `helm-deployments`).

### **Ignored Files**

- **`terraform.tfstate`** and **`terraform.tfstate.backup`** (Ignored by `.gitignore`)  
- **`terraform.tfvars`** (Ignored by `.gitignore`)  

### **Basic Commands**

1. **Initialize the Terraform working directory**  
   ```bash
   terraform init
   ```

2. **Apply the Terraform configuration**  
   ```bash
   terraform apply
   ```

3. **Destroy the infrastructure** (optional)  
   ```bash
   terraform destroy
   ```

---

This concludes the initial setup guide for the Kubernetes cluster. For further details on the implementation, refer to the inline comments in the code or consider creating a wiki for extended documentation.
