terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">= 0.1.0"
    }
  }
}

provider "azuredevops" {
    org_service_url = "https://dev.azure.com/TalanForma"
    personal_access_token = "upzqzdi7zi4eiijqv7y4mgz2h5vba4zeehv33u7ohkmzyd4vtonq"
}

resource "azuredevops_project" "project" {
  name        = "TerraformTuto"
  description = "tutorial deployment of a project using terraform"
}

resource "azuredevops_git_repository" "repoFront" {
  project_id = azuredevops_project.project.id
  name       = "FrontEnd"
  initialization {
    init_type = "Import"
    source_type = "Git"
    source_url = "https://github.com/Thomaspapaix/AngularHeroes.git"
  }
}

resource "azuredevops_git_repository" "repoBack" {
  project_id = azuredevops_project.project.id
  name       = "BackEnd"
  initialization {
    init_type = "Import"
    source_type = "Git"
    source_url = "https://github.com/Thomaspapaix/DotNetHeroes.git"
  }
}
