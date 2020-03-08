shinyServer(function(input, output) {
    output$pred_table = renderDataTable({
        pred_cats_dogs(model = model, file_name = image())   
    })
    
    image <- reactive({
        req(input$url)
        file_name = paste0(getwd(), "/tmp.jpg")
        download.file(input$url, destfile = file_name)
        file_name
    })
    
    output$image <- renderPlot({
        plot(as.raster(jpeg::readJPEG(image())))
    })
})
