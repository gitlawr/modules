# @group "General"
variable "object_prefix" {
  type        = string
  description = "Unique name to prefix all objects with"
}

# @group "General"
variable "namespace" {
  type        = string
  description = "Kubernetes namespace for deployment"
}

# @group "General"
variable "image_name" {
  type        = string
  description = "Docker image to use"
  validation {
    condition     = length(regexall(" ", var.image_name)) == 0
    error_message = "The image_name must not contain spaces."
  }
}

# @group "General"
variable "image_tag" {
  type        = string
  description = "Docker image tag to use"
}

# @group "Advanced"
variable "timeout_create" {
  type        = string
  description = "Timeout for creating the deployment"
  default     = "3m"
}

# @group "Advanced"
variable "timeout_update" {
  type        = string
  description = "Timeout for creating the deployment"
  default     = "2m"
}

# @group "Advanced"
variable "timeout_delete" {
  type        = string
  description = "Timeout for creating the deployment"
  default     = "10m"
}

# @group "Labels/Annotations"
variable "labels" {
  type        = map(string)
  description = "Labels to add"
  default     = {}
}

# @group "Advanced"
variable "service_account_name" {
  type        = string
  description = "Service account name to add to the pod"
  default     = ""
}

# @group "Advanced"
variable "service_links" {
  type        = bool
  description = "Enables generating environment variables for service discovery."
  default     = false
}

# @group "Advanced"
variable "subdomain" {
  type        = string
  description = "Subdomain for the pod"
  default     = ""
}

# @group "General"
variable "ports" {
  type        = any
  description = "Ports to expose from container"
  default     = []
}

# @group "General"
variable "replicas" {
  type        = number
  description = "Amount of pods to create"
  default     = 1
}

# @group "General"
# @options ["Always","IfNotPresent","Never"]
variable "pull_policy" {
  type        = string
  description = "Pull policy for the image"
  default     = "IfNotPresent"
}

# @group "Labels/Annotations"
variable "annotations" {
  type        = map(string)
  description = "Annotations to add to the deployment"
  default     = {}
}

# @group "Labels/Annotations"
variable "template_annotations" {
  type        = map(string)
  description = "Annotations to add to the template"
  default     = {}
}

# @group "Health Check"
variable "min_ready_seconds" {
  type        = number
  description = "Minimum number of seconds for which a newly created pod should be ready without any of its container crashing"
  default     = 1
}

# @group "Health Check"
variable "max_ready_seconds" {
  type        = number
  description = "The maximum time in seconds for a deployment to make progress before it is considered to be failed"
  default     = 600
}

# @group "Advanced"
variable "revision_history" {
  type        = number
  description = "The number of old ReplicaSets to retain"
  default     = 4
}

# @group "Advanced"
variable "update_strategy" {
  type        = string
  description = "The number of old ReplicaSets to retain"
  default     = "RollingUpdate"
}

# @group "Advanced"
variable "update_max_surge" {
  type        = string
  description = "Maximum number of pods that can be scheduled above desired"
  default     = "25%"
}

# @group "Advanced"
variable "update_max_unavailable" {
  type        = string
  description = "Maximum number of pods that can be unavailable during the update"
  default     = "25%"
}

# @group "General"
variable "command" {
  type        = list(string)
  description = "Entrypoint array. Not executed within a shell"
  default     = []
}

# @group "General"
variable "arguments" {
  type        = list(string)
  description = "Arguments to the entrypoint"
  default     = []
}
# @group "Storage"
variable "volumes" {
  type        = any
  description = "Volume configuration"
  default     = []
}

# @group "Security Context"
variable "security_context_enabled" {
  type        = bool
  description = "Enable the security context"
  default     = true
}

# @group "Security Context"
variable "security_context_uid" {
  type        = number
  description = "Group to run pod as"
  default     = 1000
}

# @group "Security Context"
variable "security_context_gid" {
  type        = number
  description = "User to run pod as"
  default     = 1000
}

# @group "Security Context"
variable "security_context_fsgroup" {
  type        = number
  description = "fsGroup to run pod as"
  default     = 1000
}

