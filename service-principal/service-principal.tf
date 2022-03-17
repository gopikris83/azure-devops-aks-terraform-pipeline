##########################################################
# AKS Service Principal
##########################################################
data "azuread_client_config" "current" {
}

resource "azuread_application" "service-principal-app" {
  display_name = "tf-aks-service-principal"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "service-principal" {
  application_id               = azuread_application.service-principal-app.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "random_string" "service-principal-random-password" {
  length  = 16
  special = true

  keepers = {
    service_principal = "${azuread_service_principal.service-principal.id}"
  }
}

resource "time_rotating" "rotate_pwd" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "service-principal-password" {
  service_principal_id = azuread_service_principal.service-principal.object_id
  #value                = random_string.service-principal-random-password.result
  # 720h = 1 month, should be enough for this exercise.
  end_date = timeadd(timestamp(), "720h")
  lifecycle {
    ignore_changes = ["end_date"]
  }
  provisioner "local-exec" {
    command = "sleep 30"
  }

  rotate_when_changed = {
    rotation = time_rotating.rotate_pwd.id
  }

}