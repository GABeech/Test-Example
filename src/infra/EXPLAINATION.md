# Terraform

I'm generally looking for a few things in terraform code. These items should be present even in the most basic example. 

1. Using the [Terraform Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure) as a base
2. Variables have both descriptions and types set
3. Resource names are descriptive, and help you identify what you are working on
4. Provider version is pinned to at least the major version, preferably not locked to a specific minor version

## Examples

### Structure

In the root module, I wouldn't expect a `README.md` file, unless it was a very complex terrarform config. Generally, for root module documentation and instructions 
I would look at the `README.md` in the root of the repository. What I do look for is `main.tf,variables.tf and outputs.tf` even if `outputs.tf` is empty I like to see it in place.

### Variables

Even in the most basic terraform I like to see things variablized. This shows that the person writing the HCL is thinking about the future where things would be more complex. Starting
off with even the basic things setup as variables reduces refactoring in the future. 

#### Good variable example

As you can see below, the variable has a brief description that helps you know what is being set. For less self explainatory variables, I alos like to see examples in the
description. Additionally, a type is set. The type on simple variables may seem a bit redundant, but it shows a bit of attention to detail, so you know where you start
having more complex types they will be defined. If there is a default that makes sense, that should also be set, and documented in the description

```terraform
variable "gcp_project" {
  description = "The project to deploy these resources to"
  type = string
}```

```terraform
variable "responsible_team" {
  description = "This is the team that is responsible for this terraform code (default: SRE)"
  type = string
  default = "SRE"
}```

### Resource Naming

Naming is hard, but I look for descriptive names that help someone unfamiliar with the code easily identify what they are working on.

The two below examples, so both good naming (production_container_registry) and bad naming (gke_cluster). The reason I don't like something like `gke_cluster` is
I have no idea if it's dev/test/prod. This means it is harder to reason about what changes can be made safely, and where I need to look to validate changes where successful.

```terraform
resource "google_container_cluster" "gke_cluster" { #example of not a great name
  name = "test-gke-cluster"
  location = var.gcp_region
  enable_autopilot = true
}

resource "google_artifact_registry_repository" "production_container_registry" { #example of a good name
  location = var.gcp_region
  repository_id = var.registry_name
  description = "Docker Registry - Prod"
  format = "DOCKER"
}```

### Version Pinning

I like to see providers pinned to a major version, but allow using the minor version for bugfixes. With tools like dependabot I don't mind pining to a minor version as long as
the repo is setup to allow dependabot to make PRs to update the minor version of the provider.