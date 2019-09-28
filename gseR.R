library(googleComputeEngineR)
project = "scmerge"
zone = "us-central1-a"

gce_global_project(project)
gce_global_zone(zone)
# gce_get_project()
# gce_list_zones(project)
# View(gce_list_machinetype()$items)

(tag = "gcr.io/scmerge/shiny_docker:622256b")

vm <- gce_vm(template = "shiny", 
             name = "myapp",
             disk_size_gb = 10,
             predefined_type = "n1-standard-2",
             dynamic_image = tag)

gce_vm_delete("myapp")

vm <- gce_ssh_setup(vm,
                    username = "rstudio",
                    key.pub = "~/.ssh/id_rsa.pub",
                    key.private = "~/.ssh/id_rsa")

gce_ssh(vm, "pwd")
gce_ssh(vm, 'sudo find / -type d | grep "sample-apps"')