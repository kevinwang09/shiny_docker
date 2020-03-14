library(googleComputeEngineR)
project = "scpworkshop"
zone = "us-central1-a"

gce_global_project(project)
gce_global_zone(zone)
# gce_get_project()
# gce_list_zones(project)
# View(gce_list_machinetype()$items)


(tag = "gcr.io/scpworkshop/shiny_docker:608fa2d")

vm <- gce_vm(template = "shiny", 
             name = "catdog2",
             disk_size_gb = 20,
             predefined_type = "n1-standard-8",
             dynamic_image = tag)

gce_vm_delete("catdog")

vm <- gce_ssh_setup(vm,
                    username = "rstudio",
                    key.pub = "~/.ssh/id_rsa.pub",
                    key.private = "~/.ssh/id_rsa")

gce_ssh(vm, "pwd")
gce_ssh(vm, 'sudo find / -type d | grep "sample-apps"')