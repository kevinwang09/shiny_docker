shinyServer(function(input, output) {
    output$pred_table = renderDataTable({
        file_name = paste0(getwd(), "tmp.jpg")
        
        download.file(input$url,
                      destfile = file_name)
        
        pred_cats_dogs(model = model, file_name = file_name)   
    })
})
