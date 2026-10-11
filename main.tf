resource "google_secure_source_manager_instance_iam_binding" "secure_source_manager_instance_iam_bindings" {
  for_each = var.secure_source_manager_instance_iam_bindings

  instance_id = each.value.instance_id
  members     = each.value.members
  role        = each.value.role
  location    = each.value.location
  project     = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

