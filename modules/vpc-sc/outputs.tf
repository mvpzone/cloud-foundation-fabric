/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "org_id" {
  description = "Organization id dependent on module resources."
  value       = var.org_id
  # FIXME(jccb): these deps don't exist (??)
  # depends_on = [
  #   google_organization_iam_audit_config,
  #   google_organization_iam_binding.authoritative,
  #   google_organization_iam_custom_role.roles,
  #   google_organization_iam_member.additive,
  #   google_organization_policy.boolean,
  #   google_organization_policy.list
  # ]
}

output "access_policy_name" {
  description = "Access Policy resource"
  value       = local.access_policy_name
}

output "access_levels" {
  description = "Access Levels."
  value = {
    for key, value in google_access_context_manager_access_level.default :
    key => value
  }
}

output "perimeters_standard" {
  description = "VPC-SC standard perimeter resources."
  value = {
    for key, value in google_access_context_manager_service_perimeter.standard :
    key => value
  }
}

output "perimeters_bridge" {
  description = "VPC-SC bridge perimeter resources."
  value = {
    for key, value in google_access_context_manager_service_perimeter.bridge :
    key => value
  }
}