# @group "Security Context"
variable "security_context_container_enabled" {
  type        = bool
  description = "Enable the security context at container level"
  default     = false
}

# @group "Security Context"
variable "security_context_container_capabilities_add" {
  description = "Added capabilities"
  default     = null
}

# @group "Security Context"
variable "security_context_container_capabilities_drop" {
  description = "Removed capabilities"
  default     = null
}

# @group "Advanced"
variable "custom_certificate_authority" {
  type        = list(string)
  description = "Certificate authorities to add to image"
  default     = []
}

# @group "Resources"
variable "resources_requests_cpu" {
  type        = string
  description = "The maximum amount of compute resources allowed"
  default     = ""
}

# @group "Resources"
variable "resources_requests_memory" {
  type        = string
  description = "The minimum amount of compute resources required"
  default     = ""
}

# @group "Resources"
variable "resources_limits_cpu" {
  type        = string
  description = "The maximum amount of compute resources allowed"
  default     = ""
}

# @group "Resources"
variable "resources_limits_memory" {
  type        = string
  description = "The minimum amount of compute resources required"
  default     = ""
}

variable "env" {
  type        = map(string)
  description = "Environment variables"
  default     = {}
}

variable "env_secret" {
  type = list(object({
    name   = string
    secret = string
    key    = string
  }))
  description = "Environment variables to pull from secrets"
  default     = []
}

# @group "Advanced"
variable "post_start_type" {
  type        = string
  description = "Post_start is called immediately after a container is created"
  default     = ""
}

# @group "Advanced"
variable "post_start_command" {
  type        = list(string)
  description = "Post_start command to execute"
  default     = []
}

# @group "Advanced"
variable "post_start_host" {
  type        = string
  description = "Host that the http_get will test"
  default     = ""
}

# @group "Advanced"
variable "post_start_port" {
  type        = number
  description = "Port that the post_start will test"
  default     = 0
}

# @group "Advanced"
variable "post_start_scheme" {
  type        = string
  description = "Scheme of the http_get request"
  default     = "HTTP"
}

# @group "Advanced"
variable "post_start_path" {
  type        = string
  description = "Path for the http_get request"
  default     = "/"
}

# @group "Advanced"
variable "post_start_http_header" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "HTTP headers for the http_get request"
  default     = []
}

# @group "Health Check"
variable "readiness_probe_enabled" {
  type        = bool
  description = "Enable the readyness probe"
  default     = true
}

# @group "Health Check"
variable "readiness_probe_initial_delay" {
  type        = number
  description = "Initial delay of the probe in seconds"
  default     = 30
}

# @group "Health Check"
variable "readiness_probe_period" {
  type        = number
  description = "Period of the probe in seconds"
  default     = 10
}

# @group "Health Check"
variable "readiness_probe_timeout" {
  type        = number
  description = "Timeout of the probe in seconds"
  default     = 1
}

# @group "Health Check"
variable "readiness_probe_success" {
  type        = number
  description = "Minimum consecutive successes for the probe"
  default     = 1
}

# @group "Health Check"
variable "readiness_probe_failure" {
  type        = number
  description = "Minimum consecutive failures for the probe"
  default     = 2
}

# @group "Health Check"
variable "readiness_probe_type" {
  type        = string
  description = "Type of probe to deploy"
  default     = "tcp_socket"
}

# @group "Health Check"
variable "readiness_probe_command" {
  type        = list(string)
  description = "Command for the probe to use"
  default     = []
}

# @group "Health Check"
variable "readiness_probe_host" {
  type        = string
  description = "Host that the probe will test"
  default     = ""
}

# @group "Health Check"
variable "readiness_probe_port" {
  type        = number
  description = "Port that the probe will test"
  default     = 0
}

# @group "Health Check"
variable "readiness_probe_scheme" {
  type        = string
  description = "Scheme of the probe http_get probe"
  default     = "HTTP"
}

# @group "Health Check"
variable "readiness_probe_path" {
  type        = string
  description = "Path for the http_get probe"
  default     = "/"
}

# @group "Health Check"
variable "readiness_probe_http_header" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "HTTP headers for the http_get probe"
  default     = []
}

