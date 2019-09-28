library(shiny)
library(googleComputeEngineR)
project = "scmerge"
zone = "us-central1-a"

gce_global_project(project)
gce_global_zone(zone)
(tag = "gcr.io/scmerge/shiny_docker:2c2d634")


server <- (function(input, output, session) {

    gcvm <- eventReactive(input$go, {
        vm_name <- paste(sample(letters, 5), collapse = "")
        vm <- gce_vm(template = "shiny",
                     name = vm_name,
                     disk_size_gb = 10,
                     predefined_type = "g1-small",
                     dynamic_image = tag)
        
        print_res = data.frame(
            vm_name = vm_name,
            status = vm$status,
            networkIP = vm$networkInterfaces$accessConfigs[[1]]$natIP 
        )
        return(print_res)
    })
    
    observe({ 
        output$text <- renderDataTable(gcvm()) 
    }) 
    
    
    kill <- eventReactive(input$kill, {
        googleComputeEngineR::gce_vm_delete(as.character(gcvm()$vm_name))
    })
    
    cancel.onSessionEnded <- session$onSessionEnded(function() {
        googleComputeEngineR::gce_vm_delete(as.character(gcvm()$vm_name))
    })
    
})

