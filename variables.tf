variable "secure_source_manager_instance_iam_bindings" {
  description = <<EOT
Map of secure_source_manager_instance_iam_bindings, attributes below
Required:
    - instance_id
    - members
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    instance_id = string
    members     = set(string)
    role        = string
    location    = optional(string)
    project     = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