# @group "Health Check"
variable "liveness_probe_enabled" {
  description = "Enable the readyness probe"
  default     = true
}

# @group "Health Check"
variable "liveness_probe_initial_delay" {
  type        = number
  description = "Initial delay of the probe in seconds"
  default     = 30
}

# @group "Health Check"
variable "liveness_probe_period" {
  type        = number
  description = "Period of the probe in seconds"
  default     = 10
}

# @group "Health Check"
variable "liveness_probe_timeout" {
  type        = number
  description = "Timeout of the probe in seconds"
  default     = 1
}

# @group "Health Check"
variable "liveness_probe_success" {
  type        = number
  description = "Minimum consecutive successes for the probe"
  default     = 1
}

# @group "Health Check"
variable "liveness_probe_failure" {
  type        = number
  description = "Minimum consecutive failures for the probe"
  default     = 3
}

# @group "Health Check"
variable "liveness_probe_type" {
  type        = string
  description = "Type of probe to deploy"
  default     = "tcp_socket"
}

# @group "Health Check"
variable "liveness_probe_command" {
  type        = list(string)
  description = "Command for the probe to use"
  default     = []
}

# @group "Health Check"
variable "liveness_probe_host" {
  type        = string
  description = "Host that the probe will test"
  default     = ""
}

# @group "Health Check"
variable "liveness_probe_port" {
  type        = number
  description = "Port that the probe will test"
  default     = 0
}

# @group "Health Check"
variable "liveness_probe_scheme" {
  type        = string
  description = "Scheme of the probe http_get probe"
  default     = "HTTP"
}

# @group "Health Check"
variable "liveness_probe_path" {
  type        = string
  description = "Path for the http_get probe"
  default     = "/"
}

# @group "Health Check"
variable "liveness_probe_http_header" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "HTTP headers for the http_get probe"
  default     = []
}

# @group "Health Check"
variable "startup_probe_enabled" {
  description = "Enable the readiness probe"
  default     = true
}

# @group "Health Check"
variable "startup_probe_initial_delay" {
  type        = number
  description = "Initial delay of the probe in seconds"
  default     = 10
}

# @group "Health Check"
variable "startup_probe_period" {
  type        = number
  description = "Period of the probe in seconds"
  default     = 1
}

# @group "Health Check"
variable "startup_probe_timeout" {
  type        = number
  description = "Timeout of the probe in seconds"
  default     = 1
}

# @group "Health Check"
variable "startup_probe_success" {
  type        = number
  description = "Minimum consecutive successes for the probe"
  default     = 1
}

# @group "Health Check"
variable "startup_probe_failure" {
  type        = number
  description = "Minimum consecutive failures for the probe"
  default     = 90
}

# @group "Health Check"
variable "startup_probe_type" {
  type        = string
  description = "Type of probe to deploy"
  default     = "tcp_socket"
}

# @group "Health Check"
variable "startup_probe_command" {
  type        = list(string)
  description = "Command for the probe to use"
  default     = []
}

# @group "Health Check"
variable "startup_probe_host" {
  type        = string
  description = "Host that the probe will test"
  default     = ""
}

# @group "Health Check"
variable "startup_probe_port" {
  type        = number
  description = "Port that the probe will test"
  default     = 0
}

# @group "Health Check"
variable "startup_probe_scheme" {
  type        = string
  description = "Scheme of the probe http_get probe"
  default     = "HTTP"
}

# @group "Health Check"
variable "startup_probe_path" {
  type        = string
  description = "Path for the http_get probe"
  default     = "/"
}

# @group "Health Check"
variable "startup_probe_http_header" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "HTTP headers for the http_get probe"
  default     = []
}

# @group "Service"
variable "service_session_affinity" {
  type        = string
  description = "Used to maintain session affinity"
  default     = "None"
}

# @group "Service"
variable "service_type" {
  type        = string
  description = "Service type"
  default     = "ClusterIP"
}

# @group "Service"
# @show_if "service_type=LoadBalancer"
variable "service_loadbalancer_ip" {
  type        = string
  description = "Default ip address for the loadbalancer"
  default     = ""
}

# @group "Service"
variable "service_annotations" {
  type        = map(string)
  description = "Annotations to add to the service"
  default     = {}
}

# @group "Service"
variable "service_traffic_policy" {
  type        = string
  description = "Service external traffic policy"
  default     = "Local"
}

# @group "Advanced"
variable "init_volume_permissions_enabled" {
  description = "Container to set volume permissions on pod startup"
  default     = true
}

# @group "Advanced"
variable "init_volume_permissions_extraargs" {
  type        = list(string)
  description = "Extra commands to run on the volume init container"
  default     = []
}

# @group "Advanced"
variable "init_volume_permissions_image_name" {
  type        = string
  description = "Image to use for the init container"
  default     = "alpine"
}

# @group "Advanced"
variable "init_volume_permissions_image_tag" {
  type        = string
  description = "Tag to use for the init container"
  default     = "3.12.3"
}

# @group "Advanced"
variable "init_volume_permissions_image_pull_policy" {
  type        = string
  description = "Pull policy to use for the init container"
  default     = "IfNotPresent"
}

# @group "Advanced"
variable "init_customca_image_name" {
  type        = string
  description = "Tag to use for the init container"
  default     = "alpine"
}

# @group "Advanced"
variable "init_customca_image_tag" {
  type        = string
  description = "Tag to use for the init container"
  default     = "3.12.3"
}

# @group "Advanced"
variable "init_customca_image_pull_policy" {
  type        = string
  description = "Pull policy to use for the init container"
  default     = "IfNotPresent"
}

# @group "Advanced"
variable "init_customca_env_secret" {
  type = list(object({
    name   = string
    secret = string
    key    = string
  }))
  description = "Env secrets to use for the init container"
  default     = []
}

# @group "Advanced"
variable "connectivity_check" {
  type = list(object({
    name     = string
    hostname = string
    port     = string
    timeout  = number
  }))
  description = "Env secrets to use for the init container"
  default     = []
}

# @group "Advanced"
variable "init_connectivity_image_name" {
  type        = string
  description = "Tag to use for the init container"
  default     = "bash"
}

# @group "Advanced"
variable "init_connectivity_image_tag" {
  type        = string
  description = "Tag to use for the init container"
  default     = "4.4"
}

# @group "Advanced"
variable "init_connectivity_image_pull_policy" {
  type        = string
  description = "Pull policy to use for the init container"
  default     = "IfNotPresent"
}

# @group "Advanced"
variable "init_user_image_name" {
  type        = string
  description = "Init container image name"
  default     = ""
}

# @group "Advanced"
variable "init_user_image_tag" {
  type        = string
  description = "Init container image tag"
  default     = ""
}

# @group "Advanced"
variable "init_user_security_context_uid" {
  type        = number
  description = "UID to run custom init continer as"
  default     = 1000
}

# @group "Advanced"
variable "init_user_security_context_gid" {
  type        = number
  description = "GID to run custom init continer as"
  default     = 1000
}

# @group "Advanced"
variable "init_user_command" {
  # type        = list(string)
  description = "Command to run within init container"
  default     = []
}

# @group "Advanced"
variable "init_user_image_pull_policy" {
  type        = string
  description = "Pull policy to use for the init container"
  default     = "IfNotPresent"
}

# @group "Advanced"
variable "init_user_env" {
  type        = map(string)
  description = "Environment variables for init container"
  default     = {}
}

# @group "Advanced"
variable "init_user_env_secret" {
  type = list(object({
    name   = string
    secret = string
    key    = string
  }))
  description = "Env secrets to use for the init container"
  default     = []
}

# @group "Advanced"
variable "network_policy_ingress" {
  type        = list(any)
  description = "Ingress policy to apply to deployment"
  default     = []
}

# @group "Advanced"
variable "network_policy_egress" {
  type        = list(any)
  description = "Egress policy to apply to deployment"
  default     = []
}

# @group "Advanced"
variable "network_policy_type" {
  type        = list(string)
  description = "Direction of network policy"
  default     = ["Ingress", "Egress"]
}
